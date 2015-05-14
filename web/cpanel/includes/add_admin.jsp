
<%@page import="com.admin.DBConnec"%>
<!--<?php
$clas="";
if(isset($_POST['add_admin'])){
	$username = $_POST['username'];
	$password = md5($_POST['password']);
	$active = $_POST['active'];
	if(empty($username) || empty($password)){
		$msg = "Username and Passwords are Required!!!";
		$clas = "three";
		}
		else{
			$query = mysql_query("insert into tbl_admin (username, password, active) values('$username','$password','$active')");
				if($query){
					$msg = "Successfully Admin Added.";
					$clas = "four";
					}
				else{
					$msg = mysql_error();
					$clas = "three";
					}
				}
			}
     
?>-->
<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
        String userId = request.getParameter("id");
        String userName = request.getParameter("username").trim();
        String userPass = request.getParameter("password").trim(); 
        
        String active = request.getParameter("active");
      DBConnec dbAddAdminNew =new DBConnec();
      DBConnec dbAdminSelect = new DBConnec();
      dbAdminSelect.stmt = dbAdminSelect.con.prepareStatement("Select username from user");
      dbAdminSelect.Rs=dbAdminSelect.stmt.executeQuery(); 
               while(dbAdminSelect.Rs.next()){ 
                                             
                                               String usedname = dbAdminSelect.Rs.getString(1);
                                               if(usedname.equalsIgnoreCase(userName)){
                                                   out.println(" User already exists !!");
                                               }else {
                                                   dbAddAdminNew.stmt=dbAddAdminNew.con.prepareStatement("INSERT INTO user (username, userpass, active)VALUES (? ,AES_ENCRYPT(?, 'sumn2u'), ?)");
     dbAddAdminNew.stmt.setString(1, userName);
     dbAddAdminNew.stmt.setString(2, userPass);
     dbAddAdminNew.stmt.setString(3, active);
    
//  //out.println(dbEdit.stmt);
     dbAddAdminNew.rs = dbAddAdminNew.stmt.executeUpdate();
   if(dbAddAdminNew.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully added category!\n" +
"						<span></span>\n" +
"					</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
   }
             
   
                                               }
		
               }
     
   
}
    %>


<div class="form-elements">
<form name="" action="" method="post">
					<h1>ADD A NEW ADMIN</h1>
					<div class="hr"></div>
<!--                    <div class="notice-<?php echo $clas; ?>">
                    	<?php if(isset($msg)){ echo $msg; } ?>
						<span></span>
					</div>-->
					<div class="fixed form-elements-inputs">
						<div class="col-240">
							<h4>Enter User Name</h4>
							<h4>Password</h4>
                            <h4>Publish</h4>
                            <h4>&nbsp;</h4>
						</div>
						<div class="col-400">
							<input type="text" name="username" value="" />
                            <input type="password" name="password" value="" />
							<div class="rad-el">YES<input class="rad" type="radio" name="active" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="active" value="0" /> </div>
							<div style="clear:both"></div>
							<input class="sub button-grey arrow" name="add_admin" type="submit" value="Submit">
						</div>
					</div>					
</form>
</div>
