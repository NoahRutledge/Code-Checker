import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import {LoginComponent} from './login/login.component';
import {AssignmentViewComponent} from './assignment-view/assignment-view.component';
import {HomeworkComponent} from './homework/homework.component';
import {UploadComponent} from './upload/upload.component';
import {SignupComponent} from './signup/signup.component';
import {CreateAssignmentComponent} from './create-assignment/create-assignment.component';
import {UpdateAssignmentComponent} from './update-assignment/update-assignment.component';
const routes: Routes = [
    {path: '', redirectTo: '/login', pathMatch:'full'},
    {path: 'login', component: LoginComponent },
    {path: 'assignment-view', component: AssignmentViewComponent },
    {path: 'homework', component: HomeworkComponent},
    {path: 'upload', component: UploadComponent},
    {path: 'signup', component: SignupComponent},
    {path: 'createAssignment', component: CreateAssignmentComponent},
    {path: 'updateAssignment', component: UpdateAssignmentComponent}

];

@NgModule({
  imports: [
    RouterModule.forRoot(routes)
  ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
