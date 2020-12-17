package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;

public interface OrderService {
	
	public boolean saveOrder(Orders orders);
    
    public List<OrderItem> listOrderItem(int orderid);
    
    public Orders getOrder(int orderid);
       
    public List<OrderItem> getAllOrders();
    
    public boolean saveOrderItem(OrderItem orderitem);
    
    public List<Orders>  list(int customerid);
    
	public List<OrderItem> getAllOrderItem();
	
	public List<Orders> listpendingOrders();
	
	public List<Orders> listdeliveredOrders();
	
	
	public List<Orders>  getPendingOrders(int customerid);
	
	public List<Orders> getDeliveredOrders(int customerid);
	
	public Orders updateOrders(Orders orders);

}
