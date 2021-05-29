package model.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orderdetail {

	private int iddetail;
	private int idproduct;
	private String name;
	private int quantity;
	private int price;
	private String detail;
	private int idorder;
}
