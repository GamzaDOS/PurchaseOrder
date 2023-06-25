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
	private Integer item_code;
	private Integer supply_price;
	private Integer consumption;
	private String process;
	
	
	
	


}
