package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PoDTO {
	

	private String subcontractor_name;
	private String subcontractor_person;
	private String subcontractor_tel;
	private String item_name;
	private String item_code;
	private Integer supply_price;
	private Integer consumption;
	private String process;
	private String delivery_tel;
	private String delivery_person;
	private String ex_works;
	private String inspection_method;
	private String payment;
	private String po_text;
	private String delivery_place;
	private String contract_code;
	private String po_code;
	private String pp_code;

}
