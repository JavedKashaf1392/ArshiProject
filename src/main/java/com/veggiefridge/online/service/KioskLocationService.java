package com.veggiefridge.online.service;

import java.util.List;

import com.veggiefridge.online.model.KioskLocation;


public interface KioskLocationService {
	
	public void addLocation(KioskLocation kiosklocation);

	public List<KioskLocation > getAllLocation();

	public KioskLocation updateLocation(KioskLocation kiosklocation);
    
	public void deleteLocation(Long locationId); 
	
	public KioskLocation getLocation(long locationid);
	

}
