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
	
	
	  @OneToMany(mappedBy = "parentMenu",fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	  private Set<Menu> childMenu= new HashSet<Menu>();

	  @ManyToOne(cascade = CascadeType.ALL)
	  @JoinColumn(name="parent_id")
	  private Menu parentMenu;
	
	
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

	

	  public Set<Menu> getChildMenu() {
		return childMenu;
	}

	public void setChildMenu(Set<Menu> childMenu) {
		this.childMenu = childMenu;
	}

	public Menu getParentMenu() {
		return parentMenu;
	}

	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
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
	}

	@Override
	public String toString() {
		return "Menu [menuID=" + menuID + ", menues=" + menues + ", section=" + section + ", url=" + url
				+ ", imageName=" + imageName + ", paramKey=" + paramKey + ", jsvar=" + jsvar + ", childMenu="
				+ childMenu + ", parentMenu="+"]";
	}
	

	
}
