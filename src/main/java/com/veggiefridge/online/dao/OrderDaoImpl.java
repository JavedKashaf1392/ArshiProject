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
import com.veggiefridge.online.model.OrderItemDetails;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;

@Repository
@Transactional
public class OrderDaoImpl implements OrderDao{


	@Autowired
	private SessionFactory sessionFactory;
	
	private int getMaxOrderNum(){
        String sql = "Select max(o.orderNum) from " + OrderItemDetails.class.getName() + " o ";
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(sql);
        Integer value = (Integer) query.uniqueResult();
        if (value == null) {
            return 0;
        }
        return value;
    }
	

	    @Override
	    public boolean saveOrder(OrderItemDetails orderitemdetails) {
	    	try {			
				sessionFactory.getCurrentSession().persist(orderitemdetails);			
				return true;
			}
			catch(Exception ex) {
				return false;
			}
	
	}
	
	    
	@Override
	public List<OrderItem> listOrderItem(int orderItemDetailsId) {
		String query = "FROM OrderItem  WHERE orderitemdetails.orderItemDetailsId= : orderItemDetailsId";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("orderItemDetailsId",orderItemDetailsId)
										.list();
	}

	
	
	@Override
	public List<OrderItemDetails> getAllOrderItemDetails(){
		return sessionFactory.getCurrentSession().createQuery("from OrderItemDetails").list();
		}


	@Override
	public OrderItemDetails getOrderItemDetails(int orderItemDetailsId) {
		// TODO Auto-generated method stub
		return null;
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
	public List<OrderItemDetails> list(int customerid) {
		String query = "FROM OrderItemDetails  WHERE customer.customerid =:customerid";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("customerid",customerid)
										.list();
	}

	

	@Override
	public OrderItemDetails get(int orderItemDetailsId) {
		return (OrderItemDetails) sessionFactory.getCurrentSession().get(OrderItemDetails.class, orderItemDetailsId);
	}

	
	@Override
	public List<OrderItem> getAllOrderItem() {
		return sessionFactory.getCurrentSession().createQuery("from OrderItem").list();
	}


	@Override
	public List<OrderItemDetails> listOrderItemDetails(){
		
		String query = "FROM OrderItemDetails WHERE  pickupStatus =:pickupStatus";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("pickupStatus",VFOnlineConstants.PICKUP_STATUS)
										.list();	
	}


	@Override
	public List<OrderItemDetails> listdelOrderItemDetails() {
		String query = "FROM OrderItemDetails WHERE  pickupStatus =:pickupStatus";
		return sessionFactory.getCurrentSession()
									.createQuery(query)
										.setParameter("pickupStatus",VFOnlineConstants.PICKUPSTATUS)
										.list();	
	}
	}
	
	
	


	
	

   

	
	
	
	

