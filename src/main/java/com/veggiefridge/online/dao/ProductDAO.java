package com.veggiefridge.online.dao;

import java.util.List;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.Product;

public interface ProductDAO {

	public void addProduct(Product product);

	public List<Product> getAllProducts();

	public void deleteProduct(Integer productId);

	public Product updateProduct(Product product);

	public Product getProduct(int productid); 
	
	public List<Product> getProductsBycatogary(String category);
	
	public List<Product> GetAllProductByCatogary(String category);

}
