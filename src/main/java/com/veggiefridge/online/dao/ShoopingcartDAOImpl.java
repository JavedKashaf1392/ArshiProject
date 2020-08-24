package com.veggiefridge.online.dao;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.veggiefridge.online.model.Item;

@Repository
public class ShoopingcartDAOImpl implements ShoopingcartDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addItem(Item item) {
    sessionFactory.getCurrentSession().saveOrUpdate(item);		
	}

	
	@Override
	public Item getItem(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<Item> getAllItem() {
	return sessionFactory.getCurrentSession().createQuery("from Item").list(); 
	}

	
	

}
