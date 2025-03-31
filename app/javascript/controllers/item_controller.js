import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity"]
  static values = { id: Number }

  async updateQuantity(quantity) {
    const response = await fetch(`/cart_items/${this.idValue}`, {
      method: "PATCH",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html"
      },
      body: JSON.stringify({ cart_item: { quantity } })
    }).then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }

  increase() {
    const current = parseInt(this.quantityTarget.textContent)
    this.updateQuantity(current + 1)
  }

  decrease() {
    const current = parseInt(this.quantityTarget.textContent)
    if (current > 1) {
      this.updateQuantity(current - 1)
    }
  }

  async remove() {
    if (confirm("Удалить товар из корзины?")) {
      const response = await fetch(`/cart_items/${this.idValue}`, {
        method: "DELETE",
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
          "Accept": "text/vnd.turbo-stream.html"
        }
      }).then (response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
    }
  }
}
