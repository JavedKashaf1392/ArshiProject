package com.veggiefridge.online.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name ="menu")
public class Menu implements Serializable {
	
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
	
	@Column(name="paramKey")
	private String paramKey;
    
	@Column(name="jsvar")
	private String jsvar;
	
	//@ManyToOne/* (cascade={CascadeType.ALL}) */
	private Menu menu;
	
	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	@OneToMany(mappedBy="menu", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private Set<Menu> menus = new HashSet<Menu>(0);
	
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

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}

	public String getJsvar() {
		return jsvar;
	}

	public void setJsvar(String jsvar) {
		this.jsvar = jsvar;
	}

	public Menu() {
		super();
	}

	@Override
	public String toString() {
		return "Menu [menuID=" + menuID + ", menues=" + menues + ", section=" + section + ", url=" + url
				+ ", imageName=" + imageName + ", paramKey=" + paramKey + ", jsvar=" + jsvar + "]";
	}

	public Menu(String menues) {
		
		this.menues = menues;
	}

	public Menu(int menuID, String menues, String section, String url, String imageName, String paramKey, String jsvar,
			Menu menu, Set<Menu> menus) {
		super();
		this.menuID = menuID;
		this.menues = menues;
		this.section = section;
		this.url = url;
		this.imageName = imageName;
		this.paramKey = paramKey;
		this.jsvar = jsvar;
		this.menu = menu;
		this.menus = menus;
	}

	
}
