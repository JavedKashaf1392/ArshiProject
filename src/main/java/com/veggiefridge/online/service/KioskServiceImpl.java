package com.veggiefridge.online.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.KioskDAO;
import com.veggiefridge.online.model.Kiosk;

@Service
@Transactional
public class KioskServiceImpl implements KioskService{
	
	@Autowired
	private  KioskDAO dao;

	
	//addKiosk
	@Override
	public void addKiosk(Kiosk kiosk) {
		dao.addKiosk(kiosk);
		
	}

	//getAllKisok
	@Override
	public List<Kiosk> getAllKisok() {
		return dao.getAllKiosk();
	}

	//updateKiosk
	@Override
	public Kiosk updateKiosk(Kiosk kiosk) {
		return dao.updateKiosk(kiosk);
	}

	//deleteKisok
	@Override
	public void deleteKiosk(Long id) {
		dao.deleteKiosk(id);
		
	}

	//getKiosk
	@Override
	public Kiosk getKiosk(long id) {
		return  dao.getKiosk(id);
	}

}
