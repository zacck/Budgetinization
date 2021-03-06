defmodule Spender.Factories do
  @moduledoc """
  Ex Machina factories for application entities for testing
  """

  # with Ecto
  use ExMachina.Ecto, repo: Spender.Repo

  # Moneylog Factory
  def moneylog_factory do
    %Spender.MoneyLogs.Moneylog {
      name: sequence(:name, &"moneylog-#{&1}"),
      start_date: Date.utc_today,
      end_date: Date.add(Date.utc_today, 5),
      owner: build(:owner)
  }
  end

  # User Factory
  def user_factory do
    %Spender.Accounts.User{
      email: sequence(:email, &"user-#{&1}-email.com"),
      token: sequence(:token, &"user-#{&1}-token"),
      provider: sequence(:provider, &"user-#{&1}-provider")
    }
  end

  # Owner Factory
  def owner_factory do
    %Spender.MoneyLogs.Owner{
      name: sequence(:name, &"owner-#{&1}"),
      user: build(:user)
    }
  end

  def wishlist_item_factory do
    %Spender.WishList.Item{
      name: sequence(:name, &"item-#{&1}"),
      price: 24.78,
      moneylog: build(:moneylog)
    }
  end

  def log_section_factory do
    %Spender.Planning.LogSection{
      name: sequence(:name, &"section-#{&1}"),
      moneylog: build(:moneylog)
    }
  end

  def income_log_factory do
    %Spender.Planning.IncomeLog{
      name: sequence(:name, &"income-#{&1}"),
      amount: 5690.90,
      moneylog: build(:moneylog)
    }
  end

  def logcategory_factory do
    %Spender.Planning.LogCategory{
      name: sequence(:name, &"category-#{&1}"),
      moneylog: build(:moneylog)
    }
  end

  {:ok, _} = Application.ensure_all_started(:ex_machina)
end
