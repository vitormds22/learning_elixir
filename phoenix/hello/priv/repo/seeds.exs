for title <- ["Home Improvement", "Power Tools", "Gardening", "Books"] do
  {:ok, _} = Hello.Catalog.create_category(%{title: title})
end
