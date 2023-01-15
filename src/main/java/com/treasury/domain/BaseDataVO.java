package com.treasury.domain;

public class BaseDataVO {
	
	/*
	CREATE TABLE BASE_DATA (
	      BASE_DATA_ID        VARCHAR2(20),
	      BASE_DATA_CODE1     VARCHAR2(20)      DEFAULT '0',
	      BASE_DATA_CODE2     VARCHAR2(20)      DEFAULT '0',
	      BASE_DATA_CODE3     VARCHAR2(20)      DEFAULT '0',
	      BASE_DATA_CODE4     VARCHAR2(20)      DEFAULT '0',
	      BASE_DATA_CODE5     VARCHAR2(20)      DEFAULT '0',
	      BASE_DATA_NAME      VARCHAR2(100),
	      BASE_DATA_CONTENT1  VARCHAR2(100),
	      BASE_DATA_CONTENT2  VARCHAR2(100),
	      BASE_DATA_CONTENT3  VARCHAR2(100),
	      BASE_DATA_CONTENT4  VARCHAR2(100),
	      BASE_DATA_CONTENT5  VARCHAR2(100),
	      BASE_DATA_CONTENT6  VARCHAR2(100),
	      BASE_DATA_CONTENT7  VARCHAR2(100),
	      BASE_DATA_CONTENT8  VARCHAR2(100),
	      BASE_DATA_CONTENT9  VARCHAR2(100),
	      CONSTRAINT PK_BASE_DATA PRIMARY KEY (BASE_DATA_ID, BASE_DATA_CODE1, BASE_DATA_CODE2, BASE_DATA_CODE3, BASE_DATA_CODE4, BASE_DATA_CODE5)
	);
	*/
	
	
	private String base_data_id;	
	private String base_data_code1;
	private String base_data_code2;
	private String base_data_code3;
	private String base_data_code4;
	private String base_data_code5;
	
	private String base_data_name;
	private String base_data_content1;
	private String base_data_content2;
	private String base_data_content3;
	private String base_data_content4;
	private String base_data_content5;
	private String base_data_content6;
	private String base_data_content7;
	private String base_data_content8;
	private String base_data_content9;
	
	public String getBase_data_id() {
		return base_data_id;
	}
	public void setBase_data_id(String base_data_id) {
		this.base_data_id = base_data_id;
	}
	public String getBase_data_code1() {
		return base_data_code1;
	}
	public void setBase_data_code1(String base_data_code1) {
		this.base_data_code1 = base_data_code1;
	}
	public String getBase_data_code2() {
		return base_data_code2;
	}
	public void setBase_data_code2(String base_data_code2) {
		this.base_data_code2 = base_data_code2;
	}
	public String getBase_data_code3() {
		return base_data_code3;
	}
	public void setBase_data_code3(String base_data_code3) {
		this.base_data_code3 = base_data_code3;
	}
	public String getBase_data_code4() {
		return base_data_code4;
	}
	public void setBase_data_code4(String base_data_code4) {
		this.base_data_code4 = base_data_code4;
	}
	public String getBase_data_code5() {
		return base_data_code5;
	}
	public void setBase_data_code5(String base_data_code5) {
		this.base_data_code5 = base_data_code5;
	}
	public String getBase_data_name() {
		return base_data_name;
	}
	public void setBase_data_name(String base_data_name) {
		this.base_data_name = base_data_name;
	}
	public String getBase_data_content1() {
		return base_data_content1;
	}
	public void setBase_data_content1(String base_data_content1) {
		this.base_data_content1 = base_data_content1;
	}
	public String getBase_data_content2() {
		return base_data_content2;
	}
	public void setBase_data_content2(String base_data_content2) {
		this.base_data_content2 = base_data_content2;
	}
	public String getBase_data_content3() {
		return base_data_content3;
	}
	public void setBase_data_content3(String base_data_content3) {
		this.base_data_content3 = base_data_content3;
	}
	public String getBase_data_content4() {
		return base_data_content4;
	}
	public void setBase_data_content4(String base_data_content4) {
		this.base_data_content4 = base_data_content4;
	}
	public String getBase_data_content5() {
		return base_data_content5;
	}
	public void setBase_data_content5(String base_data_content5) {
		this.base_data_content5 = base_data_content5;
	}
	public String getBase_data_content6() {
		return base_data_content6;
	}
	public void setBase_data_content6(String base_data_content6) {
		this.base_data_content6 = base_data_content6;
	}
	public String getBase_data_content7() {
		return base_data_content7;
	}
	public void setBase_data_content7(String base_data_content7) {
		this.base_data_content7 = base_data_content7;
	}
	public String getBase_data_content8() {
		return base_data_content8;
	}
	public void setBase_data_content8(String base_data_content8) {
		this.base_data_content8 = base_data_content8;
	}
	public String getBase_data_content9() {
		return base_data_content9;
	}
	public void setBase_data_content9(String base_data_content9) {
		this.base_data_content9 = base_data_content9;
	}
	
	public BaseDataVO() {

	}
	
	@Override
	public String toString() {
		return "BaseDataVO [base_data_id=" + base_data_id + ", base_data_code1=" + base_data_code1
				+ ", base_data_code2=" + base_data_code2 + ", base_data_code3=" + base_data_code3 + ", base_data_code4="
				+ base_data_code4 + ", base_data_code5=" + base_data_code5 + ", base_data_name=" + base_data_name
				+ ", base_data_content1=" + base_data_content1 + ", base_data_content2=" + base_data_content2
				+ ", base_data_content3=" + base_data_content3 + ", base_data_content4=" + base_data_content4
				+ ", base_data_content5=" + base_data_content5 + ", base_data_content6=" + base_data_content6
				+ ", base_data_content7=" + base_data_content7 + ", base_data_content8=" + base_data_content8
				+ ", base_data_content9=" + base_data_content9 + "]";
	}

}
