package com.veggiefridge.online.dao;

import java.util.List;

import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

public interface MenuDao {

	public List<SubMenu> getSubMenuByMenues(String menues);
	
	public List<Menu> getMenuProfile(String section);
}
