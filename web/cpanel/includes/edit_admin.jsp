

<%@page import="com.admin.DBConnec"%>
<!--if(isset($_POST['upd_admin'])){
	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$active = $_POST['active'];
	
	$query = mysql_query("update tbl_admin set username='$username', password='$password', active= '$active' where id='$id'");
	if($query){
		$msg = "Successfully Admin Updated.";
		$clas = "four";
		}
	else{
		$msg = mysql_error();
		$clas = "three";
		}
	}

if(isset($_GET['id'])){
	$id = $_GET['id'];
	$qcategory = mysql_query("select * from tbl_admin where id='$id'");
	$qcategory1 = mysql_fetch_array($qcategory);
	}-->
<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Form was submitted.
   String userId = request.getParameter("id");
   String usernames = request.getParameter("username").trim();
   String password = request.getParameter("password").trim();
   String active = request.getParameter("active");
   DBConnec dbEdit =new DBConnec();
   dbEdit.stmt=dbEdit.con.prepareStatement("update user set username=?, userpass=AES_ENCRYPT(?, 'sumn2u'), active=? where id=?");
   dbEdit.stmt.setString(1, usernames);
   dbEdit.stmt.setString(2, password);
   dbEdit.stmt.setString(3, active);
   dbEdit.stmt.setString(4, userId);
  //out.println(dbEdit.stmt);
   dbEdit.rs = dbEdit.stmt.executeUpdate();
   if(dbEdit.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully updated!\n" +
"						<span></span>\n" +
"					</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
   }
             
   
   
}else{
               String userId = request.getParameter("id");
              
               DBConnec dbEd =new DBConnec();
              dbEd.stmt=dbEd.con.prepareStatement("SELECT * from user where id="+userId);
              
              dbEd.Rs=dbEd.stmt.executeQuery(); 
               while(dbEd.Rs.next()){ 
                                               String id = dbEd.Rs.getString(1);
                                              String name = dbEd.Rs.getString(2);
                                              String pass = dbEd.Rs.getString(3);
                                               int active = dbEd.Rs.getInt(4);

%>

<div class="form-elements">
<form name="" action="" method="post">
					<h1>UPDATE AN ADMIN</h1>
					<div class="hr"></div>
<!--                                        <div class="notice-echo four">
                                            Successfully updated!
						<span></span>
					</div>-->
					<div class="fixed form-elements-inputs">
						<div class="col-240">
							<h4>User Name</h4>
							<h4>Password</h4>
                            <h4>Active</h4>
                            <h4>&nbsp;</h4>
						</div>
						<div class="col-400">
							<input type="hidden" name="id" value="<%= id %>" />
                            <input type="text" name="username" value="<%= name%>" />
                            <input type="password" name="password" value="<%= pass%>" />
							<div class="rad-el">YES<input class="rad" type="radio" name="active" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="active" value="0" /> </div>
							<div style="clear:both"></div>
							<input class="sub button-grey arrow" name="upd_admin" type="submit" value="Submit">
						</div>
					</div>					
</form>
</div>
<%} 

    }%>