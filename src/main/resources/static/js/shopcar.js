(function () {

  var cart = { items: [], total: '' };

  //Add to cart
  var addToCart = function (product, qty) {
    qty = qty || 1;
    var cart = getCart();
    var indexOfId = cart.items.findIndex(x => x.id == product.id);

    if (indexOfId === -1) {
      cart.items.push(
        {
          id: product.id,
          name: product.name,
          price: product.price,
          qty: qty
        });
    } else {
      cart.items[indexOfId].qty++;
    }

    //Update popup cart
    updateCart(cart);
  }

  var getProductValues = function (element) {
    var productId = $(element).parent().parent().parent().parent().find('.my-cart-id').attr('id');
    var productName = $(element).parent().parent().parent().parent().find('.my-cart-name').html();
    var productPrice = $(element).parent().parent().parent().parent().find('.my-cart-price').html();
    return { id: productId, name: productName, price: productPrice };
  }

  $('.card-add').on('click', function () {
	console.log('add');
    var product = getProductValues(this);
    addToCart({ id: product.id, name: product.name, price: product.price });
  });

  //Update cart html to reflect changes
  var updateCart = function (cart) {
    var totalCost = 0;
    var totalCount = 0;

    //Add to shopping cart dropdown
    $('.cart-list').html('');
    for (var i = 0; i < cart.items.length; i++) {
      totalCost += (cart.items[i].qty * parseFloat(cart.items[i].price));
      totalCount += cart.items[i].qty;

      $('.cart-list').append(
        '<li class="clearfix">' +
        '<div class="my-cart-item">' +
        '<div><span>Name: </span>' + cart.items[i].name + '</div>' +
        '<div><span>Price: </span>' + cart.items[i].price + '</div>' +
        '<div>Qty: </span>' +
        '<i id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +
        cart.items[i].qty +
        ' <i id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i></div>' +
        '</div>' +
        '<div class="my-cart-remove-container">' +
        '<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true">' +
        '</div>' +
        '</i>'
      );

      (function () {
        var currentIndex = i;
        $('#add-qty' + currentIndex).on('click', function () {
          updateQuantity(cart.items[currentIndex].id, ++cart.items[currentIndex].qty);
        })
      })();

      (function () {
        var currentIndex = i;
        $('#subtract-qty' + currentIndex).on('click', function () {
          if (cart.items[currentIndex].qty != 1) {
            updateQuantity(cart.items[currentIndex].id, --cart.items[currentIndex].qty);
          }
        });
      })();

      (function () {
        var currentIndex = i;
        $('#my-cart-remove' + currentIndex).on('click', function () {
          removeFromCart(cart.items[currentIndex].id);
        });
      })();
    }
    //Update Counter
    updateCounter(totalCount);

    //Update Total
    updateTotal(totalCost);
  }

  //Update cart quantity by id
  var updateQuantity = function (id, qty) {
    var cart = getCart();
    var cartIndex = cart.items.findIndex(x => x.id == id);
    cart.items[cartIndex].qty = qty;
    //Update popup cart
    updateCart(cart);
  };

  //Remove from cart on id
  var removeFromCart = function (id) {
    var cart = getCart();
    var cartIndex = cart.items.findIndex(x => x.id == id);

    cart.items.splice(cartIndex, 1);
    //Update popup cart
    updateCart(cart);
  };

  //Get Cart
  var getCart = function () {
    var myCart = cart;
    return myCart;
  }

  //Update counter 
  var updateCounter = function (val) {
    $('.my-cart-counter').html(val);
  }

  //Update total
  var updateTotal = function (val) {
	var cart = getCart();
	cart.total = val;
    $('.my-cart-total').html(val);
  }

  //Checkout to sandbox payment gateway
  var checkout = function () {
    var cart = getCart();
    if (cart.items.length > 0) {
//      alert("checkout!");
	  localStorage.setItem('Cart', JSON.stringify(cart));
	  console.log(cart);
	  location.href="/inhouse/shoppaypage"
    } else {
      alert("請選擇要改買的商品");
    }
  };

  //Listeners
  //Close popup on body click
  $('body').click(function (e) {
//    e.preventDefault();
    $(".shopping-cart").fadeOut("fast");
  });


  //Toggle cart on icon click
  $(".my-cart-icon").on("click", function (e) {
    e.stopPropagation();
    $(".shopping-cart").fadeToggle("fast");
  });

  //Prevent close on popup click
  $('.my-cart-popup').on('click', function (e) {
    e.stopPropagation();
  });

  //Prevent close on popup click
//  $('.my-cart-checkout').on('click', function (e) {
//	console.log("確認觸發check out");
//    checkout();
////    e.stopPropagation();
//  });

//  $(document).on('click', '.my-cart-checkout', function(e){
//	console.log("確認觸發check out");
//	checkout();
//  });
})();

	  var cart = { items: [], total: '' };

	  //Add to cart
	  var addToCart = function (product, qty) {
	    qty = qty || 1;
	    var cart = getCart();
	    var indexOfId = cart.items.findIndex(x => x.id == product.id);

	    if (indexOfId === -1) {
	      cart.items.push(
	        {
	          id: product.id,
	          name: product.name,
	          price: product.price,
	          qty: qty
	        });
	    } else {
	      cart.items[indexOfId].qty++;
	    }

	    //Update popup cart
	    updateCart(cart);
	  }

	  var getProductValues = function (element) {
	    var productId = $(element).parent().parent().parent().parent().find('.my-cart-id').attr('id');
	    var productName = $(element).parent().parent().parent().parent().find('.my-cart-name').html();
	    var productPrice = $(element).parent().parent().parent().parent().find('.my-cart-price').html();
	    return { id: productId, name: productName, price: productPrice };
	  }

	  $('.card-add').on('click', function () {
		console.log('add');
	    var product = getProductValues(this);
	    addToCart({ id: product.id, name: product.name, price: product.price });
	  });

	  //Update cart html to reflect changes
	  var updateCart = function (cart) {
	    var totalCost = 0;
	    var totalCount = 0;

	    
	 	 //123
	    var abcd=0;
	    //Add to shopping cart dropdown
	    $('.cart-list').html('');
	    for (var i = 0; i < cart.items.length; i++) {
	      totalCost += (cart.items[i].qty * parseFloat(cart.items[i].price));
	      totalCount += cart.items[i].qty;

	    //123
	      abcd= cart.items[i].price  
	      
	      
	      $('.cart-list').append(
	        '<li class="clearfix">' +
	        '<div class="my-cart-item">' +
	        '<div><span>Name: </span>' + cart.items[i].name + '</div>' +
	        '<div><span>Price: </span>' + cart.items[i].price + '</div>' +
	        '<div>Qty: </span>' +
	        '<i id="subtract-qty' + i + '" class="fa fa-minus-square update-qty subtract-qty cart-thumb" aria-hidden="true"></i><span> ' +
	        cart.items[i].qty +
	        ' <i id="add-qty' + i + '" class="fa fa-plus-square update-qty add-qty cart-thumb" aria-hidden="true"></i></div>' +
	        '</div>' +
	        '<div class="my-cart-remove-container">' +
	        '<i id="my-cart-remove' + i + '" class="fa fa-times my-cart-remove cart-thumb" aria-hidden="true">' +
	        '</div>' +
	        '</i>'
	      );

	      (function () {
	        var currentIndex = i;
	        $('#add-qty' + currentIndex).on('click', function () {
	          updateQuantity(cart.items[currentIndex].id, ++cart.items[currentIndex].qty);
	        })
	      })();

	      (function () {
	        var currentIndex = i;
	        $('#subtract-qty' + currentIndex).on('click', function () {
	          if (cart.items[currentIndex].qty != 1) {
	            updateQuantity(cart.items[currentIndex].id, --cart.items[currentIndex].qty);
	          }
	        });
	      })();

	      (function () {
	        var currentIndex = i;
	        $('#my-cart-remove' + currentIndex).on('click', function () {
	          removeFromCart(cart.items[currentIndex].id);
	        });
	      })();
	    }
	    
	    
	    var a=0;    	      	    
	    $('#coupon_name1').on('change', function() {
	    	  alert( this.value );   	    	  
	    		
				console.log("AAA+"+abcd )
	    		switch (this.value) {  
	              case "100元禮金":   	            	 
 	            	 a=100;  	            	 
	             // alert('加入優惠券1') 
	               console.log("12345+"+totalCost);
	              var b=totalCost-a;
	               $('#coupon2').text(b)
	              console.log("b"+b);
	              break;
	              
	              
	              case "沙發打5折" :  
	            	  
	            	  var cc=$('.cart-list').text()
    	    		  console.log("cc"+cc);
    	    		  
    	    		var abc=cc.indexOf('沙發'); 
    	    		  
    	    		  
    	    		  if (abc>0) {
    	    			  a=(abcd/2); 
    	    			  
    	    			  var b=totalCost-a;
       	               $('#coupon2').text(b)
    	    		  }
	            	  
	              break;
	              
	              case "桌子折扣50元" :  

	            	  
	            	  var cc=$('.cart-list').text()
    	    		  console.log("cc"+cc);   	    		  
    	    		  var abc=cc.indexOf('桌'); 
    	    		  
    	    		  
    	    		  if (abc>0) {
    	    			  a=50; 
    	    			  
    	    			  var b=totalCost-a;
       	               $('#coupon2').text(b)
    	    		  }
	            	  
	            	  
	              break;
	                    	              
	              default:
	              alert('無法使用')
	                      }});   	      	    
	    console.log("a:"+a);
	    

	    
	    console.log("totalCost"+totalCost);
	    
	    
	    
	    
	    
	    
	    //Update Counter
	    updateCounter(totalCount);

	    //Update Total
	    updateTotal(totalCost);
	  	
	    	    
	  	}
	  
	  
	  
	  
	  
	  
	  
	  

	  //Update cart quantity by id
	  var updateQuantity = function (id, qty) {
	    var cart = getCart();
	    var cartIndex = cart.items.findIndex(x => x.id == id);
	    cart.items[cartIndex].qty = qty;
	    //Update popup cart
	    updateCart(cart);
	  };

	  //Remove from cart on id
	  var removeFromCart = function (id) {
	    var cart = getCart();
	    var cartIndex = cart.items.findIndex(x => x.id == id);

	    cart.items.splice(cartIndex, 1);
	    //Update popup cart
	    updateCart(cart);
	  };

	  //Get Cart
	  var getCart = function () {
	    var myCart = cart;
	    return myCart;
	  }

	  //Update counter 
	  var updateCounter = function (val) {
	    $('.my-cart-counter').html(val);
	  }

	  //Update total
	  var updateTotal = function (val) {
		var cart = getCart();
		cart.total = val;
	    $('.my-cart-total').html(val);
	  }

	  //Checkout to sandbox payment gateway
	  var checkout = function () {
	    var cart = getCart();
	    if (cart.items.length > 0) {
//	      alert("checkout!");
		  localStorage.setItem('Cart', JSON.stringify(cart));
		  console.log(cart);
		  location.href="/inhouse/shoppaypage"
	    } else {
	      alert("請選擇要改買的商品");
	    }
	  };

	  //Listeners
	  //Close popup on body click
	  $('body').click(function (e) {
//	    e.preventDefault();
	    $(".shopping-cart").fadeOut("fast");
	  });


	  //Toggle cart on icon click
	  $(".my-cart-icon").on("click", function (e) {
	    e.stopPropagation();
	    $(".shopping-cart").fadeToggle("fast");
	  });

	  //Prevent close on popup click
	  $('.my-cart-popup').on('click', function (e) {
	    e.stopPropagation();
	  });

	  //Prevent close on popup click
	//  $('.my-cart-checkout').on('click', function (e) {
//		console.log("確認觸發check out");
//	    checkout();
////	    e.stopPropagation();
	//  });

	  $(document).on('click', '.my-cart-checkout', function(e){
//		console.log("確認觸發check out");
		checkout();
	  });



