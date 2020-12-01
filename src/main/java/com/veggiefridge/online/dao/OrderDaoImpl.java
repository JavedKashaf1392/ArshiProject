package com.veggiefridge.online.dao;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;

@Repository
@Transactional
public class OrderDaoImpl implements OrderDao{


	@Autowired
	private SessionFactory sessionFactory;
	
	private int getMaxOrderNum(){
        String sql = "Select max(o.orderNum) from " + Orders.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(sql);
        Integer value = (Integer) query.uniqueResult();
        if (value == null) {
            return 0;
        }
        return value;
    }
	

	    @Override
	    public boolean saveOrder(Orders Orders) {
	    	try {			
				sessionFactory.getCurrentSession().persist(Orders);			
				return true;
			}
			catch(Exception ex) {
				return false;
			}
	
	}
	
	 
	@Override
	public List<OrderItem> listOrderItem(int Orderid){
		String query = "FROM OrderItem WHERE Orderid= :Orderid";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("Orderid",Orderid)
										.list();
	}
	
	@Override
	public boolean saveOrderItem(OrderItem orderitem) {
		try {			
			sessionFactory.getCurrentSession().persist(orderitem);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	    
	}


	@Override
	public List<Orders> list(int customerid) {
		String query = "FROM Orders  WHERE customer.customerid =:customerid";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("customerid",customerid)
										.list();
	}

	@Override
	public Orders getOrder(int Orderid) {
		return (Orders) sessionFactory.getCurrentSession().get(Orders.class, Orderid);
	}

	
	@Override
	public List<OrderItem> getAllOrderItem() {
		return sessionFactory.getCurrentSession().createQuery("from OrderItem").list();
	}


	@Override
	public List<Orders> listpendingOrders(){
		
		String query = "FROM Orders WHERE  pickupStatus =:pickupStatus";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("pickupStatus",VFOnlineConstants.PICKUP_STATUS)
										.list();	
	}


	@Override
	public List<Orders> listdeliveredOrders(){
		String query = "FROM Orders WHERE  pickupStatus =:pickupStatus";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("pickupStatus",VFOnlineConstants.PICKUPSTATUS)
										.list();	
	}


	@Override
	public List<OrderItem> getAllOrders() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Orders> getOrdersByStatus(String pickupStatus, int customerid) {
		String query = "FROM Orders WHERE pickupStatus =:pickupStatus AND customerid = :customerid";
		return sessionFactory.getCurrentSession()
				.createQuery(query)
					.setParameter("pickupStatus", pickupStatus)
					.setParameter("customerid", customerid)
						.list();
	}
	}
	
	
	


	
	

   

	
	
	
	

