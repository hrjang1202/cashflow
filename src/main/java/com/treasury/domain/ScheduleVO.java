package com.treasury.domain;

import java.math.BigDecimal;
import java.util.List;

public class ScheduleVO {
	
	private int leg_number = 0;
	private String pay_receive = "";
	
	private String schedule_type = "";
	private String schedule_date = "";
	private String schedule_currency = "";
	private BigDecimal schedule_amount = BigDecimal.ZERO;
	
	private String notional_currency = "";
	private BigDecimal notional_amount = BigDecimal.ZERO;
	private String calculation_start_date = "";
	private String calculation_end_date = "";
	private String calculation_days = "";
	
	private BigDecimal interest_rate = BigDecimal.ZERO;
	private BigDecimal interest_spread_rate = BigDecimal.ZERO;
	private BigDecimal interest_total_rate = BigDecimal.ZERO;
	
	private String fixing_date = "";
	private String fixing_yn = "";
	
	private String settle_date = "";
	private String settle_yn = "";
	private int settle_transaction_number = 0;


	public int getLeg_number() {
		return leg_number;
	}

	public void setLeg_number(Integer leg_number) {
		if (leg_number != null) this.leg_number = leg_number;
	}

	public String getPay_receive() {
		return pay_receive;
	}

	public void setPay_receive(String pay_receive) {
		if (pay_receive != null) this.pay_receive = pay_receive;
	}

	public String getSchedule_type() {
		return schedule_type;
	}

	public void setSchedule_type(String schedule_type) {
		if (schedule_type != null) this.schedule_type = schedule_type;
	}

	public String getSchedule_date() {
		return schedule_date;
	}

	public void setSchedule_date(String schedule_date) {
		if (schedule_date != null) this.schedule_date = schedule_date;
	}

	public String getSchedule_currency() {
		return schedule_currency;
	}

	public void setSchedule_currency(String schedule_currency) {
		if (schedule_currency != null) this.schedule_currency = schedule_currency;
	}

	public BigDecimal getSchedule_amount() {
		return schedule_amount;
	}

	public void setSchedule_amount(BigDecimal schedule_amount) {
		if (schedule_amount != null) this.schedule_amount = schedule_amount;
	}

	public String getNotional_currency() {
		return notional_currency;
	}

	public void setNotional_currency(String notional_currency) {
		if (notional_currency != null) this.notional_currency = notional_currency;
	}

	public BigDecimal getNotional_amount() {
		return notional_amount;
	}

	public void setNotional_amount(BigDecimal notional_amount) {
		if (notional_amount != null) this.notional_amount = notional_amount;
	}

	public String getCalculation_start_date() {
		return calculation_start_date;
	}

	public void setCalculation_start_date(String calculation_start_date) {
		if (calculation_start_date != null) this.calculation_start_date = calculation_start_date;
	}

	public String getCalculation_end_date() {
		return calculation_end_date;
	}

	public void setCalculation_end_date(String calculation_end_date) {
		if (calculation_end_date != null) this.calculation_end_date = calculation_end_date;
	}

	public String getCalculation_days() {
		return calculation_days;
	}

	public void setCalculation_days(String calculation_days) {
		if (calculation_days != null) this.calculation_days = calculation_days;
	}

	public BigDecimal getInterest_rate() {
		return interest_rate;
	}

	public void setInterest_rate(BigDecimal interest_rate) {
		if (interest_rate != null) this.interest_rate = interest_rate;
	}

	public BigDecimal getInterest_spread_rate() {
		return interest_spread_rate;
	}

	public void setInterest_spread_rate(BigDecimal interest_spread_rate) {
		if (interest_spread_rate != null) this.interest_spread_rate = interest_spread_rate;
	}

	public BigDecimal getInterest_total_rate() {
		return interest_total_rate;
	}

	public void setInterest_total_rate(BigDecimal interest_total_rate) {
		if (interest_total_rate != null) this.interest_total_rate = interest_total_rate;
	}

	public String getFixing_date() {
		return fixing_date;
	}

	public void setFixing_date(String fixing_date) {
		if (fixing_date != null) this.fixing_date = fixing_date;
	}

	public String getFixing_yn() {
		return fixing_yn;
	}

	public void setFixing_yn(String fixing_yn) {
		if (fixing_yn != null) this.fixing_yn = fixing_yn;
	}

	public String getSettle_date() {
		return settle_date;
	}

	public void setSettle_date(String settle_date) {
		if (settle_date != null) this.settle_date = settle_date;
	}

	public String getSettle_yn() {
		return settle_yn;
	}

	public void setSettle_yn(String settle_yn) {
		if (settle_yn != null) this.settle_yn = settle_yn;
	}

	public int getSettle_transaction_number() {
		return settle_transaction_number;
	}

	public void setSettle_transaction_number(Integer settle_transaction_number) {
		if (settle_transaction_number != null) this.settle_transaction_number = settle_transaction_number;
	}


	public ScheduleVO() {
		this.leg_number = leg_number;
		this.pay_receive = pay_receive;
		this.schedule_type = schedule_type;
		this.schedule_date = schedule_date;
		this.schedule_currency = schedule_currency;
		this.schedule_amount = schedule_amount;
		this.notional_currency = notional_currency;
		this.notional_amount = notional_amount;
		this.calculation_start_date = calculation_start_date;
		this.calculation_end_date = calculation_end_date;
		this.calculation_days = calculation_days;
		this.interest_rate = interest_rate;
		this.interest_spread_rate = interest_spread_rate;
		this.interest_total_rate = interest_total_rate;
		this.fixing_date = fixing_date;
		this.fixing_yn = fixing_yn;
		this.settle_date = settle_date;
		this.settle_yn = settle_yn;
		this.settle_transaction_number = settle_transaction_number;
	}

	@Override
	public String toString() {
		return "ScheduleVO [leg_number=" + leg_number + ", pay_receive=" + pay_receive + ", schedule_type="
				+ schedule_type + ", schedule_date=" + schedule_date + ", schedule_currency=" + schedule_currency
				+ ", schedule_amount=" + schedule_amount + ", notional_currency=" + notional_currency
				+ ", notional_amount=" + notional_amount + ", calculation_start_date=" + calculation_start_date
				+ ", calculation_end_date=" + calculation_end_date + ", calculation_days=" + calculation_days
				+ ", interest_rate=" + interest_rate + ", interest_spread_rate=" + interest_spread_rate
				+ ", interest_total_rate=" + interest_total_rate + ", fixing_date=" + fixing_date + ", fixing_yn="
				+ fixing_yn + ", settle_date=" + settle_date + ", settle_yn=" + settle_yn
				+ ", settle_transaction_number=" + settle_transaction_number + "]";
	}
	
}
