package com.veggiefridge.online.service;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.veggiefridge.online.dao.ProductDAO;
import com.veggiefridge.online.dao.ShoopingcartDAO;
import com.veggiefridge.online.model.Item;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	private ShoopingcartDAO shoopingcartdao;
	
	@Override
	@Transactional
	public List<Item> getAllItem() {
		return shoopingcartdao.getAllItem();
	}

	@Override
	@Transactional
	public void addItem(Item item) {
		shoopingcartdao.addItem(item);
		
	}

	@Override
	public Item getItem(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
