package Main;

import GUI.GUI;
import GuiFixed.Gui;
import SQL.Repository;
import SQL.SqlConnection;

import javax.swing.*;

public class Main {
    public static void main(String [] args) {
        Gui gui = new Gui();
        SwingUtilities.invokeLater(gui);
       // SqlConnection connection = new SqlConnection();
        //connection.connectDatabase("jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=MoetNogInvevuldWorden;integratedSecurity=true;");
        //Repository repository = new Repository(connection);
    }
}
