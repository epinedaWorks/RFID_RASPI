/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import java.io.IOException;

/**
 *
 * @author 81BH0000US
 */
public class SendPython {

    public String ipGeneral;
    
    public SendPython(String ipRaspberry) {
         ipGeneral=ipRaspberry;
    }
 
    Process p;
    
    public void crearNuevoCliente(String UID){
        
//        String comando = "ssh pi@192.168.1.29 \"python3 /home/pi/RFID/bdEscribir.py\"" ;
                                          //Ojo, debe llevar espacio el parametro para ejecutar el comando via ssh
        String comando = "ssh pi@"+ipGeneral+" \"python3 /home/pi/RFID/"
                + "nuevoCliente.py "+UID 
                + "\"" ;
        enviarComando(comando);
        System.out.println("crearNuevoCliente: FIN");
    
    }
    
    public void insertarLecturaRFID(){
        
//        String comando = "ssh pi@192.168.1.29 \"python3 /home/pi/RFID/bdEscribir.py\"" ;
                                          //Ojo, debe llevar espacio el parametro para ejecutar el comando via ssh
        String comando = "ssh pi@"+ipGeneral+" \"python3 /home/pi/RFID/"
                + "grabar.py "
                + "\"" ;
        enviarComando(comando);
        System.out.println("Leyendo Tarjeta: FIN");
        
    
    }
    
    
    private String enviarComando(String comando){
    
//    String comando = "ssh pi@192.168.1.29 \"python3 /home/pi/RFID/bdEscribir.py\"" ;
    
    try {
        System.out.println(comando);
        p = Runtime.getRuntime().exec(comando);  
        
    } catch (IOException e) {
        System.err.println(e);
    }

    
//    String consoleResponse = "";
//    try {
//        p = Runtime.getRuntime().exec("python cooc.py ascoamiga" /*+ cmd*/);
//            
//    } catch (IOException e) {
//    }
//    
//    
//    try {
//        // how do I perform something similar to p.exec(cmd)
//
//        BufferedReader stdInput = new BufferedReader(new
//                 InputStreamReader(p.getInputStream()));
//
//        BufferedReader stdError = new BufferedReader(new
//                 InputStreamReader(p.getErrorStream()));
//
//        // read the output from the command
//        System.out.println("Here is the standard output of the command:\n");
//        while ((consoleResponse += stdInput.readLine()) != null) {
//        }
//
//        // read any errors from the attempted command
//        System.out.println("Here is the standard error of the command (if any):\n");
//        while ((consoleResponse = stdError.readLine()) != null) {
//        }
//
//    } catch (IOException e) {
//    }
//
//    return consoleResponse;
    return comando;

    
    
    
    
    }
    
    
    
}
