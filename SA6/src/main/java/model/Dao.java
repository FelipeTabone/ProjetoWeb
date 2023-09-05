package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Dao {

	private String driver = "com.mysql.cj.jdbc.Driver";
	
	private String url = "jdbc:mysql://localhost:3306/maxsystem?useTimezone=true&serverTimezone=UTC";
	
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

	public void InsertSchedule(JavaBeans schedule) {
		String create = "insert into schedule (date, time) values (?,?)";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			
			pst.setString(1, schedule.getDate());
			pst.setString(2, schedule.getTime());
			
			pst.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<JavaBeans> ListSchedule(){
		ArrayList<JavaBeans> schedules = new ArrayList<>();
		String read = "select * from schedule order by date";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String date = rs.getString(2);
				String time = rs.getString(3);
				
				schedules.add(new JavaBeans(id, date, time));
			}
			con.close();
			
			return schedules;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void GetScheduleById(JavaBeans schedule) {
		String read2 = "select * from schedule where id = ?";
		
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setInt(1, schedule.getId());
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				schedule.setId(rs.getInt(1));
				schedule.setDate(rs.getString(2));
				schedule.setTime(rs.getString(3));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void UpdateSchedule(JavaBeans schedule) {
		String update = "update schedule set date=?,time=? where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(update);
			pst.setString(1, schedule.getTime());
			pst.setString(2, schedule.getDate());
			pst.setInt(3, schedule.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void DeleteSchedule(JavaBeans schedule) {
		String delete = "delete from schedule where id=?";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setInt(1, schedule.getId());
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
