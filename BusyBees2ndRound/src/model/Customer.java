package model;

public class Customer {

  private String username;
  private String password;
  private String email;


  public String getCustomername() {
    return username;
  }

  public void setCustomername(String username) {
    this.username = username;
  }

  public String getCustomerPassword() {
    return password;
  }

  public void setCustomerPassword(String password) {
    this.password = password;
  }

  public String getCustomerEmail() {
    return email;
  }

  public void setCustomerEmail(String email) {
    this.email = email;
  }

  public Customer() {}

  public Customer(String username, String password, String email) {
    this.username = username;
    this.password = password;
    this.email = email;
  }

  public Customer(String password, String email) {
    this.password = password;
    this.email = email;
  }
}
