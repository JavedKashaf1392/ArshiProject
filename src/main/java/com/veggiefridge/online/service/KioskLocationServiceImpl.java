package com.veggiefridge.online.service;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.KioskLocationDAO;
import com.veggiefridge.online.model.KioskLocation;

@Service
@Transactional
public class KioskLocationServiceImpl implements KioskLocationService {
     
	 @Autowired
	 private  KioskLocationDAO dao;
	
	  //add location
      @Override
      @Transactional
	public void addLocation(KioskLocation kiosklocation) {
    	  dao.addLocation(kiosklocation);		
	}
    
     //get all location
	@Override
	@Transactional
	public List<KioskLocation> getAllLocation() {
		return dao.getAllLocation();
	}
     
	//update location
	@Override
	public KioskLocation updateLocation(KioskLocation kiosklocation) {
		return dao.updateLoaction(kiosklocation);
	}
     
	//delete location
	 @Transactional
	 public void deleteLocation(Long locationId) {
	 dao.deleteLocation(locationId);  
	  }
	  
	//edit location
	@Override
	public KioskLocation getLocation(long locationid) {
		return  dao.getLocation(locationid);
		
	}
	
	
	}	

	

