package beesJava;

public class Provider {

	private String username;
	private String password;
	private String email;
	private int idprovider;
//--------------------------------------------------------------------------------------------------------------------	
	
	
	public String getProvidername() {
		return username;
	}

	public int getIdprovider() {
		return idprovider;
	}

	public void setIdprovider(int idprovider) {
		this.idprovider = idprovider;
	}

	public void setProvidername(String username) {
		this.username = username;
	}

	public String getProviderPassword() {
		return password;
	}

	public void setProviderPassword(String password) {
		this.password = password;
	}

	public String getProviderEmail() {
		return email;
	}

	public void setProviderEmail(String email) {
		this.email = email;
	}
	
	public Provider() {
		
	}

	public Provider(String username, String password, String email) {		
		this.username = username;
		this.password = password;
		this.email = email;
	}
	public Provider(String password, String email){
		this.password = password;
		this.email = email;
	}

	public Provider(String username, String password, String email, int idprovider) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.idprovider = idprovider;
	}

	@Override
	public String toString() {
		return "Provider [username=" + username + ", password=" + password + ", email=" + email + ", idprovider="
				+ idprovider + "]";
	}

	
}
