import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { OrdersComponent } from './orders/orders.component';
import { ProductComponent } from './product/product.component';
import { LoginComponent } from './users/login/login.component';
import { SignUpComponent } from './users/sign-up/sign-up.component';

const routes: Routes = [

  {path:'home',component:HomeComponent},
  {path:'',component:HomeComponent},
  {path:'products/:product',component:ProductComponent},
  {path:'*',component:HomeComponent},
  {path:'login',component:LoginComponent},
  {path:'signup',component:SignUpComponent},
  {path:'order',component:OrdersComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
