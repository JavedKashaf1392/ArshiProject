package com.veggiefridge.online.dao;

import java.util.List;
import com.veggiefridge.online.model.KioskLocation;

public interface KioskLocationDAO {
	
   public void addLocation(KioskLocation kiosklocation);

   public List<KioskLocation> getAllLocation();
	
   public KioskLocation updateLoaction(KioskLocation kiosklocation);
    
   public void deleteLocation(Long locationId);
   
   public KioskLocation getLocation(long locationid);
   
       
}
