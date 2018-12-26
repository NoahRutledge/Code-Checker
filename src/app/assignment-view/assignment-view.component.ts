import { Component, OnInit } from '@angular/core';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {NavbarComponent} from '../navbar/navbar.component';
import {FooterComponent} from '../footer/footer.component';
import {Assignment } from '../models/assignment.model';
import{AssignmentService} from './assignment.service';
import{DataService} from "../data.service";

@Component({
  selector: 'app-assignment-view',
  templateUrl: './assignment-view.component.html',
  styleUrls: ['./assignment-view.component.css']
})
export class AssignmentViewComponent implements OnInit {
  //assignmentName = "Hello World";
  //assignmentSubmission = "Hello World submission";
  //assignmentGrade = "--/100";

  assignments: Assignment[];

  constructor(private assignmentService: AssignmentService, private data: DataService) {}

  message:string;

  selectedAssignment: Assignment;

  ngOnInit() {
    this.getAssignments();

  }

  getAssignments(): void {
    this.assignmentService.getAssignments()
        .subscribe(assignments => this.assignments = assignments);
            console.log(this.assignments);
  }

  onSelect(assignment: Assignment): void {
    this.selectedAssignment = assignment;
  }

  newMessage(){
    this.data.changeMessage(this.selectedAssignment.problemid, this.selectedAssignment.name, this.selectedAssignment.description, this.selectedAssignment.input ,this.selectedAssignment.output)
  }


}
