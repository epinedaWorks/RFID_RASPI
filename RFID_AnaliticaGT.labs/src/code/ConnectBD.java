
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import java.sql.*;

/**
 *
 * @author 81BH0000US
 */
public class ConnectBD {



    
public void insertarNuevoCliente(String ip, String Nombres, String Apellidos, String Acceso, String UID){
try
    {
      // create a mysql database connection
//      String myDriver = "org.gjt.mm.mysql.Driver";
//      String myDriver = "com.mysql.jdbc.Driver";
      String myDriver = "com.mysql.cj.jdbc.Driver";
 
      String myUrl = "jdbc:mysql://"+ip+"/rfid";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "epineda", "adminadmin");
      
      Statement st = conn.createStatement();

      // note that i'm leaving "date_created" out of this insert statement
//      st.executeUpdate("INSERT INTO users (first_name, last_name, is_admin, num_points) "
      st.executeUpdate("INSERT INTO `colaborador` (`Nombres`, `Apellidos`, `Acceso`, `UID`)  "
          +
//              "VALUES ('Fred', 'Flinstone', false, 10000)"
//              "VALUES ('Ricardo P. ', 'Contreras Z.', 'Laboratorio 1', '4443210');"
              "VALUES (    '"+ Nombres+ "', "
                        + "'"+ Apellidos + "', "
                        + "'"+ Acceso  + "', "
                        + "'"+ UID +"'"
              + ");"
      );

      conn.close();
    }
    catch (Exception e)
    {
      System.err.println("Got an exception!");
      System.err.println(e.getMessage());
    }

}

    
}


