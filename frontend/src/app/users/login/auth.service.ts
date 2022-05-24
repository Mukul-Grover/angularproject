
import { Injectable } from '@angular/core';
import { User } from './user';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class AuthService {

  constructor(private http: HttpClient) { }

  public login(userInfo: User){
     
    this.http.post("http://localhost:8080/users/login"+"?username="+userInfo.username+ "&password="+userInfo.password, userInfo).subscribe((result) =>{
   
    console.log(result);
    });
    localStorage.setItem('ACCESS_TOKEN', "access_token");
  }
 
  public isLoggedIn(){
    return localStorage.getItem('ACCESS_TOKEN') !== null;

  }

  public logout(){
    localStorage.removeItem('ACCESS_TOKEN');
  }
}