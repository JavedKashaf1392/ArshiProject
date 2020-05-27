package com.veggiefridge.online.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "kiosklocation")
public class KioskLocation implements Serializable{
	
	private static final long serialVersionUID = -3465813074586302847L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	/* @Column(name = "locationid") */
	private long locationid;
	   
	
	@NotEmpty(message ="Location can't be empty")
	@Column(name = "location")
	private String location;
	
	@NotEmpty(message ="City can't be empty")
	@Column(name = "cities")
	private String  cities;
	
	@NotEmpty(message ="State Can't be empty")
	@Column(name="state")
	private String  state;
	
	
	@NotEmpty(message ="Country Can't be empty")
	@Column(name = "country")
	private String   country;
      
	//getters and setters
	public long getLocationid() {
		return locationid;
	}

	public void setLocationid(long locationid) {
		this.locationid = locationid;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCities() {
		return cities;
	}

	public void setCities(String cities) {
		this.cities = cities;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
}
