import { get } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["clickable", "form"]
  connect() {
    console.log(this.starTarget)

  }
  submit(e) {
    this.formTarget.submit()
  }
}
