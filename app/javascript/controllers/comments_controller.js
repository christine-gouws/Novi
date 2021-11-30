import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["button","form"]

  show(){
    this.formTarget.classList.toggle("d-none")
  }
}
