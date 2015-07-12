<%@page import="java.io.IOException" %>
<%@page  import="java.io.PrintWriter" %>
<%@page import="java.util.*" %>

<div id="content">
					<ul class="breadcrumb">
						<li class="home"><a href="index.jsp" ></a></li>
						<li class="last"><a href="#" >Backup</a></li>
					</ul>
    
        <form name="" action="" method="post">    
<div class="fixed form-elements-inputs">
						
						<div class="col-240">
							<input class="sub button-grey arrow" name="add_category" type="submit" value="Backup">
						</div>
					</div>
   </form>
</div>



    <% 
        
       if ("POST".equalsIgnoreCase(request.getMethod())) { 
        
        try{

 
 String executeCmd;
 Process runtimeProcess;
 
 //A batch program  is written 
 /*
 set path=%path%;C:\xampp\mysql\bin;
mysqldump -u root -p shoeShop > C:\Users\Suman\Desktop\Neha'sStore\backup\shoeshop.sql
 
 
 */
 
 //runtimeProcess=Runtime.getRuntime().exec( "C://xampp//mysql//bin//mysqldump -u"+dbUser+"-p "+dbPass+" "+dbName+" -r C://Users//Suman//Desktop//Neha'sStore//backup//backup.sql");
runtimeProcess=Runtime.getRuntime().exec("cmd.exe /c start c:\\backupNeha.bat");
  int processComplete=runtimeProcess.waitFor();
  if(processComplete==0){
      
                        out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">");
                  out.println("<div id=\"message-green\">\n" +
"                <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n" +
"                <tr>\n" +
"                    <td class=\"green-left\">Product  dsuceleted sucessfully. <a href=\"\">Add new one.</a></td>\n" +
"                    <td class=\"green-right\"><a class=\"close-green\"><img src=\"images/table/icon_close_green.gif\"   alt=\"\" /></a></td>\n" +
"                </tr>\n" +
"                </table>\n" +
"                </div>");
  // out.println("Backup taken Successfully");
  }else{
    out.println("Couldn't taken Succesfully");
}
///restoring the data  
  //mysql.exe -u root -p shoeshop <d:\backup.sql


    
}catch(Exception ex){
    ex.printStackTrace();
    
}
    
       }    
        
         
        
        %>