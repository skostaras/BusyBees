package beesJava;

public class Provider_job {

	private String workemail;
	private String firstName;
	private String lastName;
	private String phone;
	private String webpage;
	private String address;
	private String pc;
	private String city;
	private String description;
	private String price;
	private String type;
	private String category;
	private String subcategory;
	private String service;

	public String getWorkemail() {
		return workemail;
	}

	public void setWorkemail(String workemail) {
		this.workemail = workemail;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWebpage() {
		return webpage;
	}

	public void setWebpage(String webpage) {
		this.webpage = webpage;
	}

	


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPc() {
		return pc;
	}

	public void setPc(String pc) {
		this.pc = pc;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public Provider_job(String workemail, String firstName, String lastName, String phone, String webpage,
			String address, String pc, String city, String description, String price, String type, String category,
			String subcategory, String service) {
		super();
		this.workemail = workemail;
		this.firstName = firstName;
		this.lastName = lastName;
		this.phone = phone;
		this.webpage = webpage;
		this.address = address;
		this.pc = pc;
		this.city = city;
		this.description = description;
		this.price = price;
		this.type = type;
		this.category = category;
		this.subcategory = subcategory;
		this.service = service;
	}
	
	

	public Provider_job() {
		super();
	}

	public Provider_job(String firstName, String lastName, String category) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.category = category;
	}

	public Provider_job(String category) {
		super();
		this.category = category;
	}

	public Provider_job(String firstName, String lastName, String address, String pc, String city, String description, String category, String subcategory, String service) {
		
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.pc = pc;
		this.city = city;
		this.description = description;
		this.category = category;
		this.subcategory = subcategory;
		this.service = service;
	}

	public Provider_job(String firstName, String lastName, String address, String pc, String city, String category) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.pc = pc;
		this.city = city;
		this.category = category;
	}

	public Provider_job(String firstName, String lastName, String category, String subcategory, String service) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.category = category;
		this.subcategory = subcategory;
		this.service = service;
	}

	public Provider_job(String firstName, String lastName, String pc, String city, String description, String category,
			String subcategory, String service) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.pc = pc;
		this.city = city;
		this.description = description;
		this.category = category;
		this.subcategory = subcategory;
		this.service = service;
	}
	
	
	
	
	
	
	

}
