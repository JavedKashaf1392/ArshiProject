package com.veggiefridge.online.service;

import java.util.List;

import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

public interface MenuService {
	
	public List<SubMenu> getSubMenuByMenues(String menues);
	
	public List<Menu> getMenuProfile(String section);
}
