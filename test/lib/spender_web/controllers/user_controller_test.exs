defmodule SpenderWeb.UserControllerTest do
  use SpenderWeb.ApiCase

  alias Spender.Accounts

  @create_attrs %{email: "some email", provider: "some provider", token: "sometoken", first_name: "Zacck", last_name: "Osiemo"}
  @update_attrs %{email: "some updated email", provider: "some updated provider", token: "someupdatedtoken"}
  @invalid_attrs %{avatar: "", email: ""}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  describe "index" do
    @tag :authenticated
    test "lists all users", %{conn: conn, current_user: _user} do
      conn = get conn, user_path(conn, :index)
      assert json_response(conn, 200)["data"]
    end
  end

  describe "create user" do
    @tag :authenticated
    test "renders user when data is valid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @create_attrs
      assert json_response(conn, 201)["data"]
    end

    @tag :authenticated
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, user_path(conn, :create), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    @tag :authenticated
    test "renders user when data is valid", %{conn: conn, current_user: user} do
      conn = put conn, user_path(conn, :update, user), user: @update_attrs
      assert json_response(conn, 200)["data"]
    end

    @tag :authenticated
    test "renders errors when data is invalid", %{conn: conn, current_user: user} do
      conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
