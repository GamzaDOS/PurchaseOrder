package com.overc1ock.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ContractDTO {
	
	private String subcontractor_name;
	private Integer item_code;
	private String item_name;
	private Integer supply_price;

}
