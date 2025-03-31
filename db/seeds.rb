Product.create!([
  { name: "Женский дождевик", description: "женский", price: 1000.00, image_url: "photo_5.jpg" },
  { name: "Женский костюм", description: "млн. баллов", price: 3000.00, image_url: "photo_2.jpg" },
  { name: "Мужские шорты", price: 2000.00, image_url: "photo_4.jpg" },
  { name: "Кроссовки Addidas", price: 2000.00, image_url: "photo_3.jpg" },
  { name: "Беспроводная колонка", price: 1000.00, image_url: "photo_1.jpg" }
])

CartItem.create!([
  { product_id: 1, quantity: 1 },
  { product_id: 2, quantity: 1 },
  { product_id: 3, quantity: 1 },
  { product_id: 4, quantity: 1 },
  { product_id: 5, quantity: 1 }
])
