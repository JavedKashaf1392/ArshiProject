package com.veggiefridge.online.dao;

import java.util.List;

import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.SubMenu;

public interface MenuDao {
    
	public List<Menu> getMenuAndSubMenuProfile(String section);
	
    public List<Menu> getMenu(String section);
		
    public List<Images> getImagesBySection(String imageSection);
    
    public List<SubMenu> listSubMenu(int menuID);
    
    public List<Menu> getMenuAndSubMenu();
    
    public List<Menu> getmenuandsubMenu(String section);
    

}
