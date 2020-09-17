package com.veggiefridge.online.dao;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Product;

@Repository
@Transactional
public class CartItemDAOImp implements CartItemDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	 //list
	@Override
	public List<CartItem> list(int cartpageid) {
		System.out.println("listCartItem");
		return null;
	}

	//get cartitem
	@Override
	public CartItem get(int cartitemid) {
		return (CartItem ) sessionFactory.getCurrentSession().get(CartItem.class, cartitemid);
	}

	
	//add cartitem
	@Override
	public boolean add(CartItem cartitem) {
		try {
			sessionFactory.getCurrentSession().persist(cartitem);
			System.out.println("add cartitem method is running");
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	//update caritem
	@Override
	public boolean update(CartItem cartitem) {
		try {
			sessionFactory.getCurrentSession().update(cartitem);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}


	//getByCartPageAndProduct
	@Override
	public CartItem getByCartPageAndProduct(int productid){
	
	String query ="FROM CartLine WHERE product.productid =:productid";
		try {
			System.out.println("cartdaogetByCartPageAndProduct");
			return (CartItem) sessionFactory.getCurrentSession().createQuery(query).
					setParameter("productid", productid).uniqueResult();
		
		}catch(Exception ex) {
			return null;
				
		}
		
	}
	
	
	@Override
	public List<CartItem> getAllCartItem() {
	return sessionFactory.getCurrentSession().createQuery("from CartItem").list();
	}

	
	@Override
	public boolean remove(CartItem cartitem) {
		
		try {			
			sessionFactory.getCurrentSession().delete(cartitem);
			return true;
		}
		catch(Exception ex) {
			return false;
		}	
	}

	
	@Override
	public List<CartItem> listAvailable(int cartpageid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	}	

