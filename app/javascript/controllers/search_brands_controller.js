import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'mlist', 'flist'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.listTarget);
  }
  update() {

  console.log(`${this.formTarget.action}?query=${this.inputTarget.value}`)
  const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
  fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => {

      console.log(data)
      this.mlistTarget.innerHTML = data;
      this.flistTarget.innerHTML = data;

    })
}
}
