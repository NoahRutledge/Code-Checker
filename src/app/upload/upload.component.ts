import { Component, OnInit } from '@angular/core';
import {  FileUploader } from 'ng2-file-upload/ng2-file-upload';

@Component({
  selector: 'app-upload',
  templateUrl: './upload.component.html',
  styleUrls: ['./upload.component.css']
})
export class UploadComponent implements OnInit {
  public uploader:FileUploader = new FileUploader({url:'http://localhost:3000/upload', itemAlias: 'file'});
  title = 'app';
  ngOnInit() {
        this.uploader.onAfterAddingFile = (file)=> { file.withCredentials = false; };
        this.uploader.onCompleteItem = (item:any, response:any, status:any, headers:any) => {
             console.log("FileUpload:uploaded:", item, status, response);
         };
     }


}
