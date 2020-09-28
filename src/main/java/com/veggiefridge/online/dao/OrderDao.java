package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;

public interface OrderDao {
	
	    public boolean saveOrder(OrderItemDetails orderitemdetails);
	    
	    public List<OrderItem> listOrderItem(int orderItemDetailsId);
	    
	    public OrderItemDetails getOrderItemDetails(int orderItemDetailsId);
	       
	    public List<OrderItemDetails> getAllOrderItemDetails();
	    
	    public boolean saveOrderItem(OrderItem orderitem);
	    
	    public List<OrderItemDetails>  list(int customerid);
	    
	    public OrderItemDetails get(int orderItemDetailsId);
	    
		public List<OrderItem> getAllOrderItem();
		
		public List<OrderItemDetails> listOrderItemDetails();
		
		public List<OrderItemDetails> listdelOrderItemDetails();
		
}
