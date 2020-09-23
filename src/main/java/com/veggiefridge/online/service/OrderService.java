package com.veggiefridge.online.service;
import java.util.List;

import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;

public interface OrderService {
	
	    public boolean saveOrder(OrderItemDetails orderItemdetails);
		 
	    public OrderItem getOrderItem(String  orderItemDetailsId);
	    
	    public List<OrderItem> listOrderOrderItem(String orderItemDetailsId);
        
	    public List<OrderItemDetails> getAllOrderItemDetails();
	    
	    public boolean saveOrderItem(OrderItem orderitem);
}
