import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity"]

  updateDiscount(event) {
    const discount = event.target.value
    const url = new URL(window.location.href)
    url.searchParams.set('discount', discount)
    window.location.href = url.toString()
  }

  reset() {
    if (confirm("Вы уверены, что хотите очистить корзину?")) {
      fetch(`/cart/reset`, {
        method: "POST",
        headers: {
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
          "Accept": "text/html"
        }
      }).then(response => {
        if (response.redirected) {
          window.location.href = response.url
        }
      })
    }
  }

  commit() {
    fetch(`/cart/reset`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        "Accept": "text/html"
      }
    }).then(response => {
      if (response.redirected) {
        window.location.href = response.url
      }
    })
  }
}
