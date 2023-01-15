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
    border-bottom: 1px solid #ddd;
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

$(document).ready(function() {
	
	$("#btn_schedule").click(function() {
		
		console.log("btn_schedule click");
		
		$("#form").on("submit", function(event) {
		    
			//Prevent the page from reloading
		    event.preventDefault();
			
		    var listSwap = new Array(); 
		    
		  	//Receive Leg 조립
		  	var swap = new Object();
		   
		    swap["leg_number"] = "1";
		  	swap["pay_receive"] = "2"; //2 = Receive
		  	swap["effective_date"] = $("#receive_effective_date").val();
		  	swap["termination_date"] = $("#receive_termination_date").val();
		  	swap["termination_date_business_day_convention"] = $("#receive_termination_date_business_day_convention").val();
		  	swap["termination_date_business_centers"] = $("#receive_termination_date_business_center1").val() + ";"
		  												+ $("#receive_termination_date_business_center2").val() + ";"
		  												+ $("#receive_termination_date_business_center3").val() + ";"
		  												+ $("#receive_termination_date_business_center4").val() + ";";
		  	swap["notional_currency"] = $("#receive_notional_currency").val();
		  	swap["notional_amount"] = $("#receive_notional_amount").val();
		  	swap["notional_amount_change_type"] = $("#receive_notional_amount_change_type").val();
		  	swap["notional_amount_change_amount"] = $("#receive_notional_amount_change_amount").val();
		  	swap["initial_principal_exchange_amount"] = $("#receive_initial_principal_exchange_amount").val();
		  	swap["final_principal_exchange_amount"] = $("#receive_final_principal_exchange_amount").val();
		  	swap["calculation_frequency_multifier"] = $("#receive_calculation_frequency_multifier").val();
		  	swap["calculation_frequency_period"] = $("#receive_calculation_frequency_period").val();
		  	swap["calculation_roll_convention"] = $("#receive_calculation_roll_convention").val();
		  	swap["calculation_date_business_day_convention"] = $("#receive_calculation_date_business_day_convention").val();
		  	swap["calculation_date_business_centers"] = $("#receive_calculation_date_business_center1").val() + ";"
														+ $("#receive_calculation_date_business_center2").val() + ";"
														+ $("#receive_calculation_date_business_center3").val() + ";"
														+ $("#receive_calculation_date_business_center4").val() + ";";
		  	swap["day_count_fraction"] = $("#receive_day_count_fraction").val();
		  	swap["stub_period_type"] = $("#receive_stub_period_type").val();
		  	swap["first_regular_period_start_date"] = $("#receive_first_regular_period_start_date").val();
		  	swap["last_regular_period_end_date"] = $("#receive_last_regular_period_end_date").val();
		  	swap["first_period_start_date"] = $("#receive_first_period_start_date").val();
		  	swap["payment_frequency_multifier"] = $("#receive_payment_frequency_multifier").val();
		  	swap["payment_frequency_period"] = $("#receive_payment_frequency_period").val();
		  	swap["payment_relative_to"] = $("#receive_payment_relative_to").val();
		  	swap["payment_dates_offset_days"] = $("#receive_payment_dates_offset_days").val();
		  	swap["payment_date_business_day_convention"] = $("#receive_payment_date_business_day_convention").val();
		  	swap["payment_date_business_centers"] = $("#receive_payment_date_business_center1").val() + ";"
		  												+ $("#receive_payment_date_business_center2").val() + ";"
		  												+ $("#receive_payment_date_business_center3").val() + ";"
		  												+ $("#receive_payment_date_business_center4").val() + ";";
		  	swap["fixed_rate"] = $("#receive_fixed_rate").val();
		  	swap["floating_rate_index_tenor_multifier"] = $("#receive_floating_rate_index_tenor_multifier").val();
		  	swap["floating_rate_index_tenor_period"] = $("#receive_floating_rate_index_tenor_period").val();
		  	swap["floating_rate_index_id"] = $("#receive_floating_rate_index_id").val();
		  	swap["floating_rate_multiplier"] = $("#receive_floating_rate_multiplier").val();
		  	swap["initial_floating_rate"] = $("#receive_initial_floating_rate").val();
		  	swap["floating_rate_spread"] = $("#receive_floating_rate_spread").val();
		  	swap["fixing_frequency_multifier"] = $("#receive_fixing_frequency_multifier").val();
		  	swap["fixing_frequency_period"] = $("#receive_fixing_frequency_period").val();
		  	swap["fixing_relative_to"] = $("#receive_fixing_relative_to").val();
		  	swap["fixing_dates_offset_days"] = $("#receive_fixing_dates_offset_days").val();
		  	swap["fixing_date_business_day_convention"] = $("#receive_fixing_date_business_day_convention").val();
		  	swap["fixing_date_business_centers"] = $("#receive_fixing_date_business_center1").val() + ";"
		  												+ $("#receive_fixing_date_business_center2").val() + ";"
		  												+ $("#receive_fixing_date_business_center3").val() + ";"
		  												+ $("#receive_fixing_date_business_center4").val() + ";";

		    listSwap.push(swap);

		    //Pay Leg 조립
		    var swap = new Object();

		    swap["leg_number"] = "2";
		    swap["pay_receive"] = "1"; //1 = Pay
		    swap["effective_date"] = $("#pay_effective_date").val();
		  	swap["termination_date"] = $("#pay_termination_date").val();
		  	swap["termination_date_business_day_convention"] = $("#pay_termination_date_business_day_convention").val();
		  	swap["termination_date_business_centers"] = $("#pay_termination_date_business_center1").val() + ";"
														+ $("#pay_termination_date_business_center2").val() + ";"
														+ $("#pay_termination_date_business_center3").val() + ";"
														+ $("#pay_termination_date_business_center4").val() + ";";
		  	swap["notional_currency"] = $("#pay_notional_currency").val();
		  	swap["notional_amount"] = $("#pay_notional_amount").val();
		  	swap["notional_amount_change_type"] = $("#pay_notional_amount_change_type").val();
		  	swap["notional_amount_change_amount"] = $("#pay_notional_amount_change_amount").val();
		  	swap["initial_principal_exchange_amount"] = $("#pay_initial_principal_exchange_amount").val();
		  	swap["final_principal_exchange_amount"] = $("#pay_final_principal_exchange_amount").val();
		  	swap["calculation_frequency_multifier"] = $("#pay_calculation_frequency_multifier").val();
		  	swap["calculation_frequency_period"] = $("#pay_calculation_frequency_period").val();
		  	swap["calculation_roll_convention"] = $("#pay_calculation_roll_convention").val();
		  	swap["calculation_date_business_day_convention"] = $("#pay_calculation_date_business_day_convention").val();
			swap["calculation_date_business_centers"] = $("#pay_calculation_date_business_center1").val() + ";"
														+ $("#pay_calculation_date_business_center2").val() + ";"
														+ $("#pay_calculation_date_business_center3").val() + ";"
														+ $("#pay_calculation_date_business_center4").val() + ";";
		  	swap["day_count_fraction"] = $("#pay_day_count_fraction").val();
		  	swap["stub_period_type"] = $("#pay_stub_period_type").val();
		  	swap["first_regular_period_start_date"] = $("#pay_first_regular_period_start_date").val();
		  	swap["last_regular_period_end_date"] = $("#pay_last_regular_period_end_date").val();
		  	swap["first_period_start_date"] = $("#pay_first_period_start_date").val();
		  	swap["payment_frequency_multifier"] = $("#pay_payment_frequency_multifier").val();
		  	swap["payment_frequency_period"] = $("#pay_payment_frequency_period").val();
		  	swap["payment_relative_to"] = $("#pay_payment_relative_to").val();
		  	swap["payment_dates_offset_days"] = $("#pay_payment_dates_offset_days").val();
		  	swap["payment_date_business_day_convention"] = $("#pay_payment_date_business_day_convention").val();
		  	swap["payment_date_business_centers"] = $("#pay_payment_date_business_center1").val() + ";"
													+ $("#pay_payment_date_business_center2").val() + ";"
													+ $("#pay_payment_date_business_center3").val() + ";"
													+ $("#pay_payment_date_business_center4").val() + ";";
		  	swap["fixed_rate"] = $("#pay_fixed_rate").val();
		  	swap["floating_rate_index_tenor_multifier"] = $("#pay_floating_rate_index_tenor_multifier").val();
		  	swap["floating_rate_index_tenor_period"] = $("#pay_floating_rate_index_tenor_period").val();
		  	swap["floating_rate_index_id"] = $("#pay_floating_rate_index_id").val();
		  	swap["floating_rate_multiplier"] = $("#pay_floating_rate_multiplier").val();
		  	swap["initial_floating_rate"] = $("#pay_initial_floating_rate").val();
		  	swap["floating_rate_spread"] = $("#pay_floating_rate_spread").val();
		  	swap["fixing_frequency_multifier"] = $("#pay_fixing_frequency_multifier").val();
		  	swap["fixing_frequency_period"] = $("#pay_fixing_frequency_period").val();
		  	swap["fixing_relative_to"] = $("#pay_fixing_relative_to").val();
		  	swap["fixing_dates_offset_days"] = $("#pay_fixing_dates_offset_days").val();
		  	swap["fixing_date_business_day_convention"] = $("#pay_fixing_date_business_day_convention").val();
		  	swap["fixing_date_business_centers"] = $("#pay_fixing_date_business_center1").val() + ";"
		  												+ $("#pay_fixing_date_business_center2").val() + ";"
		  												+ $("#pay_fixing_date_business_center3").val() + ";"
		  												+ $("#pay_fixing_date_business_center4").val() + ";";
			
			swap["fee_pay_receive"] = $("#fee_pay_receive").val();
		    swap["fee_currency"] = $("#fee_currency").val();
		    swap["fee_amount"] = $("#fee_amount").val();
		    swap["fee_settle_date"] = $("#fee_settle_date").val();

		    listSwap.push(swap);
		    
		    //요청 data 조립
		    var requestData = new Object();
		    
		    requestData["listSwap"] = listSwap;
		  
		    console.log(requestData);
			
		    $.ajax({
		    	
		    	contentType: "application/json",
		    	dataType: "json",
		    	data: JSON.stringify(requestData),
		    	url: "/treasury/dealing/swapNew/scheduleGenerate", 
                type: "POST",
                success: function (responseData) {
                	
                	console.log(responseData);
                	
                	$("#tbl_Schedule > tbody").empty();
                	
                	var str = '<tbody>';
                	
                    $.each(responseData , function(i) {
                    	
                   		var leg_number = "";
                         
						if ("1" == responseData[i].leg_number)
						{
							leg_number = "Receive Leg";
						} 
						else  if ("2" == responseData[i].leg_number)
						{
						 	leg_number = "Pay Leg";
						}
                        
 						var pay_receive = "";
                         
	                    if ("1" == responseData[i].pay_receive)
	                    {
	                    	pay_receive = "지급";
	                    } 
	                    else  if ("2" == responseData[i].pay_receive)
	                    {
	                    	pay_receive = "수취";
	                    }
	                   
						var schedule_type = "";
                         
                        if ("1" == responseData[i].schedule_type)
                        {
                        	schedule_type = "원금";
                        } 
                        else  if ("2" == responseData[i].schedule_type)
                        {
                        	schedule_type = "이자";
                        }
                        else  if ("3" == responseData[i].schedule_type)
                        {
                        	schedule_type = "수수료";
                        }
                        
                        str += '<tr>';
                        str += '<td>' + leg_number + '</td>';
                        str += '<td style="text-align:center;">' + pay_receive + '</td>';
                        str += '<td style="text-align:center;">' + schedule_type + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].schedule_date + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].schedule_currency + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].schedule_amount + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].notional_currency + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].notional_amount + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].calculation_start_date + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].calculation_end_date + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].calculation_days + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].interest_rate + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].interest_spread_rate + '</td>';
                        str += '<td style="text-align:right;">' + responseData[i].interest_total_rate + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].fixing_date + '</td>';
                        str += '<td style="text-align:center;">' + responseData[i].fixing_yn + '</td>';
                        str += '<tr/>';
                   });
                    
                   str += '<tbody/>';
                    
                   $("#tbl_Schedule").append(str);
                   
                }
		    
		    });
		    
		});
		
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
		
			<form id="form">
				
				<table class="table">
					<thead>
				    	<tr>
				      		<th>Upfront Fee</th>
				      	</tr>
				    </thead>
					<tbody>
						<tr>
				      		<td>
				      		Pay/Receive &nbsp;
			      			<select class="td-content" style="width:80" id="fee_pay_receive">
			      				<option value=""></option>
				      			<option value="1">Pay</option>
				      			<option value="2">Receive</option>
			      			</select>
			      			&nbsp; Currency/Amount &nbsp;
			      			<select class="td-content" style="width:60" id="fee_currency">
			      				<option value=""></option>
				      			<option value="USD">USD</option>
				      			<option value="JPY">JPY</option>
				      			<option value="KRW">KRW</option>
			      			</select>
				      		<input class="td-content-number" type="number" min="0" id="fee_amount">
				      		&nbsp; Settle Date &nbsp;
			      			<input class="td-content" type="date" max="9999-12-31" id="fee_settle_date"/>
				      		</td>
						</tr>
					</tbody>
				</table>
							
				<table class="table table-hover">
					<thead>
				    	<tr>
				      		<th>Receive Leg</th>
				      		<th></th>
				      		<th>Pay Leg</th>
				      		<th></th>
				    	</tr>
				  	</thead>
				  	<tbody>
				  		<!-- Common -->
				  		<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Common&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Common&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="효력발생일">Effective Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="receive_effective_date"/></td>
				      		<td title="효력발생일">Effective Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="pay_effective_date"/></td>
				    	</tr>
				    	<tr>
				      		<td title="종료일">Termination Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="receive_termination_date"/></td>
				      		<td title="종료일">Termination Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="pay_termination_date"/></td>
				    	</tr>
				    	<tr>
				      		<td title="종료일 영업일 규칙">Termination Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="receive_termination_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				      		<td title="종료일 영업일 규칙">Termination Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="pay_termination_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="종료일 영업일 적용 도시">Termination Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="receive_termination_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="receive_termination_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_termination_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_termination_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_termination_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				      		<td title="종료일 영업일 적용 도시">Termination Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="pay_termination_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="pay_termination_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_termination_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_termination_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_termination_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<!-- Notional -->
				    	<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Notional&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Notional&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="명목통화코드/금액">Notional Currency/Amount</td>
				      		<td>
				      			<select class="td-content" style="width:60" id="receive_notional_currency">
				      				<option value=""></option>
					      			<option value="USD">USD</option>
					      			<option value="JPY">JPY</option>
					      			<option value="KRW">KRW</option>
				      			</select>
				      			<input class="td-content-number" type="number" min="0" id="receive_notional_amount">
				      		</td>
				      		<td title="명목통화코드/금액">Notional Currency/Amount</td>
				      		<td>
				      			<select class="td-content" style="width:60" id="pay_notional_currency">
				      				<option value=""></option>
					      			<option value="USD">USD</option>
					      			<option value="JPY">JPY</option>
					      			<option value="KRW">KRW</option>
				      			</select>
				      			<input class="td-content-number" type="number" min="0" id="pay_notional_amount">
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="명목금액 변동 방식">Notional Amount Change Type</td>
				      		<td>
				      			<select class="td-content" id="receive_notional_amount_change_type">
				      				<option value=""></option>
					      			<option value="1">Constant</option>
					      			<option value="2">Accreting</option>
					      			<option value="3">Amortising</option>
				      			</select>
				      		</td>
				      		<td title="명목금액 변동 방식">Notional Amount Change Type</td>
				      		<td>
				      			<select class="td-content" id="pay_notional_amount_change_type">
				      				<option value=""></option>
					      			<option value="1">Constant</option>
					      			<option value="2">Accreting</option>
					      			<option value="3">Amortising</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<!-- 
				    	<tr>
				    		<td title="명목금액 변동 승수/단위">Notional Amount Change Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="receive_notional_amount_change_multifier">
				      			<select class="td-content" style="width:70" id="receive_notional_amount_change_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="명목금액 변동 승수/단위">Notional Amount Change Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="pay_notional_amount_change_multifier">
				      			<select class="td-content" style="width:70" id="pay_notional_amount_change_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	<tr/>
				    	-->
				    	<tr>
				      		<td title="명목금액 변동 금액">Notional Amount Change Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="receive_notional_amount_change_amount"></td>
				      		<td title="명목금액 변동 금액">Notional Amount Change Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="pay_notional_amount_change_amount"></td>
				    	</tr>
				    	<tr>
				      		<td title="초기 원금교환 금액">Initial Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="receive_initial_principal_exchange_amount"></td>
				      		<td title="초기 원금교환 금액">Initial Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="pay_initial_principal_exchange_amount"></td>
				    	</tr>
				    	<tr>
				      		<td title="만기 원금교환 금액">Final Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="receive_final_principal_exchange_amount"></td>
				      		<td title="만기 원금교환 금액">Final Principal Exchange Amount</td>
				      		<td><input class="td-content-number" type="number" min="0" id="pay_final_principal_exchange_amount"></td>
				    	</tr>
				    	<!-- Calculation -->
				    	<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Calculation&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Calculation&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="이자계산주기 승수/단위">Calculation Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="receive_calculation_frequency_multifier">
				      			<select class="td-content" style="width:70" id="receive_calculation_frequency_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="이자계산주기 승수/단위">Calculation Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="pay_calculation_frequency_multifier">
				      			<select class="td-content" style="width:70" id="pay_calculation_frequency_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자계산 규칙">Calculation Roll Convention</td>
				      		<td><input class="td-content-number" type="number" style="width:60" min="0" id="receive_calculation_roll_convention"></td>
				      		<td title="이자계산 규칙">Calculation Roll Convention</td>
				      		<td><input class="td-content-number" type="number" style="width:60" min="0" id="pay_calculation_roll_convention"></td>
				    	</tr>
				    	<tr>
				      		<td title="이자계산 영업일 규칙">Calculation Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="receive_calculation_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				      		<td title="이자계산 영업일 규칙">Calculation Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="pay_calculation_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자계산 영업일 적용 도시">Calculation Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="receive_calculation_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="receive_calculation_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_calculation_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_calculation_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_calculation_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				      		<td title="이자계산 영업일 적용 도시">Calculation Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="pay_calculation_date_business_centers"/>
				      			<select class="td-content" style="width:65px;" id="pay_calculation_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px;" id="pay_calculation_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px;" id="pay_calculation_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px;" id="pay_calculation_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="일수계산방식">Day Count Fraction</td>
				      		<td>
				      			<select class="td-content" id="receive_day_count_fraction">
				      				<option value=""></option>
					      			<option value="1">Actual/360</option>
				      			</select>
				      		</td>
				      		<td title="일수계산방식">Day Count Fraction</td>
				      		<td>
				      			<select class="td-content" id="pay_day_count_fraction">
				      				<option value=""></option>
					      			<option value="1">Actual/360</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="Stub 기간 적용방식">Stub Period Type</td>
				      		<td>
				      			<select class="td-content" id="receive_stub_period_type">
				      				<option value=""></option>
					      			<option value="1">Long Initial</option>
					      			<option value="2">Long Final</option>
					      			<option value="3">Short Initial</option>
					      			<option value="4">Short Final</option>
				      			</select>
				      		</td>
				      		<td title="Stub 기간 적용방식">Stub Period Type</td>
				      		<td>
				      			<select class="td-content" id="pay_stub_period_type">
				      				<option value=""></option>
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
				      		<td><input class="td-content" type="date" max="9999-12-31" id="receive_first_regular_period_start_date"></td>
				      		<td title="정기 이자계산기간 시작일">First Regular Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="pay_first_regular_period_start_date"></td>
				    	</tr>
				    	<tr>
				      		<td title="정기 이자계산기간 종료일">Last Regular Period End Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="receive_last_regular_period_end_date"></td>
				      		<td title="정기 이자계산기간 종료일">Last Regular Period End Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="pay_last_regular_period_end_date"></td>
				    	</tr>
				    	<tr>
				      		<td title="비정기 이자계산기간 시작일">First Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="receive_first_period_start_date"></td>
				      		<td title="비정기 이자계산기간 시작일">First Period Start Date</td>
				      		<td><input class="td-content" type="date" max="9999-12-31" id="pay_first_period_start_date"></td>
				    	</tr>
				    	-->
				    	<!-- Payment -->
				    	<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Payment&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Payment&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="이자지급주기 승수/단위">Payment Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="receive_payment_frequency_multifier">
				      			<select class="td-content" style="width:70" id="receive_payment_frequency_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="이자지급주기 승수/단위">Payment Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="pay_payment_frequency_multifier">
				      			<select class="td-content" style="width:70" id="pay_payment_frequency_period">
				      				<option value=""></option>
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
				      			<select class="td-content" style="width:160" id="receive_payment_relative_to">
				      				<option value=""></option>
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				      		<td title="이자지급 기준일">Payment Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" id="pay_payment_relative_to">
				      				<option value=""></option>
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자지급일 Offset">Payment Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" id="receive_payment_dates_offset_days"></td>
				      		<td title="이자지급일 Offset">Payment Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" id="pay_payment_dates_offset_days"></td>
				    	</tr>
				    	<tr>
				      		<td title="이자지급일 영업일 규칙">Payment Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="receive_payment_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				      		<td title="이자지급일 영업일 규칙">Payment Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="pay_payment_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="이자지급일 영업일 적용 도시">Payment Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="receive_payment_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="receive_payment_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_payment_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_payment_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_payment_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				      		<td title="이자지급일 영업일 적용 도시">Payment Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="pay_payment_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="pay_payment_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_payment_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_payment_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_payment_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<!-- Fixed Rate -->
				    	<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Fixed Rate&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Fixed Rate&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="고정금리">Fixed Rate</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="receive_fixed_rate"></td>
				      		<td title="고정금리">Fixed Rate</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="pay_fixed_rate"></td>
				    	</tr>
				    	<!-- Floating Rate -->
				    	<tr>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Floating Rate&nbsp;&nbsp;&gt;</td>
				  			<td colspan="2" style="background-color:#DDEBF7">&lt;&nbsp;Floating Rate&nbsp;&gt;</td>
				  		</tr>
				    	<tr>
				      		<td title="변동금리 인덱스 만기">Floating Rate Index Tenor</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="receive_floating_rate_index_tenor_multifier">
				      			<select class="td-content" style="width:70" id="receive_floating_rate_index_tenor_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      			<select class="td-content" style="width:70" id="receive_floating_rate_index_id">
				      				<option value=""></option>
					      			<option value="1">Libor</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 인덱스 만기">Floating Rate Index Tenor</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="pay_floating_rate_index_tenor_multifier">
				      			<select class="td-content" style="width:70" id="pay_floating_rate_index_tenor_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      			<select class="td-content" style="width:70" id="pay_floating_rate_index_id">
				      				<option value=""></option>
					      			<option value="1">Libor</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 레버리지 승수">Floating Rate Multiplier(Gearing)</td>
				      		<td><input class="td-content-number" type="number" min="0" value="1" id="receive_floating_rate_multiplier"></td>
				      		<td title="변동금리 레버리지 승수">Floating Rate Multiplier(Gearing)</td>
				      		<td><input class="td-content-number" type="number" min="0" value="1" id="pay_floating_rate_multiplier"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 스프레드">Floating Rate Spread</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="receive_floating_rate_spread"></td>
				      		<td title="변동금리 스프레드">Floating Rate Spread</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="pay_floating_rate_spread"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 재조정 주기">Floating Rate Reset Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="receive_fixing_frequency_multifier">
				      			<select class="td-content" style="width:70" id="receive_fixing_frequency_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 재조정 주기">Floating Rate Reset Frequency</td>
				      		<td>
				      			<input class="td-content-number" type="number" style="width:60" min="0" id="pay_fixing_frequency_multifier">
				      			<select class="td-content" style="width:70" id="pay_fixing_frequency_period">
				      				<option value=""></option>
					      			<option value="D">Day</option>
					      			<option value="W">Week</option>
					      			<option value="M">Month</option>
					      			<option value="Y">Year</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 재조정 기준일">Fixing Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" id="receive_fixing_relative_to">
				      				<option value=""></option>
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 재조정 기준일">Fixing Relative To</td>
				      		<td>
				      			<select class="td-content" style="width:160" id="pay_fixing_relative_to">
				      				<option value=""></option>
					      			<option value="1">Calculation End Date</option>
					      			<option value="2">Calculation Start Date</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 결정일 Offset">Fixing Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" id="receive_fixing_dates_offset_days"></td>
				      		<td title="변동금리 결정일 Offset">Fixing Dates Offset Days</td>
				      		<td><input class="td-content-number" type="number" style="width:60" id="pay_fixing_dates_offset_days"></td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 결정일  영업일 규칙">Fixing Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="receive_fixing_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 결정일  영업일 규칙">Fixing Date Business Day Convention</td>
				      		<td>
				      			<select class="td-content" id="pay_fixing_date_business_day_convention">
				      				<option value=""></option>
					      			<option value="1">FOLLOWING</option>
					      			<option value="2">MODFOLLOWING</option>
					      			<option value="3">PRECEDING</option>
					      			<option value="4">MODPRECEDING</option>
					      			<option value="9">NONE</option>
				      			</select>
				      		</td>
				    	</tr>
				    	<tr>
				      		<td title="변동금리 결정일  영업일 적용 도시">Fixing Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="receive_fixing_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="receive_fixing_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_fixing_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_fixing_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="receive_fixing_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				      		<td title="변동금리 결정일  영업일 적용 도시">Fixing Date Business Centers</td>
				      		<td>
				      			<input type="hidden" id="pay_fixing_date_business_centers"/>
				      			<select class="td-content" style="width:65px" id="pay_fixing_date_business_center1">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_fixing_date_business_center2">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_fixing_date_business_center3">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      			<select class="td-content" style="width:65px" id="pay_fixing_date_business_center4">
				      				<option value=""></option>
					      			<option value="USNY">USNY</option>
					      			<option value="KRSE">KRSE</option>
					      			<option value="GBLO">GBLO</option>
					      			<option value="JPTO">JPTO</option>
				      			</select>
				      		</td>
				      		<tr>
				      		<td title="변동금리 초기값">Initial Floating Rate</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="receive_initial_floating_rate"></td>
				      		<td title="변동금리 초기값">Initial Floating Rate</td>
				      		<td><input class="td-content-number" type="number" step="0.1" min="0" id="pay_initial_floating_rate"></td>
				    	</tr>
				  	</tbody>
				</table>			
				<button class="btn btn-primary" type="submit" id="btn_schedule">스케줄 생성</button>
			</form>
			
			<!-- 스케줄 -->
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
			      		<th style="text-align:center;">Base Rate</th>
			      		<th style="text-align:center;">Spread</th>
			      		<th style="text-align:center;">Total Rate</th>
			      		<th style="text-align:center;">Fixing Date</th>
			      		<th style="text-align:center;">Fixing YN</th>
			    	</tr>
			  	</thead>
			</table>
				
		</div>
	
	</div>
	
</body>
</html>
