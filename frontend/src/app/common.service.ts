import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { IProduct } from './interface/IProduct';


@Injectable({
  providedIn: 'root'
})
export class CommonService {

  private productUrlbyCategroy ='http://localhost:8080/products/category';

  constructor(private http: HttpClient) { }

  getProductLIstBycategory(category:number):Observable<IProduct[]>{

    return this.http.get<IProduct[]>(this.productUrlbyCategroy + '/' + category);
  }
  
}