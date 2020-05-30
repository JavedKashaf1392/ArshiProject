package com.veggiefridge.online.dao;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.Kiosk;


@Repository
public class KioskDAOImpl implements KioskDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
    //addKiosk
	@Override
	public void addKiosk(Kiosk kiosk) {
    sessionFactory.getCurrentSession().saveOrUpdate(kiosk);	
	}
    
	//getAllKiosk
	@Override
	public List<Kiosk> getAllKiosk() {
		return sessionFactory.getCurrentSession().createQuery("from Kiosk").list();	
	}
    
	//updateKiosk
	@Override
	public Kiosk updateKiosk(Kiosk kiosk) {
		sessionFactory.getCurrentSession().update(kiosk);
		return kiosk;
	}

	//deleteKiosk
	@Override
	public void deleteKiosk(Long kioskId) {
		Kiosk kiosk =(Kiosk) sessionFactory.getCurrentSession().load( Kiosk.class, kioskId);
		  if (null !=kiosk ) {
		  this.sessionFactory.getCurrentSession().delete(kiosk); 
		  }
}

	//getKiosk
	@Override
	public Kiosk getKiosk(long kioskId) {
		 return (Kiosk) sessionFactory.getCurrentSession().get( Kiosk.class, kioskId);
	}

}
