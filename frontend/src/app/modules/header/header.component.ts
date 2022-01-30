import { Component } from "@angular/core";

@Component({
  selector: "app-header",
  templateUrl: "./header.component.html",
  styleUrls: ["./header.component.scss"]
})
export class HeaderComponent {
  public displayStyle = "none";
  constructor() { }
  openPopup() { this.displayStyle = "block"; }
  closePopup() { this.displayStyle = "none"; }
  OnSubmit($event: any) {
    console.log($event);
  }
}