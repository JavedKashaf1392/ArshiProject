package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.CartItem;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;

public interface OrderDao {
	
	    public boolean saveOrder(OrderItemDetails orderitemdetails);
	    
	    public List<OrderItem> listOrderItem(String orderItemDetailsId);
	    
	    public OrderItemDetails getOrderItemDetails(String orderItemDetailsId);
	       
	    public List<OrderItemDetails> getAllOrderItemDetails();
	    
	    public boolean saveOrderItem(OrderItem orderitem);
}
