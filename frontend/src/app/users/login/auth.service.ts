
import { Injectable } from '@angular/core';
import { User } from './user';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class AuthService {

  constructor(private http: HttpClient) { }

  public login(userInfo: User):Observable<User>{
    // let userData: User;
   return this.http.post<User>("http://localhost:8080/users/login"+"?username="+userInfo.username+
     "&password="+userInfo.password, userInfo);//.subscribe((result) =>{
   // console.log(result);
    //});
    
  }
 
  public isLoggedIn(){
    return sessionStorage.getItem('ACCESS_TOKEN') !== null;

  }

  public logout(){
    sessionStorage.removeItem('ACCESS_TOKEN');
  }
}