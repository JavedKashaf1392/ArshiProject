package com.veggiefridge.online.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.veggiefridge.online.dao.MembershipDAO;
import com.veggiefridge.online.model.Membership;

@Service
@Transactional
public class MembershipServiceImpl implements MembershipService{

	@Autowired
	private MembershipDAO  membershipdao;
	
	@Transactional
	@Override
	public boolean add(Membership msw) {
		try {
			membershipdao.add(msw);
			System.out.println("service add Membership method is running");
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Transactional
	@Override
	public Membership getByCustomer(int customerid) {
		System.out.println("service getByCustomer method is running");
		return membershipdao.getByCustomer(customerid);
	}

	
	@Transactional
	@Override
	public Membership get(int MembershipID) {
		return membershipdao.get(MembershipID);
	}

}
