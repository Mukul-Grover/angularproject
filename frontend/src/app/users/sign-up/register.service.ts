import { Injectable } from '@angular/core';
import { User } from '../login/user';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {
  constructor(private http: HttpClient) { }

  public register(userInfo: User){
   return this.http.post("http://localhost:8080/users", userInfo).subscribe((result) =>{
    console.log(result);
    });
  }
}
