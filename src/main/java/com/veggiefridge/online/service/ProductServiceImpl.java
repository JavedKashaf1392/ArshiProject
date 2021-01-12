package com.veggiefridge.online.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.ProductDAO;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.Product;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Override
	@Transactional
	public void addProduct(Product product) {
		productDAO.addProduct(product);
	}

	@Override
	@Transactional
	public List<Product> getAllProducts() {
		return productDAO.getAllProducts();
	}

	@Override
	@Transactional
	public void deleteProduct(Integer productId) {
		productDAO.deleteProduct(productId);
	}

	@Override
	public Product getProduct(int productid) {
		 return productDAO.getProduct(productid);
	}

	@Override
	public Product updateProduct(Product product) {
		 return productDAO.updateProduct(product);
		
	}

	  public void setProductDAO(ProductDAO productDAO) { 
		  this.productDAO = productDAO;
		  }

	@Override
	public List<Product> getProductsBycatogary(String category) {
		return productDAO.getProductsBycatogary(category);
	}

	@Override
	public List<Images> getImagesBySection(String imageSection) {
		return productDAO.getImagesBySection(imageSection);
	}

	@Override
	public List<Menu> getMenuByNavbar(String section) {
		return productDAO.getMenuByNavbar(section);
	}
}
	
