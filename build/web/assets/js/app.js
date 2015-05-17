// wait  until all dom elements are loaded 
$(document).on('ready', function(){

	// remove item gets clciked
	$(document).off('click','.glyphicon-remove');
	$(document).on('click','.glyphicon-remove', function(){
      var $el = $(this);
     //  var inMyCart = $('#inMyCart').data('cart');
     //  alert("In mY cart " + inMyCart);

     //  var removeValue = $el.parent().parent().find('.quantity').text();
     // // alert("Remove Value" + removeValue);
     //  //alert("Am here!!");
     //  var newValue =  parseInt(inMyCart) - parseInt(removeValue);
     //  $('#inMyCart').data('cart',newValue);
     //  $('#inMyCart').text(newValue);
      $el.parent().parent().remove();
        $('.totals').find('.price').text('');
     calculateTotal ();
     
      var lengthOfItem = $('#addProduct li').length;
		if(lengthOfItem){
			$('#submit-cart').addClass('active');
			$('#navigation-menu').addClass('active');
		}else{
			$('#submit-cart').removeClass('active');
			$('#navigation-menu').removeClass('active');
		}
      // var removeElemet = $(this).data('elemntId');
      // $('#'+removeElemet).remove();


	});

	//when arrow button is clicked
	$(document).off('click','.popbtn');
	$(document).on('click','.popbtn', function(){
		var $elList = $(this).parent('li');
		var elemntId = $elList.data('code');
		//alert(elemntId);
		$('.glyphicon-remove').data('elemntId',elemntId);
		$('.glyphicon-pencil').data('elemntId',elemntId);

	});

	//when edit button is clicked
	$(document).off('click', '.glyphicon-pencil');
	$(document).on('click', '.glyphicon-pencil', function(){
	 var editElement = $(this).data('elemntId');
	// alert(editElement);
	 	$(this).parent().parent().find('.quantity').attr('contenteditable', 'true');
	 	//$('#'+editElement).find('.quantity').focus();
	});

	//check if the input type is numeric type or not
	$(document).off('keyup','#dvdQuantity');
	$(document).on('keyup','#dvdQuantity', function(){
		 var quantity = $(this).val();
		 var match = /^\d+$/.exec(quantity);
		 $('#msg').html('');
	       if (!match) {
	            $('#msg').html('Invalid ! Please provide valid number !!');
	       }else{
	       		$('#msg').html('');
	       }

	});

	//adding element to the cart
	$(document).off('click','.addbtn'); 
	$(document).on('click','.addbtn', function(){


		var addElmVal = $(this).parent().find('#dvdQuantity').val();
                var total = $(this).parent().find('#dvdQuantity').parent().data('total');
		var matchVal = /^\d+$/.exec(addElmVal);
		var inMyCart = $('#inMyCart').data('cart');
		var htmlElem = $('#addProduct');
		var productName = $(this).parent().find('.itemName').text();
		var productPrice = $(this).parent().find('.price').data('price');
		var productCode = $(this).parent().data('code');
		//alert(inMyCart);
		var addedValue , totalValue;
		if(matchVal){
			//alert("I am here");
			if(total >= addElmVal && total > 0){

			var template = "<li class='row dvd-inmy-cart' data-code='"+ productCode +"' id='"+ productCode+"' >"
						+ "<span class='quantity' id='selected-quanity' >"+ addElmVal+"</span>"
						+"<span class='itemName'>"+ productName+"</span>"
						+"<span class='price' data-price='"+productPrice+"'>$"+ productPrice
						+"<a href='#' class='glyphicon glyphicon-pencil'></a>"
						+ "<a href='#' class='glyphicon glyphicon-remove'></a>"
                                                +"<input type='hidden' name='quantity' value='"+addElmVal+"'>"
                                                +"<input type='hidden' name='productName' value='"+ productName+"'>"
						+"</span>"
					 +"</li>";
			 var elm = $('#'+productCode).length;
			 if(elm){
			 	var initialValue = $('#'+productCode).find('.quantity').text();
			 	//var finalValue = parseInt(initialValue) + parseInt(addElmVal);
			 	$('#'+productCode).find('.quantity').text(addElmVal);
			 	totalValue = parseInt(inMyCart) + parseInt(addElmVal);
			 }else{
			$(template).appendTo(htmlElem);
			 totalValue = parseInt(inMyCart) + parseInt(addElmVal);
		}
		  

	      $('.totals').find('.price').text();
          }//total value calculates 
          else if(total<=0){
              alert("Out of Stocks!");
          }
          else{
              alert("toatl exceeds");
          }
		}
	  //calaculates the length to show submit button 
	var lengthOfItem = $('#addProduct li').length;
	if(lengthOfItem){
		calculateTotal();
		$('#submit-cart').addClass('active');
		$('#navigation-menu').addClass('active');
	}else{
		$('#submit-cart').removeClass('active');
		$('#navigation-menu').removeClass('active');
	}

	});
function calculateTotal () {
		var totalAmount =0;
		var cartQuantity = 0;
		$( ".dvd-inmy-cart" ).each(function( index ) {
  			var quantity = $(this).find('.quantity').text();
  			var amount = $(this).find('.price').data('price');
  			console.log("quantity" + quantity, "Amount" +amount);
  			totalAmount += parseInt(quantity)* parseFloat(amount);
  			cartQuantity +=parseInt(quantity);
  			$('#total-amount').find('.price').text('$'+totalAmount);
  			console.log("Qunatity Final" + quantity , "Amount Final" + amount);
		});

			$('#inMyCart').text(cartQuantity);
			$('#inMyCart').data('cart',cartQuantity);
}
	// pagination purpose
	$('#paging_container-cat').pajinate({
		    num_page_links_to_display : 3,
		    items_per_page :3,
		    wrap_around: true,
		    show_first_last: false
	});
    $('#paging_container2').pajinate({
		    num_page_links_to_display : 3,
		    items_per_page :3,
		    wrap_around: true,
		    show_first_last: false
	});

    // for editable input 
    $(document).off('keyup','#selected-quanity');
    $(document).on('keyup','#selected-quanity', function(){
    	//alert("I am here !!");
    	 var editedQuantity = $(this).text();
    	 //alert(editedQuantity);
    	 var matchValue = /^\d+$/.exec(editedQuantity);
    	  $('#msg').html('');
    	 if(matchValue){
    	 	$(this).text(editedQuantity);
    	 	calculateTotal ();
    	 	$('#msg').html('');
    	 }else{
    	 	$('#msg').html('Invalid ! Please provide valid number !!');
    	 }

    });
	//   $('#paging_container3').pajinate({
	// 	    num_page_links_to_display : 3,
	// 	    items_per_page :3,
	// 	    wrap_around: true,
	// 	    show_first_last: false
	// });
	// show all categories 
	  $(document).off('click','#select-category');
	  $(document).on('click', '#select-category', function(event) {
	  	event.preventDefault();
	  	/* Act on the event */
	  	removeHidePortion();
	  	$('#select-category').addClass('active');
	  	$('#show-category').removeClass('hide');
	  	$('#show-cart').addClass('hide');
	  	$('#show-dvd').addClass('hide');

	  });
	// show all dvds 
	  $(document).off('click','#select-dvd');
	  $(document).on('click','#select-dvd', function(){
	  		removeHidePortion();
	  		$('#select-dvd').addClass('active');
	  		$('#show-category').addClass('hide');
	  		$('#show-cart').addClass('hide');
	  		
	  });

	  $(document).off('click','#my-cart');
	  $(document).on('click','#my-cart', function(){
	  		removeHidePortion();
	  		$('#my-cart').addClass('active');
	  		$('#show-category').addClass('hide');
	  		$('#show-dvd').addClass('hide');
	  });


	  function removeHidePortion(){
	  	$('#show-cart').removeClass('hide');
	  	$('#my-cart').removeClass('active');
	  	$('#select-dvd').removeClass('active');
	  	$('#show-dvd').removeClass('hide');
	  	$('#payment').removeClass('hide');
	  	$('#payment').removeClass('active');
	  	// show all category 
	  	$('#select-category').removeClass('active');
	  	$('#show-category').removeClass('hide');
	  }

    // Print Order when gets Clicked 
    $(document).off('click', '#print-order');
    $(document).on('click', '#print-order', function(){
    	window.print();
    });
    
    //when back buttom gets clicked 
    $(document).off('click','.show-back');
    $(document).on('click','.show-back', function(){
      
       $(this).parent().addClass('hide');
       $('#show-category').removeClass('hide');
    });
//    $('#show-cat-name').text()
	$(document).off('click','#show-cat-name');
        $(document).on('click','#show-cat-name',function(){
        var catId = $(this).data("catid");
        var xRequest1;
        if(window.XMLHttpRequest)
            {
                xRequest1=new XMLHttpRequest();
        }else{
               xRequest1=new ActiveXObject("Microsoft.XMLHTTP");

        }

        xRequest1.onreadystatechange=function (){
            if((xRequest1.readyState==4) && (xRequest1.status==200))
	            {
	                document.getElementById("show-dvd-cat-result").innerHTML=xRequest1.responseText;
	            }
    		}
            xRequest1.open("get","getCategory.jsp?catId="+catId,"true");
            xRequest1.send();
        
        
        
        
        
        //alert('suman');
     // console.log('testMine');
     
//       $.ajax({
//           url:'getCategory.jsp?catId='+catId,
//           dataType:'GET',
//           data: $('#show-cat-name').serialize(),
//           success:function(data){
//                   $('#show-dvd-cat-result').append(data);
//           },
//           error:function(response){
//               console.log("Response Data");
//               alert("couldnot make it "+response);
//               $('#show-dvd-cat-result').append(response);
//                $('#show-dvd-cat-result').html(response);
//           }
//       });
//       return false;
   }) ;
   $(document).on('click','#order-dvds', function(){
        var data = [];
        //$('.dvd-inmy-cart').children('span').text()
        $('.dvd-inmy-cart').each(function(){
             var $thatQuanity = $(this).children('span:first').text();
             var $thatName = $(this).children('span:nth-child(2)').text();
             var $thatPrice = $(this).children('span:last').data('price');
              data.push({"quantity":$thatQuanity,"name":$thatName ,"price":$thatPrice});
       // var $thatName = $(this).next().text();
         //data.push({"quantity":$thatQuanity,"name":$thatName});
            console.log("That Quantity is ", $thatQuanity);
            console.log("That Name is ", $thatName);
            console.log("That Price is",$thatPrice );
 
       });
      console.log("Data" + data);
       

       
       
       $.ajax({
            type: "post",
            url: "order.jsp", //this is my servlet
            
            //data:JSON.stringify(data),
            data:{data:data},
                success: function(msg){ 
                        alert("Transaction Successfull !!");
                        window.location.reload();
                        console.log("Message", msg);
                }
           
       });
   });

});