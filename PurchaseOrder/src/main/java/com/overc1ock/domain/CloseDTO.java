package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CloseDTO {
	
	private Integer po_code;
	private String item_name;
	private String subcontractor_name;
	private String delivery_place;
	private String payment;
	private String delivery_person;
	private Date po_date;
	private Integer close_status;
	
}
