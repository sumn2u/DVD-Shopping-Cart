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
<%@page import="java.sql.*,java.io.*,java.util.Arrays" %>
<%
String database = null;
// your cPanel username and password here - the user has MySQL LOCK TABLE right
String usernames = "root";
String password = "suman";
// String dumpdir = "./dumps";
String urlmysql = "jdbc:mysql://localhost/";
//String urlpsql = "jdbc:postgresql://localhost/template1";

String dbtype = null;
Connection connection = null;
Statement statement = null;
ResultSet rset = null;
int result = -1;


try { 
    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
//    Class.forName("org.postgresql.Driver").newInstance(); 
} catch(ClassNotFoundException e) { 
    out.println("Class not found: "+ e.getMessage());
    return;
}

if (request.getParameter("dbtype") != null) { dbtype = request.getParameter("dbtype"); };

try { 
    
connection = DriverManager.getConnection(urlmysql, usernames, password); 
    statement = connection.createStatement();

    out.println("<b>List of MySQL databases accessible by user " + usernames + ":</b><br/>");
    rset = statement.executeQuery("SHOW DATABASES");
    while (rset.next())   {
        out.println(rset.getString(1) + "<br/>");
    }
    rset.close();
    out.println("<hr>");

//    connection = DriverManager.getConnection(urlpsql, usernames, password); 
//    statement = connection.createStatement();
//
//    out.println("<b>List of PostgreSQL databases accessible by user " + usernames + ":</b><br/>");
//    rset = statement.executeQuery("SELECT datname FROM pg_database WHERE datistemplate = false and datname like '" + usernames +"_%';");
//    while (rset.next())   {
//        out.println(rset.getString(1) + "<br/>");
//    }
//    rset.close();
//    statement.close();
//    connection.close();
    out.println("<hr>");
if (request.getParameter("database") != null) {
        database = (String)request.getParameter("database");
        if (request.getParameter("Backup") != null &&
            request.getParameter("Backup").equals("Backup")) {

            String executeCmd = "mysqldump -u " + usernames + " -p" + password + " --add-drop-database -B " + database + " -r " + database + ".sql";
            if (dbtype.equals("postgresql")) {
                executeCmd = "pg_dump -U " + usernames + " -w -c -f " + database + ".sql " + database;
            }

            Process runtimeProcess;
            try {
                 runtimeProcess = Runtime.getRuntime().exec(executeCmd);
                int processComplete = runtimeProcess.waitFor();
                 if (processComplete == 0) {
                    out.println("Backup created successfully");
                } else {
                    out.println("Could not create the backup");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        } else if (request.getParameter("Restore") != null &&
            request.getParameter("Restore").equals("Restore")) { 
            String[] executeCmd = new String[]{"mysql", "--user=" + usernames, "--password=" + password, "-e", "source "+ database + ".sql"};
            if (dbtype.equals("postgresql")) {
                executeCmd = new String[]{"psql", "--username=" + usernames, "--file=" + database + ".sql", database};
            }
    
           out.println(Arrays.toString(executeCmd));

            Process runtimeProcess;
            try {
                runtimeProcess = Runtime.getRuntime().exec(executeCmd);
                out.println("runtimeProcess"+ runtimeProcess);
                int processComplete = runtimeProcess.waitFor();
                if (processComplete == 0) {
                    out.println("Backup restored successfully");
                } else {
                    out.println("Could not restore the backup");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

%>

<form action="backup.jsp" method="post"><table>
<tr><td align="left">Database name to backup or restore: <input type="text" name="database" size="20"></td></tr>
<tr><td><input type="radio" name="dbtype" value="mysql" checked="checked">MySQL<br>
<input type="radio" name="dbtype" value="postgresql">PostgreSQL</td></tr>
<tr><td align="left"><input type="submit" name="Backup" value="Backup">
<input type="submit" name="Restore" value="Restore">
<input type="reset" name="Reset" value="Reset"></td></tr>
</table></form>
    
<%
} catch (SQLException e) {
    out.println(e.getMessage());
} finally {
    try {
        if(connection != null) connection.close();
    } catch(SQLException e) {}
}
%> 