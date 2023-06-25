package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PiDTO {
	
	private Integer item_code;
	private String subcontractor_name;
	private String item_name;
	private String employee_name;
	private Date procurement_date;
	private Date po_date;
	private Integer pi_status;

}
