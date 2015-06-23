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
			

			var template = "<li class='row dvd-inmy-cart' data-code='"+ productCode +"' id='"+ productCode+"' >"
						+ "<span class='quantity' id='selected-quanity'>"+ addElmVal+"</span>"
						+"<span class='itemName'>"+ productName+"</span>"
						+"<span class='price' data-price='"+productPrice+"'>$"+ productPrice
						+"<a href='#' class='glyphicon glyphicon-pencil'></a>"
						+ "<a href='#' class='glyphicon glyphicon-remove'></a>"
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


});