package com.veggiefridge.online.dao;
import java.util.List;
import com.veggiefridge.online.model.Item;

public interface ShoopingcartDAO {
	
	public List<Item>getAllItem();
	
	public void addItem(Item item);
	
	public Item getItem(int id);
	
		

}
