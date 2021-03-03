package com.veggiefridge.online.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="submenu")
public class SubMenu {
	
private static final long serialVersionUID = -3465813074586302847L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int subMenuId;
	
	@Column(name ="submenu")
	private String subMenu;
	
	@Column(name ="value")
	private String  Value;
	
	@Column(name ="menuID")
	private int menuID;

	public int getMenuID() {
		return menuID;
	}

	public void setMenuID(int menuID) {
		this.menuID = menuID;
	}

	public int getSubMenuId() {
		return subMenuId;
	}

	public void setSubMenuId(int subMenuId) {
		this.subMenuId = subMenuId;
	}

	public String getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(String subMenu) {
		this.subMenu = subMenu;
	}

	public String getValue() {
		return Value;
	}

	public void setValue(String value) {
		Value = value;
	}

	@Override
	public String toString() {
		return "SubMenu [subMenuId=" + subMenuId + ", subMenu=" + subMenu + ", Value=" + Value + ", menuID=" + menuID
				+ "]";
	}

	
}
