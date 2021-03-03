package com.veggiefridge.online.dao;

import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addProduct(Product product) {
		sessionFactory.getCurrentSession().saveOrUpdate(product);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProducts() {
		return sessionFactory.getCurrentSession().createQuery("from Product") .list(); 
		
	}

	@Override
	public void deleteProduct(Integer productId) {
		
		Product product =(Product) sessionFactory.getCurrentSession().load( Product.class, productId);
				  if (null != product) {
				  this.sessionFactory.getCurrentSession().delete(product); 
				  }
	}

	@Override
	public Product updateProduct(Product product) {
		sessionFactory.getCurrentSession().update(product); 
		return product;
	}
    
	@Override
	public Product getProduct(int productid) {
		
		 return (Product) sessionFactory.getCurrentSession().get(Product.class, productid);
	}

	
	@Override
	public List<Product> getProductsBycatogary(String category) {
		String query = "FROM Product WHERE category =:category";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("category",category)
										.list();	
	}

																	
	@Override
	public List<Product> GetAllProductByCatogary(String category) {
		String query = "FROM Product WHERE category =:category";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("category",category)
										.list();	
	}
	
	}
	
