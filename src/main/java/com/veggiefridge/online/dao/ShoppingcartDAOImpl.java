package com.veggiefridge.online.dao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.TempOrderDetails;

@Repository
public class ShoppingcartDAOImpl implements ShoppingcartDAO{

	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	public void addTempOrderDetails(TempOrderDetails tdo) {
		sessionFactory.getCurrentSession().saveOrUpdate(tdo);
		
	}

	@Override
	public TempOrderDetails getTempOrderDetails(int todid) {
		return (TempOrderDetails) sessionFactory.getCurrentSession().get(TempOrderDetails.class, Integer.valueOf(todid));
	}

	
	@Override
	public List<TempOrderDetails> getTempOrderDetails(){
    return sessionFactory.getCurrentSession().createQuery("from TempOrderDetails").list();	
     }
	
	@Override
	public TempOrderDetails getByProduct(int productid){
	String hql ="FROM TempOrderDetails WHERE product.productid =:productid";
	    	Query query=sessionFactory.getCurrentSession().createQuery(hql);
			query.setParameter("productid",productid);
			return (TempOrderDetails) query;
	}
	
}