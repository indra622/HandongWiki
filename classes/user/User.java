package user;

public class User{
	private String id;
	private String password;
	private String stuId;

	public User(){
	}

	public User(String id, String stuId, String password){
		this.id = id;
		this.password = password;
		this.stuId = stuId;
	}

	public String getId(){
		return id;
	}

	public void setId(String id){
		this.id = id;
	}

	public String getPassword(){
		return password;
	}

	public void setPassword(String password){
		this.password = password;
	}

	public String getStuId(){
		return stuId;
	}

	public void setStuId(String stuId){
		this.stuId = stuId;
	}
}