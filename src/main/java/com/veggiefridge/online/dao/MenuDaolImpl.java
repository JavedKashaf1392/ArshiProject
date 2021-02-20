package com.veggiefridge.online.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.SubMenu;

@Repository
@Transactional
public class MenuDaolImpl implements MenuDao{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<SubMenu> getSubMenuByMenues(String menues) {
		String query = "FROM SubMenu WHERE menues= :menues";
		return sessionFactory.getCurrentSession()
				.createQuery(query)
					.setParameter("menues",menues)
						.list();
	}
	
	public List<Menu> getMenuProfile(String section){
		String query = "FROM Menu WHERE section =:section";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("section",section)
										.list();
		
	}

}
