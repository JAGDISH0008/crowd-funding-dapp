import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { CreateProjectComponent } from '../../components/create-project/create-project.component';
import { HeaderComponent } from './header.component';

@NgModule({
  declarations: [
    HeaderComponent,
    CreateProjectComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [],
  exports: [
    HeaderComponent
  ]
})
export class HeaderModule { }
