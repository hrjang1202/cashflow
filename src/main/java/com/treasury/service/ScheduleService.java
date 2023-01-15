package com.treasury.service;

import java.util.List;

import com.treasury.domain.ScheduleGererateVO;
import com.treasury.domain.ScheduleVO;

public interface ScheduleService {

	public List<ScheduleVO> getScheduleGenerate(List<ScheduleGererateVO> listScheduleGenerate) throws Exception;

}
