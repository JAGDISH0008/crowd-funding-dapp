import { Component, EventEmitter, Output } from "@angular/core";
import { FormControl, FormGroup } from "@angular/forms";

@Component({
  selector: "create-project-form",
  templateUrl: "./create-project.component.html"
})
export class CreateProjectComponent {
  @Output() onCancel = new EventEmitter<any>()
  @Output() onSubmit = new EventEmitter<any>();
  public createProjectForm = new FormGroup({
    name: new FormControl(""),
    description: new FormControl(""),
    deadline: new FormControl(""),
    budget: new FormControl(""),
    category: new FormControl(""),
    reward: new FormControl("")
  })

  constructor() { }
  submit() {
    this.onSubmit.emit(this.createProjectForm.value);
    this.createProjectForm.reset();
  }
  cancel() {
    this.createProjectForm.reset();
    this.onCancel.emit();
  }
}
