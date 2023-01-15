package com.treasury.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class SwapVO {
	
	private int leg_number = 0;
	private String pay_receive = "";
	
	/* Common */
	private String effective_date = "";
	private String termination_date = "";
	private String termination_date_business_day_convention = "";
	private String termination_date_business_centers = "";
	
	/* Notional */
	private String notional_currency = "";
	private BigDecimal notional_amount = BigDecimal.ZERO;
	private String notional_amount_change_type = "";
	private BigDecimal notional_amount_change_amount = BigDecimal.ZERO;
	private BigDecimal initial_principal_exchange_amount = BigDecimal.ZERO;
	private BigDecimal final_principal_exchange_amount = BigDecimal.ZERO;
	
	/* Calculation */
	private int calculation_frequency_multifier = 0;
	private String calculation_frequency_period = "";
	private String calculation_roll_convention = "";
	private String calculation_date_business_day_convention = "";
	private String calculation_date_business_centers = "";
	private String day_count_fraction = "";
	private String stub_period_type = "";
	private String first_regular_period_start_date = "";
	private String last_regular_period_end_date = "";
	private String first_period_start_date = "";
	
	/* Payment */
	private int payment_frequency_multifier = 0;
	private String payment_frequency_period = "";
	private String payment_relative_to = "";
	private int payment_dates_offset_days = 0;
	private String payment_date_business_day_convention = "";
	private String payment_date_business_centers = "";
	
	/* Fixed Rate */
	private BigDecimal fixed_rate = BigDecimal.ZERO;
	
	/* Floating Rate */
	private int floating_rate_index_tenor_multifier = 0;
	private String floating_rate_index_tenor_period = "";
	private String floating_rate_index_id = "";
	private int floating_rate_multiplier = 0;
	private BigDecimal initial_floating_rate = BigDecimal.ZERO;
	private BigDecimal floating_rate_spread = BigDecimal.ZERO;
	private int fixing_frequency_multifier = 0;
	private String fixing_frequency_period = "";
	private String fixing_relative_to = "";
	private int fixing_dates_offset_days = 0;
	private String fixing_date_business_day_convention = "";
	private String fixing_date_business_centers = "";
	
	/* Fee */
	private String fee_pay_receive = "";
	private String fee_currency = "";
	private BigDecimal fee_amount = BigDecimal.ZERO;
	private String fee_settle_date = "";
	
	private List<SwapVO> listSwap = new ArrayList<SwapVO>();

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
		if (pay_receive != null)  this.pay_receive = pay_receive;
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

	public String getTermination_date_business_day_convention() {
		return termination_date_business_day_convention;
	}

	public void setTermination_date_business_day_convention(String termination_date_business_day_convention) {
		if (termination_date_business_day_convention != null) this.termination_date_business_day_convention = termination_date_business_day_convention;
	}

	public String getTermination_date_business_centers() {
		return termination_date_business_centers;
	}

	public void setTermination_date_business_centers(String termination_date_business_centers) {
		if (termination_date_business_centers != null) this.termination_date_business_centers = termination_date_business_centers;
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

	public BigDecimal getInitial_principal_exchange_amount() {
		return initial_principal_exchange_amount;
	}

	public void setInitial_principal_exchange_amount(BigDecimal initial_principal_exchange_amount) {
		if (initial_principal_exchange_amount != null) this.initial_principal_exchange_amount = initial_principal_exchange_amount;
	}

	public BigDecimal getFinal_principal_exchange_amount() {
		return final_principal_exchange_amount;
	}

	public void setFinal_principal_exchange_amount(BigDecimal final_principal_exchange_amount) {
		if (final_principal_exchange_amount != null) this.final_principal_exchange_amount = final_principal_exchange_amount;
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
	
	public String getCalculation_date_business_day_convention() {
		return calculation_date_business_day_convention;
	}

	public void setCalculation_date_business_day_convention(String calculation_date_business_day_convention) {
		if (calculation_date_business_day_convention != null) this.calculation_date_business_day_convention = calculation_date_business_day_convention;
	}

	public String getCalculation_date_business_centers() {
		return calculation_date_business_centers;
	}

	public void setCalculation_date_business_centers(String calculation_date_business_centers) {
		if (calculation_date_business_centers != null) this.calculation_date_business_centers = calculation_date_business_centers;
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
	
	public String getPayment_date_business_day_convention() {
		return payment_date_business_day_convention;
	}

	public void setPayment_date_business_day_convention(String payment_date_business_day_convention) {
		if (payment_date_business_day_convention != null) this.payment_date_business_day_convention = payment_date_business_day_convention;
	}

	public String getPayment_date_business_centers() {
		return payment_date_business_centers;
	}

	public void setPayment_date_business_centers(String payment_date_business_centers) {
		if (payment_date_business_centers != null) this.payment_date_business_centers = payment_date_business_centers;
	}

	public BigDecimal getFixed_rate() {
		return fixed_rate;
	}

	public void setFixed_rate(BigDecimal fixed_rate) {
		if (fixed_rate != null) this.fixed_rate = fixed_rate;
	}

	public int getFloating_rate_index_tenor_multifier() {
		return floating_rate_index_tenor_multifier;
	}

	public void setFloating_rate_index_tenor_multifier(Integer floating_rate_index_tenor_multifier) {
		if (floating_rate_index_tenor_multifier != null) this.floating_rate_index_tenor_multifier = floating_rate_index_tenor_multifier;
	}

	public String getFloating_rate_index_tenor_period() {
		return floating_rate_index_tenor_period;
	}

	public void setFloating_rate_index_tenor_period(String floating_rate_index_tenor_period) {
		if (floating_rate_index_tenor_period != null) this.floating_rate_index_tenor_period = floating_rate_index_tenor_period;
	}

	public String getFloating_rate_index_id() {
		return floating_rate_index_id;
	}

	public void setFloating_rate_index_id(String floating_rate_index_id) {
		if (floating_rate_index_id != null) this.floating_rate_index_id = floating_rate_index_id;
	}

	public int getFloating_rate_multiplier() {
		return floating_rate_multiplier;
	}

	public void setFloating_rate_multiplier(Integer floating_rate_multiplier) {
		if (floating_rate_multiplier != null) this.floating_rate_multiplier = floating_rate_multiplier;
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
	
	public String getFixing_date_business_day_convention() {
		return fixing_date_business_day_convention;
	}

	public void setFixing_date_business_day_convention(String fixing_date_business_day_convention) {
		if (fixing_date_business_day_convention != null) this.fixing_date_business_day_convention = fixing_date_business_day_convention;
	}

	public String getFixing_date_business_centers() {
		return fixing_date_business_centers;
	}

	public void setFixing_date_business_centers(String fixing_date_business_centers) {
		if (fixing_date_business_centers != null) this.fixing_date_business_centers = fixing_date_business_centers;
	}
	
	public String getFee_pay_receive() {
		return fee_pay_receive;
	}

	public void setFee_pay_receive(String fee_pay_receive) {
		if (fee_pay_receive != null) this.fee_pay_receive = fee_pay_receive;
	}

	public String getFee_currency() {
		return fee_currency;
	}

	public void setFee_currency(String fee_currency) {
		if (fee_currency != null) this.fee_currency = fee_currency;
	}

	public BigDecimal getFee_amount() {
		return fee_amount;
	}

	public void setFee_amount(BigDecimal fee_amount) {
		if (fee_amount != null) this.fee_amount = fee_amount;
	}
	
	public String getFee_settle_date() {
		return fee_settle_date;
	}

	public void setFee_settle_date(String fee_settle_date) {
		if (fee_settle_date != null) this.fee_settle_date = fee_settle_date;
	}
	
	public List<SwapVO> getListSwap() {
		return listSwap;
	}

	public void setListSwap(List<SwapVO> listSwap) {
		if (listSwap != null) this.listSwap = listSwap;
	}

	public SwapVO() {
		this.leg_number = leg_number;
		this.pay_receive = pay_receive;
		this.effective_date = effective_date;
		this.termination_date = termination_date;
		this.termination_date_business_day_convention = termination_date_business_day_convention;
		this.termination_date_business_centers = termination_date_business_centers;
		this.notional_currency = notional_currency;
		this.notional_amount = notional_amount;
		this.notional_amount_change_type = notional_amount_change_type;
		this.notional_amount_change_amount = notional_amount_change_amount;
		this.initial_principal_exchange_amount = initial_principal_exchange_amount;
		this.final_principal_exchange_amount = final_principal_exchange_amount;
		this.calculation_frequency_multifier = calculation_frequency_multifier;
		this.calculation_frequency_period = calculation_frequency_period;
		this.calculation_roll_convention = calculation_roll_convention;
		this.calculation_date_business_day_convention = calculation_date_business_day_convention;
		this.calculation_date_business_centers = calculation_date_business_centers;
		this.day_count_fraction = day_count_fraction;
		this.stub_period_type = stub_period_type;
		this.first_regular_period_start_date = first_regular_period_start_date;
		this.last_regular_period_end_date = last_regular_period_end_date;
		this.first_period_start_date = first_period_start_date;
		this.payment_frequency_multifier = payment_frequency_multifier;
		this.payment_frequency_period = payment_frequency_period;
		this.payment_relative_to = payment_relative_to;
		this.payment_dates_offset_days = payment_dates_offset_days;
		this.payment_date_business_day_convention = payment_date_business_day_convention;
		this.payment_date_business_centers = payment_date_business_centers;
		this.fixed_rate = fixed_rate;
		this.floating_rate_index_tenor_multifier = floating_rate_index_tenor_multifier;
		this.floating_rate_index_tenor_period = floating_rate_index_tenor_period;
		this.floating_rate_index_id = floating_rate_index_id;
		this.floating_rate_multiplier = floating_rate_multiplier;
		this.initial_floating_rate = initial_floating_rate;
		this.floating_rate_spread = floating_rate_spread;
		this.fixing_frequency_multifier = fixing_frequency_multifier;
		this.fixing_frequency_period = fixing_frequency_period;
		this.fixing_relative_to = fixing_relative_to;
		this.fixing_dates_offset_days = fixing_dates_offset_days;
		this.fixing_date_business_day_convention = fixing_date_business_day_convention;
		this.fixing_date_business_centers = fixing_date_business_centers;
		this.fee_pay_receive = fee_pay_receive;
		this.fee_currency = fee_currency;
		this.fee_amount = fee_amount;
		this.fee_settle_date = fee_settle_date;
		this.listSwap = listSwap;
	}

	@Override
	public String toString() {
		return "SwapVO [leg_number=" + leg_number + ", pay_receive=" + pay_receive + ", effective_date="
				+ effective_date + ", termination_date=" + termination_date
				+ ", termination_date_business_day_convention=" + termination_date_business_day_convention
				+ ", termination_date_business_centers=" + termination_date_business_centers + ", notional_currency="
				+ notional_currency + ", notional_amount=" + notional_amount + ", notional_amount_change_type="
				+ notional_amount_change_type + ", notional_amount_change_amount=" + notional_amount_change_amount
				+ ", initial_principal_exchange_amount=" + initial_principal_exchange_amount
				+ ", final_principal_exchange_amount=" + final_principal_exchange_amount
				+ ", calculation_frequency_multifier=" + calculation_frequency_multifier
				+ ", calculation_frequency_period=" + calculation_frequency_period + ", calculation_roll_convention="
				+ calculation_roll_convention + ", calculation_date_business_day_convention="
				+ calculation_date_business_day_convention + ", calculation_date_business_centers="
				+ calculation_date_business_centers + ", day_count_fraction=" + day_count_fraction
				+ ", stub_period_type=" + stub_period_type + ", first_regular_period_start_date="
				+ first_regular_period_start_date + ", last_regular_period_end_date=" + last_regular_period_end_date
				+ ", first_period_start_date=" + first_period_start_date + ", payment_frequency_multifier="
				+ payment_frequency_multifier + ", payment_frequency_period=" + payment_frequency_period
				+ ", payment_relative_to=" + payment_relative_to + ", payment_dates_offset_days="
				+ payment_dates_offset_days + ", payment_date_business_day_convention="
				+ payment_date_business_day_convention + ", payment_date_business_centers="
				+ payment_date_business_centers + ", fixed_rate=" + fixed_rate
				+ ", floating_rate_index_tenor_multifier=" + floating_rate_index_tenor_multifier
				+ ", floating_rate_index_tenor_period=" + floating_rate_index_tenor_period + ", floating_rate_index_id="
				+ floating_rate_index_id + ", floating_rate_multiplier=" + floating_rate_multiplier
				+ ", initial_floating_rate=" + initial_floating_rate + ", floating_rate_spread=" + floating_rate_spread
				+ ", fixing_frequency_multifier=" + fixing_frequency_multifier + ", fixing_frequency_period="
				+ fixing_frequency_period + ", fixing_relative_to=" + fixing_relative_to + ", fixing_dates_offset_days="
				+ fixing_dates_offset_days + ", fixing_date_business_day_convention="
				+ fixing_date_business_day_convention + ", fixing_date_business_centers=" + fixing_date_business_centers
				+ ", fee_pay_receive=" + fee_pay_receive + ", fee_currency=" + fee_currency + ", fee_amount="
				+ fee_amount + ", fee_settle_date=" + fee_settle_date + ", listSwap=" + listSwap + "]";
	}
	
}
