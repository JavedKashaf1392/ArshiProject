package com.veggiefridge.online.service;
import java.util.List;
import com.veggiefridge.online.model.Kiosk;

public interface KioskService {
	
	public void addKiosk(Kiosk kiosk);

	public List<Kiosk> getAllKisok();

	public Kiosk updateKiosk(Kiosk kiosk);
    
	public void deleteKisok(Long kioskId); 
	
	public Kiosk getKiosk(long kioskId);
	

}
