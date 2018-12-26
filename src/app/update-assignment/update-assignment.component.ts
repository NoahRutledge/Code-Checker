import { Component, OnInit } from '@angular/core';
import {BrowserModule} from '@angular/platform-browser'
import {Assignment } from '../models/assignment.model';
import{AssignmentService} from '../assignment-view/assignment.service';
@Component({
  selector: 'app-update-assignment',
  templateUrl: './update-assignment.component.html',
  styleUrls: ['./update-assignment.component.css']
})

export class UpdateAssignmentComponent {
  // selectedAssignment:Assignment = new Assignment(2, 'YorHa');

  assignments: Assignment[];

  constructor(private assignmentService: AssignmentService) {}


  selectedAssignment: Assignment;

  ngOnInit() {
    this.getAssignments();

  }

  getAssignments(): void {
    this.assignmentService.getAssignments()
        .subscribe(assignments => this.assignments = assignments);
            console.log(this.assignments);
  }
}

// export class UpdateAssignmentComponent implements OnInit {
//
//   constructor() { }
//
//   ngOnInit() {
//   }
//
// }
