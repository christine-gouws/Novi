import { get } from "jquery"
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["stars"]
  connect() {
    console.log(this.starTarget)

  }
}
