package com.treasury.domain;

import java.math.BigDecimal;

public class ScheduleGererateVO {
	
	private int leg_number = 0;
	private String pay_receive = "";
	
	private String schedule_type = "";
	private String schedule_date = "";
	private String schedule_currency = "";
	private BigDecimal schedule_amount = BigDecimal.ZERO;
	
	/* 이자스케줄 Common */
	private String effective_date = "";
	private String termination_date = "";	
	
	/* 이자스케줄 Notional */
	private String notional_currency = "";
	private BigDecimal notional_amount = BigDecimal.ZERO;
	private String notional_amount_change_type = "";
	private BigDecimal notional_amount_change_amount = BigDecimal.ZERO;
	
	/* 이자스케줄 Calculation */
	private int calculation_frequency_multifier = 0;
	private String calculation_frequency_period = "";
	private String calculation_roll_convention = "";
	private String calculation_adjust_yn = "";
	private String day_count_fraction = "";
	private String stub_period_type = "";
	private String first_regular_period_start_date = "";
	private String last_regular_period_end_date = "";
	private String first_period_start_date = "";
	
	/* 이자스케줄 Payment */
	private int payment_frequency_multifier = 0;
	private String payment_frequency_period = "";
	private String payment_relative_to = "";
	private int payment_dates_offset_days = 0;
	
	/* 이자스케줄 Fixed Rate */
	private BigDecimal fixed_rate = BigDecimal.ZERO;
	
	/* 이자스케줄 Floating Rate */
	private BigDecimal initial_floating_rate = BigDecimal.ZERO;	
	private BigDecimal floating_rate_spread = BigDecimal.ZERO;
	private int floating_rate_multiplier = 0;
	private int fixing_frequency_multifier = 0;
	private String fixing_frequency_period = "";
	private String fixing_relative_to = "";
	private int fixing_dates_offset_days = 0;
	
	private String business_day_convention = "";
	private String business_centers = "";
	

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

	public String getEffective_date() {
		return effective_date;
	}

	public void setEffective_date(String effective_date) {
		if (effective_date != null) this.effective_date = effective_date;
	}

	public String getTermination_date() {
		return termination_date;
	}

	public void setTermination_date(String termination_date) {
		if (termination_date != null) this.termination_date = termination_date;
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
	
	public String getNotional_amount_change_type() {
		return notional_amount_change_type;
	}

	public void setNotional_amount_change_type(String notional_amount_change_type) {
		if (notional_amount_change_type != null) this.notional_amount_change_type = notional_amount_change_type;
	}

	public BigDecimal getNotional_amount_change_amount() {
		return notional_amount_change_amount;
	}

	public void setNotional_amount_change_amount(BigDecimal notional_amount_change_amount) {
		if (notional_amount_change_amount != null) this.notional_amount_change_amount = notional_amount_change_amount;
	}

	public int getCalculation_frequency_multifier() {
		return calculation_frequency_multifier;
	}

	public void setCalculation_frequency_multifier(Integer calculation_frequency_multifier) {
		if (calculation_frequency_multifier != null) this.calculation_frequency_multifier = calculation_frequency_multifier;
	}

	public String getCalculation_frequency_period() {
		return calculation_frequency_period;
	}

	public void setCalculation_frequency_period(String calculation_frequency_period) {
		if (calculation_frequency_period != null) this.calculation_frequency_period = calculation_frequency_period;
	}

	public String getCalculation_roll_convention() {
		return calculation_roll_convention;
	}

	public void setCalculation_roll_convention(String calculation_roll_convention) {
		if (calculation_roll_convention != null) this.calculation_roll_convention = calculation_roll_convention;
	}

	public String getCalculation_adjust_yn() {
		return calculation_adjust_yn;
	}

	public void setCalculation_adjust_yn(String calculation_adjust_yn) {
		if (calculation_adjust_yn != null) this.calculation_adjust_yn = calculation_adjust_yn;
	}

	public String getDay_count_fraction() {
		return day_count_fraction;
	}

	public void setDay_count_fraction(String day_count_fraction) {
		if (day_count_fraction != null) this.day_count_fraction = day_count_fraction;
	}

	public String getStub_period_type() {
		return stub_period_type;
	}

	public void setStub_period_type(String stub_period_type) {
		if (stub_period_type != null) this.stub_period_type = stub_period_type;
	}

	public String getFirst_regular_period_start_date() {
		return first_regular_period_start_date;
	}

	public void setFirst_regular_period_start_date(String first_regular_period_start_date) {
		if (first_regular_period_start_date != null) this.first_regular_period_start_date = first_regular_period_start_date;
	}

	public String getLast_regular_period_end_date() {
		return last_regular_period_end_date;
	}

	public void setLast_regular_period_end_date(String last_regular_period_end_date) {
		if (last_regular_period_end_date != null) this.last_regular_period_end_date = last_regular_period_end_date;
	}

	public String getFirst_period_start_date() {
		return first_period_start_date;
	}

	public void setFirst_period_start_date(String first_period_start_date) {
		if (first_period_start_date != null) this.first_period_start_date = first_period_start_date;
	}

	public int getPayment_frequency_multifier() {
		return payment_frequency_multifier;
	}

	public void setPayment_frequency_multifier(Integer payment_frequency_multifier) {
		if (payment_frequency_multifier != null) this.payment_frequency_multifier = payment_frequency_multifier;
	}

	public String getPayment_frequency_period() {
		return payment_frequency_period;
	}

	public void setPayment_frequency_period(String payment_frequency_period) {
		if (payment_frequency_period != null) this.payment_frequency_period = payment_frequency_period;
	}

	public String getPayment_relative_to() {
		return payment_relative_to;
	}

	public void setPayment_relative_to(String payment_relative_to) {
		if (payment_relative_to != null) this.payment_relative_to = payment_relative_to;
	}

	public int getPayment_dates_offset_days() {
		return payment_dates_offset_days;
	}

	public void setPayment_dates_offset_days(Integer payment_dates_offset_days) {
		if (payment_dates_offset_days != null) this.payment_dates_offset_days = payment_dates_offset_days;
	}

	public BigDecimal getFixed_rate() {
		return fixed_rate;
	}

	public void setFixed_rate(BigDecimal fixed_rate) {
		if (fixed_rate != null) this.fixed_rate = fixed_rate;
	}

	public BigDecimal getInitial_floating_rate() {
		return initial_floating_rate;
	}

	public void setInitial_floating_rate(BigDecimal initial_floating_rate) {
		if (initial_floating_rate != null) this.initial_floating_rate = initial_floating_rate;
	}

	public BigDecimal getFloating_rate_spread() {
		return floating_rate_spread;
	}

	public void setFloating_rate_spread(BigDecimal floating_rate_spread) {
		if (floating_rate_spread != null) this.floating_rate_spread = floating_rate_spread;
	}
	
	public int getFloating_rate_multiplier() {
		return floating_rate_multiplier;
	}

	public void setFloating_rate_multiplier(Integer floating_rate_multiplier) {
		if (floating_rate_multiplier != null) this.floating_rate_multiplier = floating_rate_multiplier;
	}

	public int getFixing_frequency_multifier() {
		return fixing_frequency_multifier;
	}

	public void setFixing_frequency_multifier(Integer fixing_frequency_multifier) {
		if (fixing_frequency_multifier != null) this.fixing_frequency_multifier = fixing_frequency_multifier;
	}

	public String getFixing_frequency_period() {
		return fixing_frequency_period;
	}

	public void setFixing_frequency_period(String fixing_frequency_period) {
		if (fixing_frequency_period != null) this.fixing_frequency_period = fixing_frequency_period;
	}

	public String getFixing_relative_to() {
		return fixing_relative_to;
	}

	public void setFixing_relative_to(String fixing_relative_to) {
		if (fixing_relative_to != null) this.fixing_relative_to = fixing_relative_to;
	}

	public int getFixing_dates_offset_days() {
		return fixing_dates_offset_days;
	}

	public void setFixing_dates_offset_days(Integer fixing_dates_offset_days) {
		if (fixing_dates_offset_days != null) this.fixing_dates_offset_days = fixing_dates_offset_days;
	}

	public String getBusiness_day_convention() {
		return business_day_convention;
	}

	public void setBusiness_day_convention(String business_day_convention) {
		if (business_day_convention != null) this.business_day_convention = business_day_convention;
	}

	public String getBusiness_centers() {
		return business_centers;
	}

	public void setBusiness_centers(String business_centers) {
		if (business_centers != null) this.business_centers = business_centers;
	}
	
	public ScheduleGererateVO() {
		this.leg_number = leg_number;
		this.pay_receive = pay_receive;
		this.schedule_type = schedule_type;
		this.schedule_date = schedule_date;
		this.schedule_currency = schedule_currency;
		this.schedule_amount = schedule_amount;
		this.effective_date = effective_date;
		this.termination_date = termination_date;
		this.notional_currency = notional_currency;
		this.notional_amount = notional_amount;
		this.notional_amount_change_type = notional_amount_change_type;
		this.notional_amount_change_amount = notional_amount_change_amount;
		this.calculation_frequency_multifier = calculation_frequency_multifier;
		this.calculation_frequency_period = calculation_frequency_period;
		this.calculation_roll_convention = calculation_roll_convention;
		this.calculation_adjust_yn = calculation_adjust_yn;
		this.day_count_fraction = day_count_fraction;
		this.stub_period_type = stub_period_type;
		this.first_regular_period_start_date = first_regular_period_start_date;
		this.last_regular_period_end_date = last_regular_period_end_date;
		this.first_period_start_date = first_period_start_date;
		this.payment_frequency_multifier = payment_frequency_multifier;
		this.payment_frequency_period = payment_frequency_period;
		this.payment_relative_to = payment_relative_to;
		this.payment_dates_offset_days = payment_dates_offset_days;
		this.fixed_rate = fixed_rate;
		this.initial_floating_rate = initial_floating_rate;
		this.floating_rate_spread = floating_rate_spread;
		this.floating_rate_multiplier = floating_rate_multiplier;
		this.fixing_frequency_multifier = fixing_frequency_multifier;
		this.fixing_frequency_period = fixing_frequency_period;
		this.fixing_relative_to = fixing_relative_to;
		this.fixing_dates_offset_days = fixing_dates_offset_days;
		this.business_day_convention = business_day_convention;
		this.business_centers = business_centers;
	}

	@Override
	public String toString() {
		return "ScheduleGererateVO [leg_number=" + leg_number + ", pay_receive=" + pay_receive + ", schedule_type="
				+ schedule_type + ", schedule_date=" + schedule_date + ", schedule_currency=" + schedule_currency
				+ ", schedule_amount=" + schedule_amount + ", effective_date=" + effective_date + ", termination_date="
				+ termination_date + ", notional_currency=" + notional_currency + ", notional_amount=" + notional_amount
				+ ", notional_amount_change_type=" + notional_amount_change_type + ", notional_amount_change_amount="
				+ notional_amount_change_amount + ", calculation_frequency_multifier=" + calculation_frequency_multifier
				+ ", calculation_frequency_period=" + calculation_frequency_period + ", calculation_roll_convention="
				+ calculation_roll_convention + ", calculation_adjust_yn=" + calculation_adjust_yn
				+ ", day_count_fraction=" + day_count_fraction + ", stub_period_type=" + stub_period_type
				+ ", first_regular_period_start_date=" + first_regular_period_start_date
				+ ", last_regular_period_end_date=" + last_regular_period_end_date + ", first_period_start_date="
				+ first_period_start_date + ", payment_frequency_multifier=" + payment_frequency_multifier
				+ ", payment_frequency_period=" + payment_frequency_period + ", payment_relative_to="
				+ payment_relative_to + ", payment_dates_offset_days=" + payment_dates_offset_days + ", fixed_rate="
				+ fixed_rate + ", initial_floating_rate=" + initial_floating_rate + ", floating_rate_spread="
				+ floating_rate_spread + ", floating_rate_multiplier=" + floating_rate_multiplier
				+ ", fixing_frequency_multifier=" + fixing_frequency_multifier + ", fixing_frequency_period="
				+ fixing_frequency_period + ", fixing_relative_to=" + fixing_relative_to + ", fixing_dates_offset_days="
				+ fixing_dates_offset_days + ", business_day_convention=" + business_day_convention
				+ ", business_centers=" + business_centers + "]";
	}

}
