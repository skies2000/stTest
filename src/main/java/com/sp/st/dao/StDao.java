package com.sp.st.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sp.st.vo.StVo;


@Repository
public class StDao {
	
	
	@Autowired
	SqlSession sqlSession;
	

	
	public void testSysout() {
		System.out.println("testSysoutDao");
	}
	
	
	
	
	public List<HashMap<String, Object>> getEmpList(){
		return sqlSession.selectList("etr.getEmpList");
	}

}
