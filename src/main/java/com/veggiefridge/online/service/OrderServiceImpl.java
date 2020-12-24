package com.veggiefridge.online.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.OrderDao;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;

@Repository
@Transactional
public class OrderServiceImpl implements OrderService {
	
	
	@Autowired
	private OrderDao orderdao;

	@Override
	public boolean saveOrder(Orders orders){
		try {	
			orderdao.saveOrder(orders);
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public List<OrderItem> listOrderItem(int orderid) {
		return orderdao.listOrderItem(orderid);
	}

	@Override
	public Orders getOrder(int orderid) {
		return orderdao.getOrder(orderid);
	}

	@Override
	public List<OrderItem> getAllOrders() {
		return orderdao.getAllOrders();
	}

	@Override
	public boolean saveOrderItem(OrderItem orderitem) {
		return orderdao.saveOrderItem(orderitem);
	}

	@Override
	public List<Orders> list(int customerid) {
		return orderdao.list(customerid);
	}

	@Override
	public List<OrderItem> getAllOrderItem() {
		return orderdao.getAllOrderItem();
	}

	@Override
	public List<Orders> listpendingOrders() {
		return orderdao.listpendingOrders();
	}

	@Override
	public List<Orders> listdeliveredOrders() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders> getPendingOrders(int customerid) {
		
		return orderdao.getPendingOrders(customerid);
	}

	@Override
	public List<Orders> getDeliveredOrders(int customerid) {
		return orderdao.getDeliveredOrders(customerid);
	}

	@Override
	public Orders updateOrders(Orders orders) {
		return orderdao.updateOrders(orders);
	}

	@Override
	public List<Orders> getCancelledOrders(int customerid) {
		return orderdao.getCancelledOrders(customerid);
	}

}
