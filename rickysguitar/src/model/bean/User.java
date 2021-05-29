package model.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private int id;
	private String username;
	private String password;
	private String fullname;
	private String birthday;
	private String email;
	private int idRole;
	
}
