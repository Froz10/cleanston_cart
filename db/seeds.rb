Product.create!([
  { name: "Полуразмеры молока бойцуют", description: "высший фильм", price: 1000.00 },
  { name: "Хорошо диапазон потоков", description: "млн. баллов", price: 3000.00 },
  { name: "Генерационные ресурсы", price: 2000.00 },
  { name: "Вторые нужды", price: 2000.00 },
  { name: "Передача свободы может сразу после", price: 1000.00 }
])

CartItem.create!([
  { product_id: 1, quantity: 1 },
  { product_id: 2, quantity: 1 },
  { product_id: 3, quantity: 1 },
  { product_id: 4, quantity: 1 },
  { product_id: 5, quantity: 1 }
])