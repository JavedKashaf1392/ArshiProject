package com.veggiefridge.online.dao;
import java.io.Serializable;
import java.util.List;
import com.veggiefridge.online.model.Kiosk;


public interface KioskDAO {
	
	 public void addKiosk(Kiosk kiosk);

	 public List<Kiosk> getAllKiosk();
		
	 public Kiosk updateKiosk(Kiosk kiosk);
	    
	 public void deleteKiosk(Long id);
	   
	 public Kiosk getKiosk(long id);

}
