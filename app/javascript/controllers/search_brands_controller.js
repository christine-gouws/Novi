import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'full', 'mobile'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.fullTarget);
    console.log(this.mobileTarget);
  }
  update() {

  console.log(`${this.formTarget.action}?query=${this.inputTarget.value}`)
  const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
  fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {

      this.fullTarget.innerHTML = data;
      this.mobileTarget.innerHTML = data;

    })
}
}
