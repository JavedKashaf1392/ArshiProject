package com.veggiefridge.online.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.veggiefridge.online.dao.CustomerDAO;
import com.veggiefridge.online.dao.MenuDao;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menudao;

	@Override
	public List<SubMenu> getSubMenuByMenues(String menues) {
		return menudao.getSubMenuByMenues(menues);
	}

	@Override
	public List<Menu> getMenuProfile(String section) {
		return menudao.getMenuProfile(section);
	}

}
