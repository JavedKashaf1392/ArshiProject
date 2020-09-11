package com.veggiefridge.online.service;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.veggiefridge.online.dao.ProductDAO;
import com.veggiefridge.online.dao.ShoppingcartDAO;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Item;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.TempOrderDetails;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	private ProductDAO productDAO;
		
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ShoppingcartDAO shoopingcartDAO;

	@Override
	public void addTempOrderDetails(TempOrderDetails tod) {
     shoopingcartDAO.addTempOrderDetails(tod);		
	}

	@Override
	public TempOrderDetails getTempOrderDetails(int todid) {
		return shoopingcartDAO.getTempOrderDetails(todid);
	}

	@Override
	public List<TempOrderDetails> getTempOrderDetails() {
		return shoopingcartDAO.getTempOrderDetails();
	}

	@Override
	public TempOrderDetails getByProduct(int productid) {
		return shoopingcartDAO.getByProduct(productid);
	}	
}

	

	

