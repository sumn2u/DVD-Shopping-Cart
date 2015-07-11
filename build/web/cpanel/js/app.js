/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

            $('document').ready(function(){
 
            $('#form').validate({
                    rules:{
                        "uname":{
                            required:true
                        },
                        "contact_email":{
                            required:true,
                            email:true,
                            maxlength:100
                      
                        },
                       
 
                        "upass":{
                            required:true
                        }},
 
                    messages:{
                        "uname":{ 
                            required:"Please provide your username."},
 
                        "contact_email":{
                            required:"Email is necessary.",
                            email:"Please provide valid email address."
                        },
                         "upass":{
                            required:"Provide your password.",
                        }},
 
                          submitHandler: function(form){
                     
                      var xRequest1;
        if (window.XMLHttpRequest)
        {
            xRequest1 = new XMLHttpRequest();
        } else {
            xRequest1 = new ActiveXObject("Microsoft.XMLHTTP");

        }
          
               //Send the proper header information along with the request

        xRequest1.onreadystatechange = function() {
            if ((xRequest1.readyState == 4) && (xRequest1.status == 200))
            {
                 var respone = xRequest1.responseText;
//                 alert(respone);
                       if( respone.match(/success/g)){
                         window.location="index.jsp";
                       }else{
                           alert(" nott   match");
                       }
                       
               
            }
        };
        var data = "uname=" + encodeURIComponent($("[name='uname']").val())
        + "&upass=" + encodeURIComponent($("[name='upass']").val());

        xRequest1.open("post", "loginCheck.jsp", "true");
        xRequest1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xRequest1.send(data);
                            
                            
                            }
                
            });
            
            $('[data-dismiss="alert"]').on('click', function(){
                 $(this).parent().hide();
                return false;
            });
                        
        });
    