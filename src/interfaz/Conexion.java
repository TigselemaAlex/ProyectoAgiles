/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaz;

/**
 *
 * @author kaise
 */
import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    Connection connect;
    
    public Connection conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://127.0.0.1/controlactivos","root","");
            //JOptionPane.showMessageDialog(null, "Ok Conectado");
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, ex);
        } 
        return connect;
    }
    
    
   
}

