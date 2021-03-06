
<%@page import="com.admin.DBConnec"%>
 <% 
       DBConnec dbShowAll =new DBConnec();
       dbShowAll.stmt=dbShowAll.con.prepareStatement("SELECT id,quantity ,remaining FROM `products`");
//              out.println(dbShowCatId.stmt);
       dbShowAll.Rs=dbShowAll.stmt.executeQuery();
        while(dbShowAll.Rs.next()){ 
                   String id = dbShowAll.Rs.getString(1);
                   Integer totalQuantity = dbShowAll.Rs.getInt(2);
                   Integer purchased = dbShowAll.Rs.getInt(3);
                   Integer quantity = totalQuantity -purchased;
                  DBConnec dbShowUpdate =new DBConnec(); 
                   dbShowUpdate.stmt=dbShowUpdate.con.prepareStatement("update products set quantity=?, remaining=? where id=?");
   //System.out.println(dbAddCartResult.stmt); 
                    dbShowUpdate.stmt.setInt(1, quantity);
                    dbShowUpdate.stmt.setInt(2, 0);
                    dbShowUpdate.stmt.setString(3, id);
                    dbShowUpdate.rs = dbShowUpdate.stmt.executeUpdate();
        }
             %>
<!DOCTYPE html>
<html>
	<head>
		<title>Shopping Cart</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" type="text/css" href="assets/css/paginate.css"/>
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="assets/css/custom.css"/>		
	</head>


	<body>
		
		<nav class="navbar">
			<div class="container">
				<a class="navbar-brand" href="#">DVD SHOPPING CART</a>
				<div class="navbar-right">
					<div class="container minicart"> <span class="badge" id="inMyCart" data-cart="0">0</span></div>
				</div>
			</div>
		</nav>
		
		<div class="container-fluid breadcrumbBox text-center">
			<ol class="breadcrumb">
				<li class="active" id="select-category"><a href="#">Select  Category</a></li>
				<li id="select-dvd"><a href="#">Show DVD</a></li>
				<li id ="my-cart" ><a href="#">In My Cart</a></li>
				<li id="payment"><a href="#">Payment</a></li>
			</ol>
		 	<div class="text-danger text-center" id="msg"> </div>
		</div>
		<div class="container text-center" id="show-category">

			<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>Select DVD Category</h1>
				<p>
					This is a simple and <b><a href="http://www.sumn2u-sumankunwar.rhcloud.com" title="Read the article!">responsive shopping cart which help in further transaction process</a></b>. It looks nice on both desktop and mobile browsers. Try it by resizing your window (or opening it on your smartphone and pc).Select the category you like and then try adding dvd's you like :-)
				</p>
			</div> 
			 
				<div class="col-md-7 col-sm-12 text-left container" id="paging_container-cat">
			    <div class="row list-inline columnCaptions" >
						<span> Category</span>
						
				</div>
				<ul class="content">
					       <%
                                        
            
               DBConnec dbShowCat =new DBConnec();
              dbShowCat.stmt=dbShowCat.con.prepareStatement("SELECT id, cat_name from tbl_category where publish ='1'");
              
              dbShowCat.Rs=dbShowCat.stmt.executeQuery(); 
               while(dbShowCat.Rs.next()){ 
                    String id = dbShowCat.Rs.getString(1);
                   String catName= dbShowCat.Rs.getString(2);
                                               
		
		%>
					<li class="row" id="show-cat-name" data-catid="<%=id%>">
						<%= catName%>				
					</li>
                                        <%}%>
					<!-- <li class="row totals">
						<span class="itemName">Total:</span>
						<span class="price">$1694.43</span>
						<span class="order"> <a class="text-center">ORDER</a></span>
					</li> -->
				</ul>
				<div class="page_navigation"></div>
			</div>
		

		</div>
		<div class="container text-center hide" id="show-dvd">
<!--                    <div class="show-back"> Back </div>-->
			<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>Select Your DVD</h1>
				<p>
					This is a simple and <b><a href="http://www.sumn2u-sumankunwar.rhcloud.com" title="Read the article!">responsive shopping cart which help in further transaction process</a></b>. It looks nice on both desktop and mobile browsers. Try it by resizing your window (or opening it on your smartphone and pc). Try adding dvd's you like :-)
				</p>
			</div> 
			   
				<div class="col-md-7 col-sm-12 text-left container" id="paging_container2">
			    <div class="row list-inline columnCaptions" >
						<span>QTY</span>
						<span>ITEM</span>
						<span>Price</span>
					
				</div>
                                  
				<ul class="content" id="show-dvd-cat-result">
<!--					<li class="row" data-code="p001"  >
						<span class="quantity">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName">Birthday Cake</span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="49.95">$49.95</span>
					</li>
					<li class="row" data-code="p002"  >
						<span class="quantity">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName">Party Cups</span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="4.00">$5.00</span>
					</li>
					<li class="row" data-code="p003" >
						<span class="quantity">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName">Beer kegs</span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="919.99">$919.99</span>				
					</li>
					<li class="row" data-code="p004"  >
						<span class="quantity">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName">Pound of beef</span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="269.45">$269.45</span>
					</li>
					<li class="row" data-code ="p005">
						<span class="quantity">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName">Bullet-proof vest</span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="450.00">$450.00</span>				
					</li>-->
					<!-- <li class="row totals">
						<span class="itemName">Total:</span>
						<span class="price">$1694.43</span>
						<span class="order"> <a class="text-center">ORDER</a></span>
					</li> -->
				</ul>
                                  
				<div class="page_navigation"></div>
			</div>
                           
		

		</div>

		<div class="container text-center hide" id="show-cart">
<!--                        <div class="show-back"> Back </div>-->
		 	<div class="col-md-5 col-sm-12">
				<div class="bigcart"></div>
				<h1>DVD's in my cart !</h1>
				<p>
					You have added <b><a href="http://www.sumn2u-sumankunwar.rhcloud.com" title="Read the article!">DVD's in your shopping cart </a></b>. Try adding more dvd's you like :-)
				</p>
			</div> 
			
		
			<div class="col-md-7 col-sm-12 text-left container" id="paging_container3">
			    <div class="row list-inline columnCaptions" >
						<span>QTY</span>
						<span>ITEM</span>
						<span>Price</span>
				</div>
                      
				<ul class="content" id="addProduct">
					
					
				 	<li class="row totals" id="total-amount">
                                            
						<span class="itemName">Total:</span>
						<span class="price">$</span>
						<span class="order"> <button type="submit" class="text-center btn btn-primary btn-lg"" id="order-dvds">ORDER</button></span>
                                                <!--<span class="order"><input type="image" src="https://www.paypalobjects.com/en_US/i/btn/x-click-but6.gif" border="0" name="submit" alt="Make payments with PayPal - it's fast, free and secure!" id="order-dvds"></span>-->
					</li> 
                                        
                                        
				</ul>
                            <div id="payment-gateway" class="hide">
                               
    <div class="col-xs-6 text-left">
        <div class="previous">
                   <form name="paypalForm" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">


<input type="image" src="assets/images/paypal.gif" border="0" name="submit" alt="Make payments with PayPal - it" s="" fast,="" free="" and="" secure!'="">
</form>
        </div>
    </div>
    <div class="col-xs-6 text-right">   
        <div class="next">
         <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
 Cash on Delivery
</button>
        </div>
    </div>
                  

                            </div>
                           
                            
				<!-- <div class="page_navigation" id="navigation-menu"></div> -->
                                
				<a class="btn pull-right" type="submit" id="print-order"> Print Order</a> 
                            
			</div>


		</div>
                                    


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
<!--        <form name="form" id="form" method="post">
        <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Username</th>
			<td><input type="text" name="uname" value=""  class="login-inp" /></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="upass" value=""  onfocus="this.value=''" class="login-inp" required/></td>
		</tr>
		<tr>
			<th></th>
			<td valign="top">&nbsp;</td>
		</tr>
		<tr>
			<th></th>
			<td><input type="submit" name="login" class="submit-login"  /></td>
		</tr>
		</table>
        </form>-->
        <form name="buyers-info" id="form" method="post">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> Buyer's Information</h4>
      </div>
      <div class="modal-body">
      <div class="row">
            <div class="form-group col-xs-6">
                <label for="firstname" class="sr-only"></label>
                <input id="firstname" class="form-control input-group-lg reg_name" type="text" name="firstname"
                       title="Enter first name"
                       placeholder="First name"/>
            </div>

            <div class="form-group col-xs-6">
                <label for="lastname" class="sr-only"></label>
                <input id="lastname" class="form-control input-group-lg reg_name" type="text" name="lastname"
                       title="Enter last name"
                       placeholder="Last name"/>
            </div>
        </div>
           <div class="row">
         <!--  client email -->
      <div class="form-group col-xs-12" id="email-input">
        <label class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" name="email" class="form-control" placeholder="example@example.com" >
        </div>
      </div>
           </div>
         <div class="row">
            <div class="form-group col-xs-6">
                <label for="phone" class="sr-only"></label>
                <input id="phone" class="form-control input-group-lg reg_name" type="text" name="phone"
                       title="Enter your phone number"
                       placeholder="Phone"/>
            </div>

            <div class="form-group col-xs-6">
                <label for="lastname" class="sr-only"></label>
                <input id="address" class="form-control input-group-lg reg_name" type="text" name="address"
                       title="Enter your address"
                       placeholder="Address"/>
            </div>
        </div>
           <div class="row">
            <div class="form-group col-xs-6">
                <label for="firstname" class="sr-only"></label>
                <input id="firstname" class="form-control input-group-lg reg_name" type="text" name="city"
                       title="Enter city"
                       placeholder="City"/>
            </div>

            <div class="form-group col-xs-6">
                <label for="lastname" class="sr-only"></label>
                <input id="lastname" class="form-control input-group-lg reg_name" type="text" name="postalcode"
                       title="Enter Postal code"
                       placeholder="Postal Code"/>
            </div>
        </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" id="buyers-info-sub" class="btn btn-primary">Save</button>
      </div>
        </form>
    </div>
  </div>
</div>

		<!-- The popover content -->

		
		<!-- JavaScript includes -->

		<script src="assets/js/jquery.js"></script> 
		<script src="assets/js/jquery.paginate.js"></script>
                <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="assets/js/last.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/customjs.js"></script>

	</body>
</html>