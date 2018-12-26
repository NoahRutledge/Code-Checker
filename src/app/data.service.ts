import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/BehaviorSubject';

@Injectable()
export class DataService {

  private problemidSource = new BehaviorSubject<number>(0);
  currentProblemId = this.problemidSource.asObservable();
  private nameSource = new BehaviorSubject<string>("default Tiitle");
  currentName = this.nameSource.asObservable();
  private descSource = new BehaviorSubject<string>("default Desc");
  currentDesc = this.descSource.asObservable();
  private inputSource = new BehaviorSubject<string>("default Input");
  currentInput = this.inputSource.asObservable();
  private outputSource = new BehaviorSubject<string>("default Output");
  currentOutput = this.outputSource.asObservable();

  constructor() { }

  changeMessage(problemid: number, name: string, description: string, input: string, output: string) {
    this.problemidSource.next(problemid)
    this.nameSource.next(name)
    this.descSource.next(description)
    this.inputSource.next(input)
    this.outputSource.next(output)

  }

}
