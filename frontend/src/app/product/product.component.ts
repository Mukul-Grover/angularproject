import { Component, DoCheck, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CommonService } from '../common.service';
import { IProduct } from '../interface/IProduct';


@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  constructor(private route: ActivatedRoute, private router:Router,private service: CommonService ) { }


  products:String="";
  currentUrl="";
  productList:IProduct[] | undefined;

  ngOnInit(): void {
   this.route.params.subscribe(params => {
      this.products = params['product'].toUpperCase();
      });
      console.log(this.products);
  }

  ngDoCheck(){
    if(this.currentUrl!=this.router.url){
      var category:number=1;
      if(this.products=='MOBILES'){
        category=1;
      }
      else if(this.products=='LAPTOPS'){
        category=3;
      }
      else if(this.products=='HEADPHONES'){
        category=2;
      }
      this.service.getProductLIstBycategory(category).subscribe(
        res => this.productList=res);
    }
    this.currentUrl=this.router.url;
  }


}