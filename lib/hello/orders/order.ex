defmodule Hello.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Orders.LineItem

  schema "orders" do
    field :total_price, :decimal
    field :user_uuid, Ecto.UUID

    has_many :line_items, LineItem
    has_many :products, through: [:line_items, :product]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:user_uuid, :total_price])
    |> validate_required([:user_uuid, :total_price])
  end
end
