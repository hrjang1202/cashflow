<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
body {
 	padding-top: 50px;
}
.content-template {
	padding: 20px 0px;
  	text-align: left;
}
.table>tbody>tr>td, 
.table>thead>tr>th {
    padding: 2px;
    line-height: 1.42857143;
    vertical-align: middle;
    border-top: 1px solid #ddd;
    font-size: 13px;
}
.tr-division {
	border-bottom: 3.7px double #ddd;
}
.td-content {
	height: 25px;
	width: 135px;
	font-size: 13px;
}
.td-content-number {
	height: 25px;
	width: 135px;
	font-size: 13px;
	text-align: right;
}
</style>
<script>

$(document).ready(function(){

	$("#btn_schedule").click(function(){
		
		console.log("btn_schedule click");
		
	});
	
});
</script>
</head>

<body>

	 <nav class="navbar navbar-inverse navbar-fixed-top">
	 
	 	<div class="container">
	 	
	    	<div class="navbar-header">
	        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		         	<span class="sr-only">Toggle navigation</span>
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
		         	<span class="icon-bar"></span>
	      		</button>
	       		<a class="navbar-brand" href="/treasury">Treasury</a>
	     	</div>
	     	
	     	<div id="navbar" class="collapse navbar-collapse">
	       		<ul class="nav navbar-nav">
	         		<li><a href="/treasury/common/">Common</a></li>
	         		<li class="active"><a href="/treasury/dealing/">Dealing</a></li>
	       		</ul>
	     	</div>
	     	
	  	</div>
	  	
	</nav>
	
	
	<div class="container">

		<div class="content-template">
		
			<form action="/treasury/dealing/swNew/scheduleGenerate" method="post">
				<table class="table table-hover">
					<thead>
				    	<tr>
				      		<th>Receive Leg<input class="td-content" type="hidden" value="2" name="listSwap[0].pay_receive"/></th>
				      		<th><input class="td-content" type="hidden" value="1" name="listSwap[0].leg_number"/></th>
				      		<th>Pay Leg<input class="td-content" type="hidden" value="1" name="listSwap[1].pay_receive"/></th>
				      		<th><input class="td-content" type="hidden" value="2" name="listSwap[1].leg_number"/></th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<!-- Common -->
				    	<tr>
				      		<td title="효력발생일">Effective Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[0].effective_date"/></td>
				      		<td title="효력발생일">Effective Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[1].effective_date"/></td>
				    	</tr>
				    	<tr>
				      		<td title="종료일">Termination Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[0].termination_date"/></td>
				      		<td title="종료일">Termination Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[1].termination_date"/></td>
				    	</tr>
				    	<tr>
				      		<td title="종료일 영업일 규칙">Termination Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" name="listSwap[0].termination_date_business_day_convention">
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
				      			</select>
				      		</td>
				      		<td title="종료일 영업일 규칙">Termination Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" name="listSwap[1].termination_date_business_day_convention">
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr class="tr-division">
				      		<td title="종료일 영업일 적용 도시">Termination Date Business Centers</td>
				      		<td>
				      			<select class="td-content" name="listSwap[0].termination_date_business_centers">
					      			<option value="KRSE">KRSE</option>
				      			</select>
				      		</td>
				      		<td title="종료일 영업일 적용 도시">Termination Date Business Centers</td>
				      		<td>
				      			<select class="td-content" name="listSwap[1].termination_date_business_centers">
					      			<option value="KRSE">KRSE</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<!-- Notional -->
				    	<tr>
				      		<td title="명목 통화코드/금액">Notional Currency/Amount</td>
				      		<td>
				      			<select class="td-content" style="width:60" name="listSwap[0].notional_currency">
					      			<option value="USD">USD</option>
					      			<option value="JPY">JPY</option>
					      			<option value="KRW">KRW</option>
				      			</select>
				      			<input class="td-content-number" type="number" min="0" name="listSwap[0].notional_amount">
				      		</td>
				      		<td title="명목 통화코드/금액">Notional Currency/Amount</td>
				      		<td>
				      			<select class="td-content" style="width:60" name="listSwap[1].notional_currency">
					      			<option value="USD">USD</option>
					      			<option value="JPY">JPY</option>
					      			<option value="KRW">KRW</option>
				      			</select>
				      			<input class="td-content-number" type="number" min="0" name="listSwap[1].notional_amount">
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="최초 원금교환 금액">Initial Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" name="listSwap[0].initial_principal_exchange_amount"></td>
				      		<td title="최초 원금교환 금액">Initial Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" name="listSwap[1].initial_principal_exchange_amount"></td>
				    	</tr>
				    	<tr class="tr-division">
				      		<td title="최종 원금교환 금액">Final Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" name="listSwap[0].final_principal_exchange_amount"></td>
				      		<td title="최종 원금교환 금액">Final Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" name="listSwap[1].final_principal_exchange_amount"></td>
				    	</tr>
				    	<!-- Calculation -->
				    	<tr>
				      		<td title="이자계산주기 승수/단위">Calculation Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[0].calculation_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[0].calculation_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="이자계산주기 승수/단위">Calculation Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[1].calculation_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[1].calculation_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자계산 규칙">Calculation Roll Convention</td>
				      		<td><input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[0].calculation_roll_convention"></td>
				      		<td title="이자계산 규칙">Calculation Roll Convention</td>
				      		<td><input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[1].calculation_roll_convention"></td>
				    	</tr>
				    	<tr>
				      		<td title="일수계산방식">Day Count Fraction</td>
				      		<td>
				      			<select class="td-content" name="listSwap[0].day_count_fraction">
					      			<option value="1">Actual/360</option>
				      			</select>
				      		</td>
				      		<td title="일수계산방식">Day Count Fraction</td>
				      		<td>
				      			<select class="td-content" name="listSwap[1].day_count_fraction">
					      			<option value="1">Actual/360</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="Stub 적용방식">Stub Period Type</td>
				      		<td>
				      			<select class="td-content" name="listSwap[0].stub_period_type">
					      			<option value="1">Long Initial</option>
					      			<option value="2">Long Final</option>
					      			<option value="3">Short Initial</option>
					      			<option value="4">Short Final</option>
				      			</select>
				      		</td>
				      		<td title="Stub 적용방식">Stub Period Type</td>
				      		<td>
				      			<select class="td-content" name="listSwap[1].stub_period_type">
					      			<option value="1">Long Initial</option>
					      			<option value="2">Long Final</option>
					      			<option value="3">Short Initial</option>
					      			<option value="4">Short Final</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<!-- 
				    	<tr>
				      		<td title="정기 이자계산기간 시작일">First Regular Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[0].first_regular_period_start_date"></td>
				      		<td title="정기 이자계산기간 시작일">First Regular Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[1].first_regular_period_start_date"></td>
				    	</tr>
				    	<tr>
				      		<td title="정기 이자계산기간 종료일">Last Regular Period End Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[0].last_regular_period_end_date"></td>
				      		<td title="정기 이자계산기간 종료일">Last Regular Period End Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[1].last_regular_period_end_date"></td>
				    	</tr>
				    	-->
				    	<tr class="tr-division">
				      		<td title="비정기 이자계산기간 시작일">First Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[0].first_period_start_date"></td>
				      		<td title="비정기 이자계산기간 시작일">First Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" name="listSwap[1].first_period_start_date"></td>
				    	</tr>
				    	<!-- Payment -->
				    	<tr>
				      		<td title="이자지급주기 승수/단위">Payment Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[0].payment_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[0].payment_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="이자지급주기 승수/단위">Payment Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[1].payment_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[1].payment_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자지급 기준일">Payment Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" name="listSwap[0].payment_relative_to">
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				      		<td title="이자지급 기준일">Payment Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" name="listSwap[1].payment_relative_to">
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr class="tr-division">
				      		<td title="이자지급일 Offset">Payment Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" name="listSwap[0].payment_dates_offset_days"></td>
				      		<td title="이자지급일 Offset">Payment Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" name="listSwap[1].payment_dates_offset_days"></td>
				    	</tr>
				    	<!-- Fixed Rate -->
				    	<tr class="tr-division">
				      		<td title="고정금리">Fixed Rate</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[0].fixed_rate"></td>
				      		<td title="고정금리">Fixed Rate</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[1].fixed_rate"></td>
				    	</tr>
				    	<!-- Floating Rate -->
				    	<tr>
				      		<td title="변동금리 인덱스 만기">Floating Rate Index Tenor</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[0].floating_rate_index_tenor_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[0].floating_rate_index_tenor_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      			<select class="td-content" style="width:70" name="listSwap[0].floating_rate_index_id">
					      			<option value="1">Libor</option>
					      			<option value="2">CD</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 인덱스 만기">Floating Rate Index Tenor</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[1].floating_rate_index_tenor_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[1].floating_rate_index_tenor_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      			<select class="td-content" style="width:70" name="listSwap[1].floating_rate_index_id">
					      			<option value="1">Libor</option>
					      			<option value="2">CD</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 초기값">Initial Floating Rate</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[0].initial_floating_rate"></td>
				      		<td title="변동금리 초기값">Initial Floating Rate</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[1].initial_floating_rate"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 레버리지 승수">Floating Rate Multiplier(Gearing)</td>
				      		<td><input class="td-content-number" type="number" min="0" value="1" name="listSwap[0].floating_rate_multiplier"></td>
				      		<td title="변동금리 레버리지 승수">Floating Rate Multiplier(Gearing)</td>
				      		<td><input class="td-content-number" type="number" min="0" value="1" name="listSwap[1].floating_rate_multiplier"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 스프레드">Floating Rate Spread</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[0].floating_rate_spread"></td>
				      		<td title="변동금리 스프레드">Floating Rate Spread</td>
				      		<td><input class="td-content-number" type="number" value="0.0" step="0.1" min="0" name="listSwap[1].floating_rate_spread"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 재조정 주기">Floating Rate Reset Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[0].fixing_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[0].fixing_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 재조정 주기">Floating Rate Reset Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" name="listSwap[1].fixing_frequency_multifier">
				      			<select class="td-content" style="width:70" name="listSwap[1].fixing_frequency_period">
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	</tr><tr>
				      		<td title="변동금리 재조정 기준일">Reset Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" name="listSwap[0].fixing_relative_to">
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 재조정 기준일">Reset Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" name="listSwap[1].fixing_relative_to">
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr class="tr-division">
				      		<td title="변동금리 결정일 Offset">Fixing Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" name="listSwap[0].fixing_dates_offset_days"></td>
				      		<td title="변동금리 결정일 Offset">Fixing Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" name="listSwap[1].fixing_dates_offset_days"></td>
				    	</tr>
				  	</tbody>
				</table>
				
				<button class="btn btn-primary" type="submit" id="btn_schedule">스케줄 생성</button>
			
			</form>
			
			<table class="table table-bordered" id="tbl_Schedule">
				<thead>
			    	<tr>
			    		<th style="text-align:center;">Leg</th>
			      		<th style="text-align:center;">Pay/Receive</th>
			      		<th style="text-align:center;">Schedule Type</th>
			      		<th style="text-align:center;">Schedule Date</th>
			      		<th style="text-align:center;" colspan="2">Schedule Amount</th>
			      		<th style="text-align:center;" colspan="2">Notional Amount</th>
			      		<th style="text-align:center;">Int Start Date</th>
			      		<th style="text-align:center;">Int End Date</th>
			      		<th style="text-align:center;">Int Days</th>
			      		<th style="text-align:center;">Int Rate</th>
			      		<th style="text-align:center;">Spread</th>
			      		<th style="text-align:center;">Total Int Rate</th>
			      		<th style="text-align:center;">Fixing Date</th>
			    	</tr>
			  	</thead>
			  	<tbody>
			  		<c:forEach items="${listSchedule}" var="list">
			    	<tr>
			    		<td>
				      		<c:if test="${list.leg_number == 1}">Receive Leg</c:if>
							<c:if test="${list.leg_number == 2}">Pay Leg</c:if>
				      	</td>
			      		<td>
				      		<c:if test="${list.pay_receive == 1}">지급</c:if>
							<c:if test="${list.pay_receive == 2}">수취</c:if>
				      	</td>
						<td>
							<c:if test="${list.schedule_type == 1}">원금</c:if>
							<c:if test="${list.schedule_type == 2}">이자</c:if>
							<c:if test="${list.schedule_type == 3}">수수료</c:if>
						</td>
						<td style="text-align:center;">${list.schedule_date}</td>
						<td style="text-align:center;">${list.schedule_currency}</td>
						<td style="text-align:right;">${list.schedule_amount}</td>
						<td style="text-align:center;">${list.notional_currency}</td>
						<td style="text-align:right;">${list.notional_amount}</td>
						<td style="text-align:center;">${list.calculation_start_date}</td>
						<td style="text-align:center;">${list.calculation_end_date}</td>
						<td style="text-align:right;">${list.calculation_days}</td>
						<td style="text-align:right;">${list.interest_rate}</td>
						<td style="text-align:right;">${list.interest_spread_rate}</td>
						<td style="text-align:right;">${list.interest_total_rate}</td>
						<td style="text-align:center;">${list.fixing_date}</td>
			      	</tr>
			      	</c:forEach>
				</tbody>
			</table>
				
		</div>
	
	</div>
	
</body>
</html>
