import { Injectable } from '@angular/core';
import { ASSIGNMENTS } from '../mockData/mockAssignments';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Assignment } from '../models/assignment.model';

@Injectable()
export class AssignmentService {

  constructor(private http: HttpClient) { }
  private assignmentUrl = '/assignment-view';
  getAssignments(): Observable<Assignment[]>{
    return this.http.get<Assignment[]>(this.assignmentUrl)
  }

}
