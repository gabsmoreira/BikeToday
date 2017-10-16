package mvc.model;

import org.springframework.web.multipart.MultipartFile;

public class Users {
	 private String email;
	 private String username;
	 private String password;
	 private String home_address;
	 private String work_address;
	 private MultipartFile image;
	 
	 
	 public String getEmail() {return email;}
	 public void setEmail(String email) {this.email = email;}
	 
	 public String getUsername() {return username;}
	 public void setUsername(String username) {this.username = username;}
	 
	 public String getPassword() {return password;}
	 public void setPassword(String password) {this.password = password;}
	 
	 public String getHome() {return home_address;}
	 public void setHome(String home_address) {this.home_address = home_address;}
	 
	 public String getWork() {return work_address;}
	 public void setWork(String work_address) {this.work_address = work_address;}
	
	 public MultipartFile getImage() {return image;}
	 public void setImage(MultipartFile image) {this.image = image;}
	 
	 
}
