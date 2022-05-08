import { Component, DoCheck, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit,DoCheck{

  constructor(private router:Router) { }
  currentUrl="";
  
  products=['Mobiles','Laptops','Headphones'];
  showDropdown = false;
  ngOnInit(): void {
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


}
