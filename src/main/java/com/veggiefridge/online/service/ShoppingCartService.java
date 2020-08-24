package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.Item;

public interface ShoppingCartService {

    public List<Item>getAllItem();
	
	public void addItem(Item item);
	
	public Item getItem(int id);
	
	
}
