package wiki;

import java.sql.Date;


public class Wiki {
	private int id;
	private int hit;
	private String title;
	private String content;
	
	public Wiki(){
		
	}
	
	public Wiki(int id, int hit, String title, String content){
		this.id = id;
		this.hit = hit;
		this.title = title;
		this.content = content;
		
	}
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}

	public int getHit(){
		return hit;
	}

	public void setHit(int hit){
		this.hit = hit;
	}

	public String getTitle(){
		return title;
	}

	public void setTitle(String title){
		this.title = title;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}
	
	
}
