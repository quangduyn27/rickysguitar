package model.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class rating {

	private int idrating;
	private int idproduct;
	private int iduser;
	private String fullname;
	private String content;
	private Float rating;
	private Timestamp datepost;
}
