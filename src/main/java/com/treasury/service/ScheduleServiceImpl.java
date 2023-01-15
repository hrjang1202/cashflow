package com.treasury.service;

import java.math.BigDecimal;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.treasury.controller.DealingController;
import com.treasury.dao.BaseDataDAO;
import com.treasury.domain.ScheduleGererateVO;
import com.treasury.domain.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(DealingController.class);
	@Inject
	private BaseDataDAO dao;

	@Override
	public List<ScheduleVO> getScheduleGenerate(List<ScheduleGererateVO> listScheduleGenerate) throws Exception 
	{
		List<ScheduleVO> listSchedule = new  ArrayList<ScheduleVO>();
		
		for (int i=0; i<listScheduleGenerate.size(); i++)
		{
			getScheduleGenerate(listScheduleGenerate.get(i), listSchedule);
		}
		
		return listSchedule;
	}

	private void getScheduleGenerate(ScheduleGererateVO scheduleGererateVO, List<ScheduleVO> listSchedule) 
	{
		ScheduleVO schedule = null;
		
		//1 = 원금
		//3 = 수수료
		if (	"1".equals(scheduleGererateVO.getSchedule_type()) == true
			||	"3".equals(scheduleGererateVO.getSchedule_type()) == true	
			)
		{
			schedule = new ScheduleVO();
			
			schedule.setLeg_number(scheduleGererateVO.getLeg_number());
			schedule.setPay_receive(scheduleGererateVO.getPay_receive());
			schedule.setSchedule_type(scheduleGererateVO.getSchedule_type());
			schedule.setSchedule_date(scheduleGererateVO.getSchedule_date());
			schedule.setSchedule_currency(scheduleGererateVO.getSchedule_currency());
			schedule.setSchedule_amount(scheduleGererateVO.getSchedule_amount().setScale(2, BigDecimal.ROUND_CEILING));
			
			if (schedule.getSchedule_amount().compareTo(BigDecimal.ZERO) > 0)
			{
				listSchedule.add(schedule);
			}
		}
		//2 = 이자
		else if ("2".equals(scheduleGererateVO.getSchedule_type()) == true)
		{
			String strFrequencyStartDate = "";
			String strFrequencyEndDate = "";
			int intFrequencymultifier = 0;
			String strFrequencyPeriod = "";
			String strStubPeriodType = "";
			
			
			/*************************
			 * 이자계산주기 생성
			 *************************/
			strFrequencyStartDate = scheduleGererateVO.getEffective_date();
			strFrequencyEndDate = scheduleGererateVO.getTermination_date();
			intFrequencymultifier = scheduleGererateVO.getCalculation_frequency_multifier();
			strFrequencyPeriod = scheduleGererateVO.getCalculation_frequency_period();
			strStubPeriodType = scheduleGererateVO.getStub_period_type();
			
			Map<String, Object> result = getFrequency("Calculation Frequency", strFrequencyStartDate, strFrequencyEndDate, intFrequencymultifier, strFrequencyPeriod, strStubPeriodType);

			//이자계산주기
			List<String> listCalculationFrequency = (List<String>) result.get("frequency");
			
			//정기이자계산시작일
			String strFirstRegularPeriodStartDate = (String) result.get("firstRegularPeriodStartDate");
			//정기이자계산종료일
			String strFirstRegularPeriodEndDate = (String) result.get("firstRegularPeriodEndDate");
			
			if (strFirstRegularPeriodStartDate.isEmpty() == false)
			{
				strFrequencyStartDate = strFirstRegularPeriodStartDate;
			}
			
			if (strFirstRegularPeriodEndDate.isEmpty() == false)
			{
				strFrequencyEndDate = strFirstRegularPeriodEndDate;
			}
					
			
			/*************************
			 * 이자지급주기 생성
			 *************************/
			intFrequencymultifier = scheduleGererateVO.getPayment_frequency_multifier();
			strFrequencyPeriod = scheduleGererateVO.getPayment_frequency_period();
			
			result = getFrequency("Payment Frequency", strFrequencyStartDate, strFrequencyEndDate, intFrequencymultifier, strFrequencyPeriod, null);
			
			//이자지급주기
			List<String> listPaymentFrequency = (List<String>) result.get("frequency");
			
			
			/*************************
			 * 변동금리 재조정 주기 생성
			 *************************/
			intFrequencymultifier = scheduleGererateVO.getFixing_frequency_multifier();
			strFrequencyPeriod = scheduleGererateVO.getFixing_frequency_period();
			
			result = getFrequency("Fixing Frequency", strFrequencyStartDate, strFrequencyEndDate, intFrequencymultifier, strFrequencyPeriod, null);
			
			//변동금리 재조정 주기
			List<String> listFixingFrequency = (List<String>) result.get("frequency");
			
			
			/*************************
			 * 이자계산주기를 기준으로 최종 스케줄 생성
			 *************************/
			BigDecimal bdNotionalAmount = BigDecimal.ZERO;
			
			for (int i=0; i<listCalculationFrequency.size()-1; i++)
			{
				schedule = new ScheduleVO();
				
				schedule.setLeg_number(scheduleGererateVO.getLeg_number());
				schedule.setPay_receive(scheduleGererateVO.getPay_receive());
				schedule.setSchedule_type(scheduleGererateVO.getSchedule_type());
				schedule.setNotional_currency(scheduleGererateVO.getNotional_currency());
				
				if (i == 0)
				{
					bdNotionalAmount = scheduleGererateVO.getNotional_amount().setScale(2, BigDecimal.ROUND_CEILING);
				}
				else
				{
					if ("2".equals(scheduleGererateVO.getNotional_amount_change_type()) == true) //2 = Accreting
					{
						bdNotionalAmount = bdNotionalAmount.add(scheduleGererateVO.getNotional_amount_change_amount());
					}
					else if ("3".equals(scheduleGererateVO.getNotional_amount_change_type()) == true) //3 = Amortising
					{
						bdNotionalAmount = bdNotionalAmount.subtract(scheduleGererateVO.getNotional_amount_change_amount());
					}
				}
				
				schedule.setNotional_amount(bdNotionalAmount);
				
				schedule.setCalculation_start_date(listCalculationFrequency.get(i));
				schedule.setCalculation_end_date(listCalculationFrequency.get(i+1));
				
				LocalDate dtCalculationStartDate = LocalDate.parse(listCalculationFrequency.get(i), DateTimeFormatter.ISO_DATE);
				LocalDate dtCalculationEndDate = LocalDate.parse(listCalculationFrequency.get(i+1), DateTimeFormatter.ISO_DATE);
				long lCalculationDays = ChronoUnit.DAYS.between(dtCalculationStartDate, dtCalculationEndDate);
				
				schedule.setCalculation_days(String.valueOf(lCalculationDays));
				
				//이자지급주기
				for (int j=0; j<listPaymentFrequency.size(); j++)
				{
					LocalDate dtTemp = LocalDate.parse(listPaymentFrequency.get(j), DateTimeFormatter.ISO_DATE);
					String strPaymentRelativeTo = scheduleGererateVO.getPayment_relative_to();
					int intPayemntDatesOffsetDays = scheduleGererateVO.getPayment_dates_offset_days();
					
					if ("1".equals(strPaymentRelativeTo) == true) //1 = Caculation End Date
					{
						if (	dtTemp.isEqual(dtCalculationEndDate) == true
							||	dtTemp.isAfter(dtCalculationEndDate) == true
							)
						{
							schedule.setSchedule_date(dtTemp.plusDays(intPayemntDatesOffsetDays).toString());
							break;
						}
					}
					else if ("2".equals(strPaymentRelativeTo) == true) //2 = Caculation Start Date
					{
						if (	dtTemp.isEqual(dtCalculationStartDate) == true
							||	dtTemp.isBefore(dtCalculationStartDate) == true
							)
						{
							schedule.setSchedule_date(dtTemp.plusDays(intPayemntDatesOffsetDays).toString());
							//break;
						}
					}
				}
				
				//변동금리 재조정 주기
				for (int j=0; j<listFixingFrequency.size(); j++)
				{
					LocalDate dtTemp = LocalDate.parse(listFixingFrequency.get(j), DateTimeFormatter.ISO_DATE);
					String strFixingRelativeTo = scheduleGererateVO.getFixing_relative_to();
					int intFixingDatesOffsetDays = scheduleGererateVO.getFixing_dates_offset_days();
					
					if ("1".equals(strFixingRelativeTo) == true) //1 = Caculation End Date
					{
						if (	dtTemp.isEqual(dtCalculationEndDate) == true
							||	dtTemp.isAfter(dtCalculationEndDate) == true
							)
						{
							schedule.setFixing_date(dtTemp.plusDays(intFixingDatesOffsetDays).toString());
							
							if (j == 0)
							{
								schedule.setFixing_yn("Y");
							}
							else
							{
								schedule.setFixing_yn("N");
							}
							
							break;
						}
					}
					else if ("2".equals(strFixingRelativeTo) == true) //2 = Caculation Start Date
					{
						if (	dtTemp.isEqual(dtCalculationStartDate) == true
							||	dtTemp.isBefore(dtCalculationStartDate) == true
							)
						{
							schedule.setFixing_date(dtTemp.plusDays(intFixingDatesOffsetDays).toString());
							
							if (j == 0)
							{
								schedule.setFixing_yn("Y");
							}
							else
							{
								schedule.setFixing_yn("N");
							}
							
							//break;
						}
					}
					
				}
				
				
				if (scheduleGererateVO.getFixed_rate() != BigDecimal.ZERO)
				{
					schedule.setInterest_rate(scheduleGererateVO.getFixed_rate());
					schedule.setInterest_total_rate(schedule.getInterest_rate());
				}
				else if (scheduleGererateVO.getInitial_floating_rate() != BigDecimal.ZERO)
				{
					schedule.setInterest_rate(scheduleGererateVO.getInitial_floating_rate());
					schedule.setInterest_spread_rate(scheduleGererateVO.getFloating_rate_spread());
					
					BigDecimal bdTotalRate = BigDecimal.ZERO;
					BigDecimal bdFloatingRateMuliplier = new BigDecimal(String.valueOf(scheduleGererateVO.getFloating_rate_multiplier()));
					
					bdTotalRate = schedule.getInterest_rate().add(schedule.getInterest_spread_rate());
					bdTotalRate = bdTotalRate.multiply(bdFloatingRateMuliplier);
					
					schedule.setInterest_total_rate(bdTotalRate);
				}
				
				schedule.setSchedule_currency(scheduleGererateVO.getNotional_currency());
				
				BigDecimal bdCalculationDays = new BigDecimal(schedule.getCalculation_days());
				BigDecimal bdOneHundred = new BigDecimal("100");
				BigDecimal bdYear = new BigDecimal("360");
				BigDecimal bdScheduleAmount = BigDecimal.ZERO;
				
				//이자금액 = 명목금액  * 이자율 / 100 * 이자일수 / 360 
				bdScheduleAmount = schedule.getNotional_amount();
				bdScheduleAmount = bdScheduleAmount.multiply(schedule.getInterest_total_rate());
				bdScheduleAmount = bdScheduleAmount.divide(bdOneHundred, 2, BigDecimal.ROUND_CEILING);
				bdScheduleAmount = bdScheduleAmount.multiply(bdCalculationDays);
				bdScheduleAmount = bdScheduleAmount.divide(bdYear, 2, BigDecimal.ROUND_CEILING);
				
				schedule.setSchedule_amount(bdScheduleAmount);
				
				listSchedule.add(schedule);
			}
		}
		
		return;
	}

	private Map<String, Object> getFrequency(String strFrequencyType, String strFrequencyStartDate, String strFrequencyEndDate, int intFrequencymultifier, String strFrequencyPeriod, String strStubPeriodType) 
	{
		LOGGER.info("=============================================");
		LOGGER.info("getFrequency Start (" + strFrequencyType + ")");
		LOGGER.info("=============================================");
		LOGGER.info("strFrequencyStartDate -> " + strFrequencyStartDate);
		LOGGER.info("strFrequencyEndDate -> " + strFrequencyEndDate);
		LOGGER.info("intFrequencymultifier -> " + intFrequencymultifier);
		LOGGER.info("strFrequencyPeriod -> " + strFrequencyPeriod);
		LOGGER.info("strStubPeriodType -> " + strStubPeriodType);
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> listFrequency = new ArrayList<String>();
		String strFirstRegularPeriodStartDate = "";
		String strFirstRegularPeriodEndDate = ""; 
	
		
		try 
		{
			if (strFrequencyStartDate.isEmpty() == true || strFrequencyEndDate.isEmpty() == true || intFrequencymultifier == 0 || strFrequencyPeriod.isEmpty() == true)
			{
				result.put("frequency", listFrequency);
				result.put("firstRegularPeriodStartDate", strFirstRegularPeriodStartDate);
				result.put("firstRegularPeriodEndDate", strFirstRegularPeriodEndDate);
				
				return result;
			}
			
			LocalDate dtStartDate = LocalDate.parse(strFrequencyStartDate, DateTimeFormatter.ISO_DATE);
			LocalDate dtEndDate = LocalDate.parse(strFrequencyEndDate, DateTimeFormatter.ISO_DATE);
			
			if (dtStartDate.isBefore(dtEndDate) == false)
			{
				result.put("frequency", listFrequency);
				result.put("firstRegularPeriodStartDate", strFirstRegularPeriodStartDate);
				result.put("firstRegularPeriodEndDate", strFirstRegularPeriodEndDate);
				
				return result;
			}
			
			long lPeriod = 0; 
			long lLoop = 0;
			double dStub = 0;
			
			if ("D".equals(strFrequencyPeriod) == true)
			{
				lPeriod = ChronoUnit.DAYS.between(dtStartDate, dtEndDate);
			}
			else if ("W".equals(strFrequencyPeriod) == true)
			{
				lPeriod = ChronoUnit.WEEKS.between(dtStartDate, dtEndDate);
			}
			else if ("M".equals(strFrequencyPeriod) == true)
			{
				lPeriod = ChronoUnit.MONTHS.between(dtStartDate, dtEndDate);
			}
			else if ("Y".equals(strFrequencyPeriod) == true)
			{
				lPeriod = ChronoUnit.YEARS.between(dtStartDate, dtEndDate);
			}
			
			lLoop = lPeriod / intFrequencymultifier;
			dStub = ((double)lPeriod / (double)intFrequencymultifier) - lLoop;
			
			//1 = Long Initial, 2 = Long Final
			if ("1".equals(strStubPeriodType) == true || "2".equals(strStubPeriodType) == true) 
			{
				if (dStub > 0)
				{
					lLoop = lLoop - 1;
				}
			}
			
			LOGGER.info("Loop -> " + lLoop);
			
			/*
			 
			 ex) From 2020/12/20 To 2021/11/20, Period 11 Month, Frequency 3M
			 
			 1 = Long Initial
			 
			 ▼____________5M_____________▼______3M_______▼______3M_______▼
			 2020/12/20		             2020/05/20	     2020/08/20	     2020/11/20
			 
			 
			 2 = Long Final
			 
			 ▼______3M_______▼______3M_______▼____________5M_____________▼
			 2020/12/20		 2020/03/20	     2020/06/20	                 2020/11/20
			 
			 
			 3 = Short Initial
			 
			 ▼____2M_____▼______3M_______▼______3M_______▼______3M_______▼
			 2020/12/20	 2020/02/20	     2020/05/20	     2020/08/20	     2020/11/20
			 
			 
			 4 = Short Final
			 
			 ▼______3M_______▼______3M_______▼______3M_______▼____2M_____▼
			 2020/12/20		 2020/03/20	     2020/06/20	     2020/09/20  2020/11/20
			 
			*/
			
			
			//1 = Long Initial, 3 = Short Initial
			if ("1".equals(strStubPeriodType) == true || "3".equals(strStubPeriodType) == true)
			{
				//정기이자계산종료일
				strFirstRegularPeriodEndDate = dtEndDate.toString();
				
				listFrequency.add(dtEndDate.toString());
				
				for (long i=0; i<lLoop; i++)
				{
					if ("D".equals(strFrequencyPeriod) == true)
					{
						dtEndDate = dtEndDate.minusDays(intFrequencymultifier);
					} 
					else if ("W".equals(strFrequencyPeriod) == true)
					{
						dtEndDate = dtEndDate.minusWeeks(intFrequencymultifier);
					}
					else if ("M".equals(strFrequencyPeriod) == true)
					{
						dtEndDate = dtEndDate.minusMonths(intFrequencymultifier);
					}
					else if ("Y".equals(strFrequencyPeriod) == true)
					{
						dtEndDate = dtEndDate.minusYears(intFrequencymultifier);
					}
					
					listFrequency.add(dtEndDate.toString());
				}
				
				//정기이자계산시작일
				strFirstRegularPeriodStartDate = dtEndDate.toString();
				
				if (dtStartDate.isBefore(dtEndDate) == true)
				{
					listFrequency.add(dtStartDate.toString());
				}
				
			}
			//2 = Long Final, 4 = Short Final
			else if ("2".equals(strStubPeriodType) == true || "4".equals(strStubPeriodType) == true)
			{
				//정기이자계산시작일
				strFirstRegularPeriodStartDate = dtStartDate.toString();
				
				listFrequency.add(dtStartDate.toString());
				
				for (long i=0; i<lLoop; i++)
				{
					if ("D".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusDays(intFrequencymultifier);
					} 
					else if ("W".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusWeeks(intFrequencymultifier);
					}
					else if ("M".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusMonths(intFrequencymultifier);
					}
					else if ("Y".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusYears(intFrequencymultifier);
					}
					
					listFrequency.add(dtStartDate.toString());
				}
				
				//정기이자계산종료일
				strFirstRegularPeriodEndDate = dtStartDate.toString();
				
				if (dtEndDate.isBefore(dtStartDate) == true)
				{
					listFrequency.add(dtEndDate.toString());
				}
				
			}
			else
			{
				listFrequency.add(dtStartDate.toString());
				
				for (long i=0; i<lLoop; i++)
				{
					if ("D".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusDays(intFrequencymultifier);
					} 
					else if ("W".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusWeeks(intFrequencymultifier);
					}
					else if ("M".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusMonths(intFrequencymultifier);
					}
					else if ("Y".equals(strFrequencyPeriod) == true)
					{
						dtStartDate = dtStartDate.plusYears(intFrequencymultifier);
					}
					
					listFrequency.add(dtStartDate.toString());
				}
				
				if (dtStartDate.isBefore(dtEndDate) == true)
				{
					listFrequency.add(dtEndDate.toString());
				}
			}
			
			Collections.sort(listFrequency);
			
			result.put("frequency", listFrequency);
			result.put("firstRegularPeriodStartDate", strFirstRegularPeriodStartDate);
			result.put("firstRegularPeriodEndDate", strFirstRegularPeriodEndDate);
			
		} catch (DateTimeParseException e) {
			e.printStackTrace();
		} catch (DateTimeException e) {
			e.printStackTrace();
		}
		
		LOGGER.info("listFrequency -> " + result.get("frequency").toString());
		LOGGER.info("strFirstRegularPeriodStartDate -> " + result.get("firstRegularPeriodStartDate"));
		LOGGER.info("strFirstRegularPeriodEndDate -> " + result.get("firstRegularPeriodEndDate"));
		LOGGER.info("=============================================");
		LOGGER.info("getFrequency End (" + strFrequencyType + ")");
		LOGGER.info("=============================================");
		
		return result;
	}

}
