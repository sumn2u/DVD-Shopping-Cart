/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.admin;

/**
 *
 * @author suman
 */

import java.io.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.log4j.Logger;

/**
 *
 * @author dinuka
 */
public class MySqlBackup {

    private int STREAM_BUFFER = 512000;
    private boolean status = false;
    //initializing the logger  
    static Logger log = Logger.getLogger(MySqlBackup.class.getName());

    /**
     * This method is used for backup the mysql database
     *
     * @param host - hostname - localhost/127.0.0.1
     * @param port - 3306
     * @param user - username
     * @param password - password
     * @param db - database name
     * @param backupfile - file path to backup from the current location ex/
     * "/backup/"
     * @param mysqlDumpExePath - file path to mysqldump.exe from the current
     * location ex/ copy the mysqldump.exe from mysql bin in to backup folder
     * and set the path as backup ex/ "/backup/mysqldump.exe"
     * @return the status of the backup true/false
     */
    public boolean backupDatabase(String host, String port, String user, String password, String db, String backupfile, String mysqlDumpExePath) {
        try {
            // Get MySQL DUMP data
            String dump = getServerDumpData(host, port, user, password, db, mysqlDumpExePath);
            //check the backup dump
            if (status) {
                byte[] data = dump.getBytes();
                // Set backup folder
                String rootpath = System.getProperty("user.dir") + backupfile;

                // See if backup folder exists
                File file = new File(rootpath);
                if (!file.isDirectory()) {
                    // Create backup folder when missing. Write access is needed.
                    file.mkdir();
                }
                // Compose full path, create a filename as you wish
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
                Date date = new Date();
                String filepath = rootpath + "backup(With_DB)-" + db + "-" + host + "-(" + dateFormat.format(date) + ").sql";
                // Write SQL DUMP file
                File filedst = new File(filepath);
                FileOutputStream dest = new FileOutputStream(filedst);
                dest.write(data);
                dest.close();
                log.info("Backup created successfully for - " + db + " " + host);
            } else {
                //when status false  
                log.error("Could not create the backup for - " + db + " " + host);
            }

        } catch (Exception ex) {
            log.error(ex, ex.getCause());
        }

        return status;
    }

    private String getServerDumpData(String host, String port, String user, String password, String db, String mysqlDumpExePath) {
        StringBuilder dumpdata = new StringBuilder();
        String execlient = "";
        try {
            if (host != null && user != null && password != null && db != null) {
                // Set path. Set location of mysqldump 
                //  For example: current user folder and lib subfolder          

                execlient = System.getProperty("user.dir") + mysqlDumpExePath;

                // Usage: mysqldump [OPTIONS] database [tables]
                // OR     mysqldump [OPTIONS] --databases [OPTIONS] DB1 [DB2 DB3...]
                // OR     mysqldump [OPTIONS] --all-databases [OPTIONS]
                String command[] = new String[]{execlient,
                    "--host=" + host,
                    "--port=" + port,
                    "--user=" + user,
                    "--password=" + password,
                    "--skip-comments",
                    "--databases",
                    db};

                // Run mysqldump
                ProcessBuilder pb = new ProcessBuilder(command);
                Process process = pb.start();

                InputStream in = process.getInputStream();
                BufferedReader br = new BufferedReader(new InputStreamReader(in));

                int count;
                char[] cbuf = new char[STREAM_BUFFER];

                // Read datastream
                while ((count = br.read(cbuf, 0, STREAM_BUFFER)) != -1) {
                    dumpdata.append(cbuf, 0, count);
                }

                //set the status
                int processComplete = process.waitFor();
                if (processComplete == 0) {                   
                    status = true;
                } else {
                    status = false;
                }
                // Close
                br.close();
                in.close();
            }

        } catch (Exception ex) {
            log.error(ex, ex.getCause());
            return "";
        }
        return dumpdata.toString();
    }

    
    public static void main(String[] args) throws SQLException {
        MySqlBackup b = new MySqlBackup();
        // b.backupDatabase("10.100.3.108", "3306", "root", "root", "payroll", "/backup/", "/backup/mysqldump.exe");
        //b.backupDatabase("localhost", "3306", "root", "", "payroll", "/backup/", "/backup/mysqldump.exe");
        //  b.restoreDatabase("root", "", "backup/backup-payroll-10.100.3.108-27-09-2012.sql");
        // b.test();
      //  b.backupDataWithDatabase("C:\\wamp\\bin\\mysql\\mysql5.5.16\\bin\\mysqldump.exe", "localhost", "3306", "root", "", "payroll", "C:/Users/dinuka/Desktop/test/");
         b.backupAllDatabases("C:\\wamp\\bin\\mysql\\mysql5.5.16\\bin\\mysqldump.exe", "localhost", "3306", "root", "", "C:/Users/dinuka/Desktop/test/");
    }

    public boolean backupDataWithOutDatabase(String dumpExePath, String host, String port, String user, String password, String database, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(without_DB)-" + database + "-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //only backup the data not included create database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " " + database + " -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();

            if (processComplete == 0) {
                status = true;
                log.info("Backup created successfully for without DB " + database + " in " + host + ":" + port);
            } else {
                status = false;
                log.info("Could not create the backup for without DB " + database + " in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            log.error(e, e.getCause());
        }
        return status;
    }

    public boolean backupDataWithDatabase(String dumpExePath, String host, String port, String user, String password, String database, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(with_DB)-" + database + "-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //Backup with database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --add-drop-database -B " + database + " -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();


            if (processComplete == 0) {
                status = true;
                log.info("Backup created successfully for with DB " + database + " in " + host + ":" + port);
            } else {
                status = false;
                log.info("Could not create the backup for with DB " + database + " in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            log.error(e, e.getCause());
        }
        return status;
    }

    public boolean backupAllDatabases(String dumpExePath, String host, String port, String user, String password, String backupPath) {
        boolean status = false;
        try {
            Process p = null;

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date date = new Date();
            String filepath = "backup(with_DB)-All-" + host + "-(" + dateFormat.format(date) + ").sql";

            String batchCommand = "";
            if (password != "") {
                //Backup with database
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --password=" + password + " --add-drop-database -A  -r \"" + backupPath + "" + filepath + "\"";
            } else {
                batchCommand = dumpExePath + " -h " + host + " --port " + port + " -u " + user + " --add-drop-database -A  -r \"" + backupPath + "" + filepath + "\"";
            }

            Runtime runtime = Runtime.getRuntime();
            p = runtime.exec(batchCommand);
            int processComplete = p.waitFor();


            if (processComplete == 0) {
                status = true;
                log.info("Backup created successfully with All DBs in " + host + ":" + port);
            } else {
                status = false;
                log.info("Could not create the backup for All DBs in " + host + ":" + port);
            }

        } catch (IOException ioe) {
            log.error(ioe, ioe.getCause());
        } catch (Exception e) {
            log.error(e, e.getCause());
        }
        return status;
    }

    /**
     * Restore the backup into a local database
     *
     * @param dbUserName - user name
     * @param dbPassword - password
     * @param source - backup file
     * @return the status true/false
     */
    public boolean restoreDatabase(String dbUserName, String dbPassword, String source) {

        String[] executeCmd = new String[]{"mysql", "--user=" + dbUserName, "--password=" + dbPassword, "-e", "source " + source};

        Process runtimeProcess;
        try {
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();

            if (processComplete == 0) {
                log.info("Backup restored successfully with " + source);
                return true;
            } else {
                log.info("Could not restore the backup " + source);
            }
        } catch (Exception ex) {
            log.error(ex, ex.getCause());
        }

        return false;

    }
}