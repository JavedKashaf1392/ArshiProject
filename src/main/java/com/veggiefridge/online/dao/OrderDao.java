package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;

public interface OrderDao {
	
	    public boolean saveOrder(Orders orders);
	    
	    public List<OrderItem> listOrderItem(int orderid);
	    
	    public Orders getOrder(int orderid);
	       
	    public List<OrderItem> getAllOrders();
	    
	    public boolean saveOrderItem(OrderItem orderitem);
	    
	    public List<Orders>  list(int customerid);
	    
		public List<OrderItem> getAllOrderItem();
		
		public List<Orders> listpendingOrders();
		
		public List<Orders> listdeliveredOrders();
		
		public List<Orders> getOrdersByStatus(String pickupStatus,int customerid);
		
}
