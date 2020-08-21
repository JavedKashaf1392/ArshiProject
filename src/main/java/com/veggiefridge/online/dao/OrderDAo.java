package com.veggiefridge.online.dao;

import java.util.List;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.OrderDetails;

public interface OrderDAo {
	
	
	 public void saveOrder(Item item);
	 
	 public OrderDetails getOrderInfo(String orderId);
	    
	 public List<OrderDetails> listOrderDetailInfos(String orderId);
	 

}
