package com.veggiefridge.online.dao;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.SubMenu;

@Repository
@Transactional
public class MenuDaolImpl implements MenuDao{

	@Autowired
	private SessionFactory sessionFactory;


	
	@Override
	public List<Menu> getMenuAndSubMenuProfile(String section) {
		
		//String query = "FROM Menu WHERE section =:section and menu=null";
		//return sessionFactory.getCurrentSession()
				//.createQuery(query)
					//.setParameter("section",section)
					//.list();
		try {
			if(!sessionFactory.getCurrentSession().getTransaction().isActive());
			    sessionFactory.getCurrentSession().getTransaction().begin();
			    return sessionFactory.getCurrentSession()
						.createQuery("FROM Menu WHERE section =:section and menu=null")
							.setParameter("section",section)
							.list();
			
		}
		catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public List<Menu> getMenu(String section) {
		String query = "FROM Menu WHERE section =:section";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("section",section)
										.list();
	}
	


	@Override
	public List<Images> getImagesBySection(String imageSection) {
		String query = "FROM Images WHERE imageSection =:imageSection";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("imageSection",imageSection)
										.list();	
	}

	

	@Override
	public List<SubMenu> listSubMenu(int menuID) {
		String query = "FROM SubMenu WHERE menuID= :menuID";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("menuID",menuID)
										.list();
	}

	@Override
	public List<Menu> getMenuAndSubMenu(String section, int parentId) {
		String query = "FROM Menu WHERE section =:section and parentId = 0";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("section",section)
										.list();
	}

	@Override
	public List<Menu> getmenuandsubMenu(String section, int parentId) {
		String query = "FROM Menu WHERE section =:section and parentId > 0";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("section",section)
										.list();
	}
    
	
	
	
	}
	
	
	
	

