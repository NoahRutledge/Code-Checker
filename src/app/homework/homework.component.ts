import { Component, OnInit } from '@angular/core';
import { DataService } from "../data.service";
import {  FileUploader } from 'ng2-file-upload/ng2-file-upload';

@Component({
  selector: 'app-homework',
  templateUrl: './homework.component.html',
  //template: 'Message: {{message}}',
  styleUrls: ['./homework.component.css']
})
export class HomeworkComponent implements OnInit {

  problemid:number;
  name:string;
  desc:string;
  input:string;
  output:string;


  public uploader:FileUploader;


  constructor(private data: DataService) { }

  ngOnInit() {
    this.data.currentProblemId.subscribe(problemid => this.problemid = problemid);
    this.data.currentName.subscribe(name => this.name = name),
    this.data.currentDesc.subscribe(desc => this.desc = desc),
    this.data.currentInput.subscribe(input => this.input = input),
    this.data.currentOutput.subscribe(output => this.output = output);
    this.uploader = new FileUploader({url:'http://localhost:3000/upload',additionalParameter: {
        problemid: this.problemid
      },itemAlias: 'file'});
    this.uploader.onAfterAddingFile = (file)=> { file.withCredentials = false; };
    this.uploader.onCompleteItem = (item:any, response:any, status:any, headers:any) => {
         console.log("FileUpload:uploaded:", item, status, response);
     };

  }



}
