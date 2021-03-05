package com.veggiefridge.online.service;

import java.util.List;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

public interface MenuService {
	
   public List<Menu> getMenuAndSubMenuProfile(String section);
	
    public List<Menu> getMenu(String section);
		
    public List<Images> getImagesBySection(String imageSection);
    
    public List<SubMenu> listSubMenu(int menuID);
    
   public List<Menu> getMenuAndSubMenu(String section,int parentId);
    
	/* public List<Menu> getmenuandsubMenu(String section,int parentId); */
    
    public List<Menu> getMenuAndSubMenu();
    
    public List<Menu> getmenuandsubMenu(String section);
    
    
    

}
