package com.veggiefridge.online.dao;
import java.util.Arrays;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.veggiefridge.online.model.KioskLocation;

@Repository
public class KioskLocationDAOImpl implements KioskLocationDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
    //add location
	@Override
	public void addLocation(KioskLocation kiosklocation) {
		sessionFactory.getCurrentSession().saveOrUpdate(kiosklocation);
	}
    
	//getAllLocation
	@Override
	@SuppressWarnings("unchecked")
	public List<KioskLocation> getAllLocation() {
	return	sessionFactory.getCurrentSession().createQuery("from KioskLocation").list();	
	}
    
	//update location
	@Override
	public KioskLocation updateLoaction(KioskLocation kiosklocation) {
		sessionFactory.getCurrentSession().update(kiosklocation);
		return kiosklocation;
	}
	
	
     //delete location
	@Override
	public void deleteLocation(Long locationId) {
	KioskLocation kiosklocation =(KioskLocation) sessionFactory.getCurrentSession().load( KioskLocation.class, locationId);
					  if (null !=kiosklocation ) {
					  this.sessionFactory.getCurrentSession().delete(kiosklocation); 
					  }
		}
	
	//edit location
	 public KioskLocation getLocation(long locationid) {
		 return (KioskLocation) sessionFactory.getCurrentSession().get( KioskLocation.class, locationid);
		 
	 }
	
	}
	
		



