package model;

public class JavaBeans {
	
	private int id;
	private String name;
	private String address;
	private int registration;
	private String enrollmentModality;
	private String personType;
	
	public JavaBeans() {
		super();
	}
	
	public JavaBeans(int id, String name, String personType, String address, int registration, String enrollmentModality) {
		super();
		
		this.id = id;
		this.name = name;
		this.personType = personType;
		this.address = address;
		this.registration = registration;
		this.enrollmentModality = enrollmentModality;
	}
	
	public int getId(){
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRegistration() {
		return registration;
	}
	public void setRegistration(int registration) {
		this.registration = registration;
	}
	public String getEnrollmentModality() {
		return enrollmentModality;
	}
	public void setEnrollmentModality(String enrollmentModality) {
		this.enrollmentModality = enrollmentModality;
	}
	public String getPersonType() {
		return personType;
	}
	public void setPersonType(String personType) {
		this.personType = personType;
	}
}
