package com.treasury.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.treasury.dao.BaseDataDAO;
import com.treasury.domain.BaseDataVO;

@Service
public class BaseDataServiceImpl implements BaseDataService {

	@Inject
	private BaseDataDAO dao;
	 
	@Override
	public List<BaseDataVO> list() throws Exception {
		
		return dao.list();
	}

}
