import { AppComponent } from './app.component'
import { LoginComponent } from './login/login.component';
import { AppRoutingModule } from './app-routing.module';
import { AssignmentViewComponent } from './assignment-view/assignment-view.component';
import { HomeworkComponent } from './homework/homework.component';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { UploadComponent } from './upload/upload.component';
import { FileSelectDirective } from 'ng2-file-upload';
import { SignupComponent } from './signup/signup.component';
import { NavbarComponent } from './navbar/navbar.component';
import { FooterComponent } from './footer/footer.component';
import { AssignmentService } from './assignment-view/assignment.service';
import {DataService} from './data.service';
import { HttpClientModule }    from '@angular/common/http';
import { CreateAssignmentComponent } from './create-assignment/create-assignment.component';
import { UpdateAssignmentComponent } from './update-assignment/update-assignment.component';



@NgModule({
  declarations: [

    AppComponent,
    LoginComponent,
    AssignmentViewComponent,
    HomeworkComponent,
    UploadComponent,
    FileSelectDirective,
    SignupComponent,
    NavbarComponent,
    FooterComponent,
    CreateAssignmentComponent,
    UpdateAssignmentComponent
  ],
  imports: [
    BrowserModule, AppRoutingModule,HttpClientModule, NgbModule.forRoot()

  ],
  providers: [AssignmentService, DataService],
  bootstrap: [AppComponent]
})
export class AppModule { }
