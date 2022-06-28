import { Injectable } from '@angular/core';
import { User } from '../login/user';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {
  constructor(private http: HttpClient) { }

  public register(userInfo: User):Observable<User>{
   return this.http.post<User>("http://localhost:8080/users", userInfo);
  }
}
