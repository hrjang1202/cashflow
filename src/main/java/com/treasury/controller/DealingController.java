package com.treasury.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.treasury.domain.ScheduleGererateVO;
import com.treasury.domain.ScheduleVO;
import com.treasury.domain.SwapVO;
import com.treasury.service.OpenApiService;
import com.treasury.service.ScheduleService;

@Controller
@RequestMapping("/dealing/*")
public class DealingController {
	
	private static final Logger logger = LoggerFactory.getLogger(DealingController.class);
	
	@Inject
	private ScheduleService scheduleService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dealing() 
	{
		
		return "treasury/dealing";		
	}
	
	@RequestMapping(value = "/fxNew", method = RequestMethod.GET)
	public String fxNew() 
	{
		
		return "treasury/dealing/fxNew";	
	}
	
	@RequestMapping(value = "/swapNew", method = RequestMethod.GET)
	public String swapNew() 
	{
		
		return "treasury/dealing/swapNew";	
	}
	
	@RequestMapping(value = "/swapNew/scheduleGenerate", method = RequestMethod.POST)
	@ResponseBody
	public List<ScheduleVO> scheduleGenerate(@RequestBody SwapVO input, Model model) throws Exception
	{
		logger.info("=============================================");
		logger.info("scheduleGenerate Start");
		logger.info("=============================================");
		
		
		/**************************************************
		 * 1) 변수 선언
		 **************************************************/
		List<ScheduleGererateVO> listScheduleGenerate = new ArrayList<ScheduleGererateVO>();
		ScheduleGererateVO scheduleGenerate = null;
		
		
		/**************************************************
		 * 2) 스케줄 생성 변수 조립
		 **************************************************/
		for (int i=0; i<input.getListSwap().size(); i++)
		{	
			logger.info("input -> " + input.getListSwap().get(i));
			
			SwapVO swap = new SwapVO();
			swap = input.getListSwap().get(i);

			
			/*************************
			 * 수수료 - Upfront Fee
			 *************************/
			//스케줄 생성 변수 초기화
			scheduleGenerate = new ScheduleGererateVO();
			//스케줄 생성 변수 조립
			scheduleGenerate.setLeg_number(swap.getLeg_number());
			scheduleGenerate.setPay_receive(swap.getFee_pay_receive());
			scheduleGenerate.setSchedule_type("3"); //3 = 수수료
			scheduleGenerate.setSchedule_date(swap.getFee_settle_date()); 
			scheduleGenerate.setSchedule_currency(swap.getFee_currency()); 
			scheduleGenerate.setSchedule_amount(swap.getFee_amount()); 
			//스케줄 생성 변수 추가
			listScheduleGenerate.add(scheduleGenerate);
			
			
			/*************************
			 * 원금 - 초기 원금교환 금액
			 *************************/
			//스케줄 생성 변수 초기화
			scheduleGenerate = new ScheduleGererateVO();
			//스케줄 생성 변수 조립
			scheduleGenerate.setLeg_number(swap.getLeg_number());
			scheduleGenerate.setPay_receive(getObjection(swap.getPay_receive())); //통화스왑의 초기 원금교환 방향과 이자교환 방향은 반대방향
			scheduleGenerate.setSchedule_type("1"); //1 = 원금
			scheduleGenerate.setSchedule_date(swap.getEffective_date()); 
			scheduleGenerate.setSchedule_currency(swap.getNotional_currency()); 
			scheduleGenerate.setSchedule_amount(swap.getInitial_principal_exchange_amount()); //초기 원금교환 금액
			//스케줄 생성 변수 추가
			listScheduleGenerate.add(scheduleGenerate);
			
			
			/*************************
			 * 원금 - 최종 원금교환 금액
			 *************************/
			//스케줄 생성 변수 초기화
			 scheduleGenerate = new ScheduleGererateVO();
			//스케줄 생성 변수 조립
			scheduleGenerate.setLeg_number(swap.getLeg_number());
			scheduleGenerate.setPay_receive(swap.getPay_receive()); //통화스왑의 만기 원금교환 방향과 이자교환 방향은 동일방향
			scheduleGenerate.setSchedule_type("1"); //1 = 원금
			scheduleGenerate.setSchedule_date(swap.getTermination_date()); 
			scheduleGenerate.setSchedule_currency(swap.getNotional_currency()); 
			scheduleGenerate.setSchedule_amount(swap.getFinal_principal_exchange_amount()); //최종 원금교환 금액
			//스케줄 생성 변수 추가
			listScheduleGenerate.add(scheduleGenerate);
			
			
			/*************************
			 * 이자
			 *************************/
			//스케줄 생성 변수 초기화
			 scheduleGenerate = new ScheduleGererateVO();
			//스케줄 생성 변수 조립
			scheduleGenerate.setLeg_number(swap.getLeg_number());
			scheduleGenerate.setPay_receive(swap.getPay_receive());
			scheduleGenerate.setSchedule_type("2"); //2 = 이자
			scheduleGenerate.setEffective_date(swap.getEffective_date());
			scheduleGenerate.setTermination_date(swap.getTermination_date());
			scheduleGenerate.setNotional_currency(swap.getNotional_currency());
			scheduleGenerate.setNotional_amount(swap.getNotional_amount());
			scheduleGenerate.setNotional_amount_change_type(swap.getNotional_amount_change_type());
			scheduleGenerate.setNotional_amount_change_amount(swap.getNotional_amount_change_amount());
			scheduleGenerate.setCalculation_frequency_multifier(swap.getCalculation_frequency_multifier());
			scheduleGenerate.setCalculation_frequency_period(swap.getCalculation_frequency_period());
			scheduleGenerate.setCalculation_roll_convention(swap.getCalculation_roll_convention());
			scheduleGenerate.setDay_count_fraction(swap.getDay_count_fraction());
			scheduleGenerate.setStub_period_type(swap.getStub_period_type());
			scheduleGenerate.setPayment_frequency_multifier(swap.getPayment_frequency_multifier());
			scheduleGenerate.setPayment_frequency_period(swap.getPayment_frequency_period());
			scheduleGenerate.setPayment_relative_to(swap.getPayment_relative_to());
			scheduleGenerate.setPayment_dates_offset_days(swap.getPayment_dates_offset_days());
			scheduleGenerate.setFixed_rate(swap.getFixed_rate());
			scheduleGenerate.setInitial_floating_rate(swap.getInitial_floating_rate());
			scheduleGenerate.setFloating_rate_spread(swap.getFloating_rate_spread());
			scheduleGenerate.setFloating_rate_multiplier(swap.getFloating_rate_multiplier());
			scheduleGenerate.setFixing_frequency_multifier(swap.getFixing_frequency_multifier());
			scheduleGenerate.setFixing_frequency_period(swap.getFixing_frequency_period());
			scheduleGenerate.setFixing_relative_to(swap.getFixing_relative_to());
			scheduleGenerate.setFixing_dates_offset_days(swap.getFixing_dates_offset_days());
			//스케줄 생성 변수 추가
			listScheduleGenerate.add(scheduleGenerate);
		}
		
		
		/**************************************************
		 * 3) 스케줄 생성
		 **************************************************/
		List<ScheduleVO> listSchedule = scheduleService.getScheduleGenerate(listScheduleGenerate);
		
		
		/**************************************************
		 * 4) 결과값 조립
		 **************************************************/
		//model.addAttribute("listSchedule", listSchedule);
		
		
		logger.info("=============================================");
		logger.info("scheduleGenerate End");
		logger.info("=============================================");
		logger.info("listSchedule -> " + listSchedule.toString());
		
		return listSchedule;	
	}
	
	@RequestMapping(value = "/bondBaseInfo", method = RequestMethod.GET)
	public String bondBaseInfo() 
	{
		
		return "treasury/dealing/bondBaseInfo";	
	}
	
	@RequestMapping(value = "/bondBaseInfo/search", method = RequestMethod.POST)
	@ResponseBody
	public String searchbondBaseInfo(@RequestBody SwapVO input, Model model) throws Exception
	{
		//서비스 키 decode
		String serviceKey = URLDecoder.decode("4U5oKuFgth0OrJ%2FwghjUgYeNp%2F5jXdnzA4Uw9E%2BHzVOY%2FZavKI0SOive4tJOvzMZJlSUdLz%2FeR6cPa2RWo2ONw%3D%3D");
		
		//요청주소 
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1160100/service/GetBondIssuInfoService/getBondBasiInfo");
		
		//서비스 키
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=" + URLEncoder.encode(serviceKey, "UTF-8")); 
		//한 페이지 결과 수
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
	    //페이지 번호
	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); 
	    //결과형식
	    urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	    //기준일자
	    urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode("20200409", "UTF-8"));
	    //법인등록번호
	    urlBuilder.append("&" + URLEncoder.encode("crno","UTF-8") + "=" + URLEncoder.encode("0000000000000", "UTF-8"));
	    //채권발행인명
	    urlBuilder.append("&" + URLEncoder.encode("bondIsurNm","UTF-8") + "=" + URLEncoder.encode("골드만삭스인터내셔널", "UTF-8")); 
	    
	    URL url = new URL(urlBuilder.toString());
	    
	    logger.info("Url: " + urlBuilder.toString());
	    
	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Content-type", "application/json");
	    
	    logger.info("Response code: " + conn.getResponseCode());
	    
	    BufferedReader rd;
	    
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) 
        {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } 
        else 
        {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) 
        {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
        
        return sb.toString();	
	}

	private String getObjection(String strPayreceive) 
	{
		String strObjection = "";
		
		if ("1".equals(strPayreceive) == true) //1 = 지급
		{
			strObjection = "2"; //2 = 수취
		}
		else if ("2".equals(strPayreceive) == true) //2 = 수취
		{
			strObjection = "1"; //1 = 지급
		}
				
		return strObjection;
	}
	
}


