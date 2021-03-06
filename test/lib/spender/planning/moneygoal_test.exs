defmodule Spender.Planning.MoneyGoalTest do
  use Spender.DataCase

  alias Spender.Planning.MoneyGoal

  @valid_attrs %{name: "Camera", price: 10000.3}
  @invalid_attrs %{}

  test "returns valid changeset with valid data" do
    changeset = MoneyGoal.changeset(%MoneyGoal{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset should be invalid if the data is invalid" do
    changeset = MoneyGoal.changeset(%MoneyGoal{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "should associate a MoneyGoal to a moneylog" do
    moneylog = insert(:moneylog)
    changeset = MoneyGoal.create_changeset(moneylog, @valid_attrs)
    assert changeset.valid?
    assert changeset.changes.moneylog
  end
end
