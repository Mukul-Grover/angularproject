import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { IProduct } from './interface/IProduct';
import { IOrder } from './interface/IOrder';
import { IlineItemOrder } from './interface/IlineItemOrder';


@Injectable({
  providedIn: 'root'
})
export class CommonService {


  private productUrlbyCategroy ='http://localhost:8080/products/category';

  private orderUrlbyCategroy ='http://localhost:8080/users/orders';

  private lineitemByOrderId ='http://localhost:8080/users/orders/lineitem';

  constructor(private http: HttpClient) { }

  getProductLIstBycategory(category:number):Observable<IProduct[]>{

    return this.http.get<IProduct[]>(this.productUrlbyCategroy + '/' + category);
  }

  getorderLIstBycategory(customer:number) :Observable<IOrder[]> {

    return this.http.get<IOrder[]>(this.orderUrlbyCategroy + '/' + customer);
  }

  getLineItemListbyOrderid(order:number):Observable<IlineItemOrder[]>{
    return this.http.get<IlineItemOrder[]>(this.lineitemByOrderId + '/' + order);

  }
  
}