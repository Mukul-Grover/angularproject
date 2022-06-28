import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CommonService } from '../common.service';
import { IlineItemOrder } from '../interface/IlineItemOrder';
import { IOrder } from '../interface/IOrder';
import { AuthService } from '../users/login/auth.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit {
  [x: string]: any;

  constructor(private service: CommonService, private router: Router,private authService: AuthService) { }

  orderList : IOrder[] | undefined;
  lineItemList : IlineItemOrder[] | undefined;
  orderdetailPresent:boolean=false;
  orderLineItemDisplayed = false;
  ngOnInit(): void {
    if(this.authService.isLoggedIn()){
      this.service.getorderLIstBycategory(1).subscribe(
      
        res => {this.orderList=res
        console.log(this.orderList);
          this.orderdetailPresent=true}
          );

    }
    else{
      this.router.navigateByUrl('/login');
    }



    
  }

  lineItem(id:number){
    this.service.getLineItemListbyOrderid(id).subscribe(
      res => {
        this.lineItemList = res;
        this.orderLineItemDisplayed= true;
        (document.getElementById("myModal") as HTMLInputElement).style.display="block";
        (document.getElementById("myModal") as HTMLInputElement).classList.remove('fade');
      }
    )
  }

  ngDoCheck(){
    
  }

  closeModal(){
    (document.getElementById("myModal") as HTMLInputElement).style.display="none";
  }
}
