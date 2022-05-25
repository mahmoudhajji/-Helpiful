import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log("The 'category' controller is now loaded!");
  }

  index(event) {
    const target = event.params.id;
    window.open(`https://helpiful.herokuapp.com//requests?search%5Bcategory%5D=${target}&search%5Bcity%5D=`,"_self");
  }






}
