package com.veggiefridge.online.dao;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Product;

@Repository
@Transactional
public class CartItemDAOImp implements CartItemDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	// 1 list
	@Override
	public List<CartItem> list(int cartpageid){
		String query = "FROM CartItem WHERE cartpageid =:cartpageid";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("cartpageid", cartpageid)
										.list();	
	}

	
	//2get cartitem
	@Override
	public CartItem get(int cartitemid) {
		return (CartItem ) sessionFactory.getCurrentSession().get(CartItem.class, cartitemid);
	}

	
	//3add cartitem
	@Override
	public boolean add(CartItem cartitem){
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

	
	//4 update caritem
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


	//  5 getByCartPageAndProduct
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
	
	// 6 getAllCartItem
	@Override
	public List<CartItem> getAllCartItem() {
	return sessionFactory.getCurrentSession().createQuery("from CartItem").list();
	}

	   //7 remove
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

	
	//8  listAvailable
	@Override
	public List<CartItem> listAvailable(int cartpageid) {
		String query = "FROM CartLine WHERE  cartpageid= : cartpageid AND available = :available";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("cartpageid", cartpageid)
									.setParameter("available", true)
										.list();
	}

	// 9 update CartPage
	@Override
	public boolean updateCartPage(CartPage cartpage) {
		try {			
			sessionFactory.getCurrentSession().update(cartpage);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	
	@Transactional
	@Override
	public CartItem getByCartPageAndProduct(int productid, int cartpageid){
	String query ="FROM CartItem WHERE cartpageid =:cartpageid AND product.productid =:productid";
		try {
			System.out.println("cartdaogetByCartPageAndProduct and cartpageid");
			return (CartItem) sessionFactory.getCurrentSession().createQuery(query).
					setParameter("productid", productid)
					.setParameter("cartpageid", cartpageid)
					.uniqueResult();
		
		}catch(Exception ex) {
			return null;
				
		}
	}


	@Override
	public boolean deleteList(List<CartItem> cartitem) {
		try {			
			sessionFactory.getCurrentSession().delete(cartitem);
			return true;
		}
		catch(Exception ex) {
			return false;
		}	
	}

    //getCustomerCart
	@Transactional
	@Override
	public CartItem getCustomerCart(int cartpageid) {
	String query ="FROM CartItem WHERE cartpageid =:cartpageid";
	try {
		System.out.println("cart and cartpageid");
		return (CartItem) sessionFactory.getCurrentSession().createQuery(query).
				setParameter("cartpageid", cartpageid)
				.uniqueResult();
	
	}catch(Exception ex) {
		return null;

	}
	}
}

	
	
	
	
	

