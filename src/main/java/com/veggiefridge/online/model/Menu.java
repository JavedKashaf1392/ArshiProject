package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="menu")
public class Menu {
	
	private static final long serialVersionUID = -3465813074586302847L;
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int menuID;
	
	@Column(name="menues")
	private String menues;
	
	@Column(name="section")
	private String section;
	
	@Column(name="url")
	private String url;
	
	@Column(name="imageName")
	private String imageName;

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public int getMenuID() {
		return menuID;
	}

	public void setMenuID(int menuID) {
		this.menuID = menuID;
	}

	public String getMenues() {
		return menues;
	}

	public void setMenues(String menues) {
		this.menues = menues;
	}

	@Override
	public String toString() {
		return "Menu [menuID=" + menuID + ", menues=" + menues + ", section=" + section + ", url=" + url + "]";
	}

  
	
}
