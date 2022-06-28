import { Component, DoCheck, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../users/login/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit,DoCheck{

  constructor(private router:Router, private authService: AuthService) { }
  currentUrl="";
  
  products=['Mobiles','Laptops','Headphones'];
  showDropdown = false;
  isLoggedIn= false;
  ngOnInit(): void {
    if(this.authService.isLoggedIn()){
      this.isLoggedIn= true;
    }
  }

  order(){
    if(!this.isLoggedIn){
      alert("Please login first");
    }
    else{
      this.router.navigateByUrl('/order');
    }
  }

  ngDoCheck(){
    if(this.showDropdown && this.currentUrl!=this.router.url){
      this.showDropdown=false;
    }
    this.currentUrl=this.router.url;
  }

  dropdown(){
    this.showDropdown= !this.showDropdown ;
  }
  logOut(){
    this.authService.logout();
    this.isLoggedIn= false;
    this.router.navigateByUrl('/home');
  }

}
