import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { AuthService } from '../login/auth.service';
import { RegisterService } from './register.service';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SignUpComponent implements OnInit {
  signupForm!: any;
  isSubmitted  =  false;

  constructor( private registerService: RegisterService, private router: Router, private formBuilder: FormBuilder ) { }

  ngOnInit(): void {
    this.signupForm  =  this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      username: ['', Validators.required],
      password: ['', Validators.required]
  });
  }
  get formControls() { return this.signupForm.controls; }
  signup(){
    console.log(this.signupForm.value);
    this.isSubmitted = true;

    if(this.signupForm.invalid){
      return;
    }
    this.registerService.register(this.signupForm.value);
    this.router.navigateByUrl('/login');
  }
}
