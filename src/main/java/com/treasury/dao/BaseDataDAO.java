package com.treasury.dao;

import java.util.List;

import com.treasury.domain.BaseDataVO;

public interface BaseDataDAO {
	
	public List<BaseDataVO> list() throws Exception;

}
