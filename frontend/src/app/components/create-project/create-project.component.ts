import { Component, EventEmitter, Output } from "@angular/core";
import { FormControl, FormGroup, Validators } from "@angular/forms";

@Component({
  selector: "create-project-form",
  templateUrl: "./create-project.component.html"
})
export class CreateProjectComponent {
  @Output() onCancel = new EventEmitter<any>()
  @Output() onSubmit = new EventEmitter<any>();
  public createProjectForm = new FormGroup({
    name: new FormControl("", [Validators.required]),
    description: new FormControl("", [Validators.required]),
    deadline: new FormControl("", [Validators.required]),
    budget: new FormControl("", [Validators.required]),
    category: new FormControl("", [Validators.required]),
    reward: new FormControl("", [Validators.required])
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
