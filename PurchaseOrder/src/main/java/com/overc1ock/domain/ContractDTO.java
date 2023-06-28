package com.overc1ock.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ContractDTO {
	
	private String subcontractor_name;
	private String contract_code;
	private String item_name;
	private Integer supply_price;
	private Integer consumption;
	private String item_code;
	private String po_code;
	private String pp_code;
	private String contract_text;
	

}
