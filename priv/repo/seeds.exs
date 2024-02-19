# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hello.Repo.insert!(%Hello.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for title <- ["Home Improvement", "Power Tools", "Gardening", "Books", "education"] do
  {:ok, _} = Hello.Catalog.create_category(%{title: title})
end

for product <- [
      %{
        title: "Como ler livros",
        description: "O guia clássico para a leitura inteligente",
        price: 107.51,
        views: 0,
        category_ids: [4, 5]
      },
      %{
        title: "As Ideias Têm Consequências",
        description:
          "Em um livro que se tornou um clássico, Richard M. Weaver diagnostica impiedosamente as doenças de nossa época, oferecendo uma solução realista.",
        price: 63.91,
        views: 0,
        category_ids: [4]
      },
      %{
        title: "Apologia De Sócrates",
        description:
          "A Apologia de Sócrates de Platão é o registro de uma das defesas mais famosas e polêmicas da história do Direito e da Justiça ocidentais.",
        price: 18.87,
        views: 0,
        category_ids: [4, 5]
      }
    ] do
  {:ok, _} = Hello.Catalog.create_product(product)
end
