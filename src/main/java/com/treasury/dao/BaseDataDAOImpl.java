package com.treasury.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.treasury.domain.BaseDataVO;

@Repository
public class BaseDataDAOImpl implements BaseDataDAO {
	
	private static String namespace = "com.treasury.mappers.baseData";	 

	@Inject
	private SqlSession sql;
	 

	@Override
	public List<BaseDataVO> list() throws Exception {
		
		return sql.selectList(namespace + ".list");
	}

}
