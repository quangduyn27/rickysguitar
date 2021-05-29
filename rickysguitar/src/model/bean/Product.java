package model.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int id;
	private String name;
	private String detail;
	private int price;
	private int sale;
	private String picture;
	private int quantity;
	private int view;
	private Cat cat;
	
	
	
	
}
