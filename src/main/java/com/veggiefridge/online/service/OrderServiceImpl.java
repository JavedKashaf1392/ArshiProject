package com.veggiefridge.online.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.OrderDao;
import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.OrderItemDetails;

@Repository
@Transactional
public class OrderServiceImpl implements OrderService {
	
	
	@Autowired
	private OrderDao orderdao;

	@Override
	public boolean saveOrder(OrderItemDetails orderitemdetails){
		try {	
			orderdao.saveOrder(orderitemdetails);
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public OrderItem getOrderItem(String orderItemDetailsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItem> listOrderOrderItem(String orderItemDetailsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderItemDetails> getAllOrderItemDetails() {
		return orderdao.getAllOrderItemDetails();
	}

	@Override
	public boolean saveOrderItem(OrderItem orderitem) {
		return orderdao.saveOrderItem(orderitem);
	}

}
