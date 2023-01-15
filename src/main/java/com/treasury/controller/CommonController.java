package com.treasury.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.treasury.domain.BaseDataVO;
import com.treasury.service.BaseDataService;

@Controller
@RequestMapping("/common/*")
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Inject
	BaseDataService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String common() {

		return "treasury/common";
	}
	
	@RequestMapping(value = "/baseData", method = RequestMethod.GET)
	public String baseData() {

		return "treasury/common/baseData";
	}
	
	@RequestMapping(value = "/baseDataList", method = RequestMethod.GET)
	public String getBaseDataList(Model model) throws Exception {
		
		List<BaseDataVO> list = null;
		list = service.list();
		
		model.addAttribute("baseDataList", list);
		
		logger.info(list.toString());
		
		return "treasury/common/baseData";

	}

}
