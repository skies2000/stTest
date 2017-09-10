package com.sp.st.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.st.dao.StDao;
import com.sp.st.vo.StVo;

@Service
public class StService {
	
	@Autowired
	StDao dao;
	

	public void testSysout() {
		dao.testSysout();
		System.out.println("sysoutService");
	}
	

	
	public List<HashMap<String, Object>> getEmpList(){
		return dao.getEmpList();
	}
}
