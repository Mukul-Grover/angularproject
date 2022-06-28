import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from './auth.service';
import { User } from './user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm!: any;
  isSubmitted  =  false;
  accessToken: string ="";

  constructor(private authService: AuthService, private router: Router, private formBuilder: FormBuilder ) { }

  ngOnInit(): void {
    this.loginForm  =  this.formBuilder.group({
      username: ['', Validators.required],
      password: ['', Validators.required]
  });
  }
  get formControls() { return this.loginForm.controls; }
  login(){
    
    console.log(this.loginForm.value);
    this.isSubmitted = true;
    if(this.loginForm.invalid){
      return;
    }
      this.authService.login(this.loginForm.value).subscribe(user=>{
        this.accessToken = user.password;
         console.log(this.accessToken);
         if(this.accessToken.length>1){
          sessionStorage.setItem('ACCESS_TOKEN', this.accessToken);
          this.router.navigateByUrl('/home');
        }
        else{
          this.router.navigateByUrl('/login');
        }
      }

      )
    
  }
  signUp(){
    this.router.navigateByUrl('/signup');
  }
}
