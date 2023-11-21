package bean;

import java.io.Serializable;

public class MemberBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int id = 2023101;
	private String name = "우영우";
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
