<!--<?php session_start() ?>

<?php
if(isset($_SESSION['loggedIn'])){
	header('Location: index.php');
	}
?>
<?php include('includes/db.php'); ?>	 
<?php
if(isset($_POST['login'])){
	$username = $_POST['username'];

	$password = md5($_POST['password']);

	if(empty($username) || empty($password)){
		$msg = "Form Field Empty !!!";
		}
	else{ 
 
		$query = mysql_query("select * from tbl_admin where username='$username' and password='$password' and active=1");
  
		$query2 = mysql_num_rows($query);// print_r($query2); exit();

		if($query2>0){
				session_start();
				$_SESSION['loggedIn']= $username;
				echo "<script>window.location='index.php'</script>";
				// header('Location: index.php');
			}
			else{
			$msg = "User Does Not Exist !!!";	
				}
		}
	}
?>-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Suman Kunwar:: Administration</title>
<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
<!--  jquery core -->
<script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

<!-- Custom jquery scripts -->
<script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

<!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
<script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(document).pngFix( );
});
</script>
</head>
<body id="login-bg"> 
 
<!-- Start: login-holder -->
<div id="login-holder">

	<!-- start logo -->
	<div id="logo-login">
		
	</div>
	<!-- end logo -->
	
	<div class="clear"></div>
	
	<!--  start loginbox ................................................................................. -->
	<div id="loginbox">
	
	<!--  start login-inner -->
	<div id="login-inner">
    <p style="color:red ;">
        <% String msg = request.getParameter("msg");
            if(msg != null){ 
               out.println("<p> Invalid Credentials !!</p>");
            }
            %>
           
<!--	<?php if(isset($msg)){ echo $msg; } ?>-->
	 <br/>
    </p>
		<form action="loginCheck.jsp" method="post" >
        <table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Username</th>
			<td><input type="text" name="uname" value=""  class="login-inp" /></td>
		</tr>
		<tr>
			<th>Password</th>
			<td><input type="password" name="upass" value=""  onfocus="this.value=''" class="login-inp" /></td>
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
        </form>
	</div>
 	<!--  end login-inner -->
	<div class="clear"></div>
	
 </div>
 <!--  end loginbox -->
 
	<!--  start forgotbox ................................................................................... -->
	<!-- <div id="forgotbox">
		<div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
		<!--  start forgot-inner -->
		<!--<div id="forgot-inner">
		<table border="0" cellpadding="0" cellspacing="0">
		<tr>
			<th>Email address:</th>
			<td><input type="text" value=""   class="login-inp" /></td>
		</tr>
		<tr>
			<th> </th>
			<td><input type="button" class="submit-login"  /></td>
		</tr>
		</table>
		</div>
		<!--  end forgot-inner -->
		<!--<div class="clear"></div>
		<a href="" class="back-login">Back to login</a>
	</div> -->
	<!--  end forgotbox -->

</div>
<!-- End: login-holder -->
</body>
</html>
