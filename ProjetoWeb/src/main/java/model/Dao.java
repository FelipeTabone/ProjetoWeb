package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Dao {

	private String driver = "com.mysql.cj.jdbc.Driver";
	
	private String url = "jdbc:mysql://127.0.0.1:3306/shoeshappy?useTimezone=true&serverTimezone=UTC";
	
	private String user = "root";
	
	private String password = "root";

	private Connection conectar(){
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}


	public void insertClient(JavaBeans client) {
		String create = "insert into client (name, personType, address, registration, enrollmentModality) values (?,?,?,?,?)";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			
			pst.setString(1, client.getName());
			pst.setString(2, client.getPersonType());
			pst.setString(3, client.getAddress());
			pst.setInt(4, client.getRegistration());
			pst.setString(5, client.getEnrollmentModality());
			
			pst.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<JavaBeans> listClients(){
		ArrayList<JavaBeans> clients = new ArrayList<>();
		String read = "select * from client order by name";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String personType = rs.getString(3);
				String address = rs.getString(4);
				int registration = rs.getInt(5);
				String enrollmentModality = rs.getString(6);
				
				clients.add(new JavaBeans(id, name, personType, address, registration, enrollmentModality));
			}
			con.close();
			
			return clients;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void getClientById(JavaBeans client) {
		String read2 = "select * from client where id = ?";
		
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setInt(1, client.getId());
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				client.setId(rs.getInt(1));
				client.setName(rs.getString(2));
				client.setPersonType(rs.getString(3));
				client.setAddress(rs.getString(4));
				client.setRegistration(rs.getInt(5));
				client.setEnrollmentModality(rs.getString(6));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void updateClient(JavaBeans client) {
		String update = "update client set name=?,personType=?,address=?,registration=?,enrollmentModality=? where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, client.getName());
			pst.setString(2, client.getPersonType());
			pst.setString(3, client.getAddress());
			pst.setInt(4, client.getRegistration());
			pst.setString(5, client.getEnrollmentModality());
			pst.setInt(6, client.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void deleteClient(JavaBeans client) {
		String delete = "delete from client where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setInt(1, client.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
