package model.bean;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {

private int idorder;
private String name;
private String email;
private String address;
private String paymentmethod;
private String phone;
private Timestamp date;
private int status;
}
