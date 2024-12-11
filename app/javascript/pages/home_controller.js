import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["searchInput"]

  search(event) {
    // Implement your search functionality here
    console.log(`Searching for: ${this.searchInputTarget.value}`)
  }
}
