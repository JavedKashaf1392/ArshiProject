package com.veggiefridge.online.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
import com.veggiefridge.online.dao.CustomerDAO;
import com.veggiefridge.online.dao.MenuDao;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menudao;

	@Override
	public List<Menu> getMenuAndSubMenuProfile(String section) {
		return menudao.getMenuAndSubMenuProfile(section);
	}

	@Override
	public List<Menu> getMenu(String section) {
		return menudao.getMenu(section);
	}

	@Override
	public List<Images> getImagesBySection(String imageSection) {
		return menudao.getImagesBySection(imageSection);
	}

	@Override
	public List<SubMenu> listSubMenu(int menuID) {
		return menudao.listSubMenu(menuID);
	}

	@Override
	public List<Menu> getMenuAndSubMenu(String section, int parentId) {
		return menudao.getMenuAndSubMenu(section, parentId);
	}

	@Override
	public List<Menu> getmenuandsubMenu(String section, int parentId) {
		return menudao.getmenuandsubMenu(section, parentId);
	}

	
}
