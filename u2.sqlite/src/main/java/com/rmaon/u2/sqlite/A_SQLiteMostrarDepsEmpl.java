package com.rmaon.u2.sqlite;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * SQLite. Mostramos departamentos y empelados.
 * @author ramon
 *
 */
public class A_SQLiteMostrarDepsEmpl 
{
    public static void main( String[] args )
    {
    	/**
    	 * Alternativamente se puede hacer un try with resources
    	 * try(Connection conn = DriverManager.getConnection("jdbc:sqlite:empresa.db");
			Statement stmt = conn.createStatement();)
    	 */
    	try {
			Connection conn = DriverManager.getConnection("jdbc:sqlite:empresa.db");
			Statement stmt = conn.createStatement();
			String sql = "SELECT d.id,d.nombre,e.id,e.nombre,apellido1,apellido2,dni,telefono " 
						 + " FROM departamento d LEFT JOIN empleado e ON (d.id = e.departamento_id)";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				System.out.printf("Departamento %d %s: empleado: %d %s %s %s, DNI: %s, Telefono: %s %n", 
						rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),
						rs.getString(6),rs.getString(7),rs.getString(8));
				
			}
			rs.close();
			stmt.close();
			conn.close();
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
}
