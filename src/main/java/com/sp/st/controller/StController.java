package com.sp.st.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.st.HomeController;
import com.sp.st.service.StService;
import com.sp.st.vo.StVo;

import net.sf.json.JSONObject;

@Controller
public class StController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@Autowired
	StService stService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<StVo> list = null;
		
	
		
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		System.out.println("testCotroller");
		
		
		
		
		
		return "home";
	}

	
	
	@RequestMapping(value="/getList", method = RequestMethod.GET)
	@ResponseBody
	public Object getList(Locale locale, Model model, HttpServletRequest request) {
		
		//현재페이지
		String current_page = request.getParameter("page");
		//한페이지에 최대 몇개의 row 출력(mysql의 limit에 속하는데이터)
		String numper_page = request.getParameter("rows");
		JSONObject jsonObj = new JSONObject();
		JSONObject jsonObj2 = null;
		JSONArray jsonArray = new JSONArray();
		     
		if(current_page.equals("1")) {
		    jsonObj2 = new JSONObject();
		    jsonObj2.put("seq", "1");
		    jsonObj2.put("title", "제목");
		    jsonObj2.put("create_date", "2014-11-11");
		    jsonObj2.put("create_name", "개발로짜");
		    jsonObj2.put("hitnum", "1");
		    jsonArray.add(jsonObj2);
		     
		    jsonObj2 = new JSONObject();
		    jsonObj2.put("seq", "2");
		    jsonObj2.put("title", "제목2");
		    jsonObj2.put("create_date", "2014-11-15");
		    jsonObj2.put("create_name", "개발로짜");
		    jsonObj2.put("hitnum", "20");
		    jsonArray.add(jsonObj2);
		} else if(current_page.equals("2")) {
		    jsonObj2 = new JSONObject();
		    jsonObj2.put("seq", "3");
		    jsonObj2.put("title", "제목33");
		    jsonObj2.put("create_date", "2014-11-11");
		    jsonObj2.put("create_name", "개발로짜33");
		    jsonObj2.put("hitnum", "8");
		    jsonArray.add(jsonObj2);
		     
		    jsonObj2 = new JSONObject();
		    jsonObj2.put("seq", "4");
		    jsonObj2.put("title", "제목4444");
		    jsonObj2.put("create_date", "2014-11-15");
		    jsonObj2.put("create_name", "개발로짜12");
		    jsonObj2.put("hitnum", "2");
		    jsonArray.add(jsonObj2);
		}
		 
		//현재페이지의 목록데이터
		jsonObj.put("rows", jsonArray);
		//현재페이지
		jsonObj.put("page", current_page);
		//총페이지수
		jsonObj.put("total", 2);
		//총글목록수
		jsonObj.put("records", 4);



		return jsonArray;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value="/getEmpList",method = RequestMethod.GET)
	@ResponseBody
	public Object getEmpList() {
		/*JSONArray jar = new JSONArray();
		JSONObject root = new JSONObject();*/
		
		
		HashMap<String, Object> root = new HashMap<String, Object>();
				
		List<HashMap<String, Object>>list = stService.getEmpList();
		
		
		
		
		
		root.put("total", 2);
		root.put("records", list.size());
		
		
		
		root.put("user", list);
		
		return root;
	}
	
	
}
