package com.entity;

public class Book_Order {
	private String orderId;
private int id;
private String userName;
private String email;
private String phno;
private String fulladd;
private String bookName;
private String author;
private String price;
private String paymentType;
public Book_Order(int id, String userName, String email, String phno, String fulladd, String paymentType) {
	super();
	this.id = id;
	this.userName = userName;
	this.email = email;
	this.phno = phno;
	this.fulladd = fulladd;
	this.paymentType = paymentType;
}
public Book_Order() {
	// TODO Auto-generated constructor stub
}
public String getOrderId() {
	return orderId;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getFulladd() {
	return fulladd;
}
public void setFulladd(String fulladd) {
	this.fulladd = fulladd;
}
public String getPaymentType() {
	return paymentType;
}
public void setPaymentType(String paymentType) {
	this.paymentType = paymentType;
}


}
