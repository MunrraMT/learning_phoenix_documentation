defmodule Hello.ShoppingCart.CartItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hello.Catalog.Product
  alias Hello.ShoppingCart.Cart

  schema "cart_items" do
    field :price_when_carted, :decimal
    field :quantity, :integer

    belongs_to :cart, Cart
    belongs_to :product, Product

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:price_when_carted, :quantity])
    |> validate_required([:price_when_carted, :quantity])
    |> validate_number(:quantity, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
  end
end
