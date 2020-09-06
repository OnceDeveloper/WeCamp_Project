package com.wecamp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.wecamp.service.search.SearchService;
import com.wecamp.vo.SearchResultVo;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("search")
public class SearchController {
	@Autowired 
	private SearchService searchService;
	
	//String checkIn, String checkOut, String peopleNum 고민해야함(Session?)
	@GetMapping("search.wcc")
	private ModelAndView search(String searchPlace, String checkIn, String checkOut, String peopleNum, HttpSession session, HttpServletRequest request) {

		session.setAttribute("cp", 1);
		SearchResultVo result = searchService.searchCampList(searchPlace, false, session, request);
		ModelAndView response = new ModelAndView("client/result/map");
		response.addObject("vo", result);
		response.addObject("checkIn", checkIn);
		response.addObject("checkOut", checkOut);		
		response.addObject("peopleNum", peopleNum);		
		response.addObject("searchPlace", searchPlace);		
		return response;
	}
	
	@PostMapping("loadMore.wcc")
	private ModelAndView loadMore(String searchPlace, HttpSession session, HttpServletRequest request) {

		int cp = Integer.parseInt(session.getAttribute("cp").toString());
		cp = cp +1;
		session.setAttribute("cp", cp); 
		SearchResultVo result = searchService.searchCampList(searchPlace, true, session, request);
		ModelAndView response = new ModelAndView("client/result/mapList");
		if(result!=null) { 
			response.addObject("vo", result); 
		}else {
			response = new ModelAndView(); 
		} 
		return response; 
	}

}

