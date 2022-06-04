import { Component, OnInit } from '@angular/core';
import { CommonService } from '../common.service';
import { IlineItemOrder } from '../interface/IlineItemOrder';
import { IOrder } from '../interface/IOrder';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit {

  constructor(private service: CommonService) { }

  orderList : IOrder[] | undefined;
  lineItemList : IlineItemOrder[] | undefined;
  orderdetailPresent:boolean=false;
  orderLineItemDisplayed = false;
  ngOnInit(): void {

    this.service.getorderLIstBycategory(1).subscribe(
      
      res => {this.orderList=res
      console.log(this.orderList);
        this.orderdetailPresent=true}
        );
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
