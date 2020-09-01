
package com.veggiefridge.online.dao;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.Cart;
import com.veggiefridge.online.model.CartLine;

@Repository
public class ShoopingcartDAOImpl implements ShoopingcartDAO {

	@Autowired
	private SessionFactory sessionFactory;
	

	//getListCartLine
	@Override
	public CartLine getByCartAndProduct(int cartId, int productid) {
		String query = "FROM CartLine WHERE cartId = :cartId AND product.productid =:productid";
		try {
			
			return (CartLine) sessionFactory.getCurrentSession()
								.createQuery(query)
										.setParameter("cartId", cartId)
										.setParameter("productid", productid).uniqueResult();
			
		} catch(Exception ex) {
			return null;	
		}
		
	}
	
	
	//addCartLine
	@Override
	public boolean add(CartLine cartline) {
		try {
		sessionFactory.getCurrentSession().persist(cartline);
		return true;
	}
	
	catch(Exception ex) {
		ex.printStackTrace();
		return false;
	}
}
	
	
	
	//listCartLine by cartId
	
	@Override
	public List<CartLine> list(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("cartId", cartId).list();
											
	}
	
	
	//carLine by Id
	@Override
	public CartLine get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
    //update Cart LIne By CartId
	@Override
	public boolean update(CartLine cartline) {
		try {
			sessionFactory.getCurrentSession().update(cartline);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	
	//delete cartLine
	@Override
	public boolean remove(CartLine cartline) {
		try {			
			sessionFactory.getCurrentSession().delete(cartline);
			return true;
		}catch(Exception ex) {
			return false;
		}	
	}
	
    //update Cart
	@Override
	public boolean updateCart(Cart cart) {
		try {			
			sessionFactory.getCurrentSession().update(cart);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	
	//listAvailable
	@Override
	public List<CartLine> listAvailable(int cartId) {
    String query = "FROM CartLine WHERE cartId = :cartId AND available =:available";
	return sessionFactory.getCurrentSession().createQuery(query)
									.setParameter("cartId", cartId).setParameter("available",true).list();
											
	}

}
