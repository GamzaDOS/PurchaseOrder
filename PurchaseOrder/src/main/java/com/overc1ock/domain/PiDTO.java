package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PiDTO {
	
	private String item_code;
	private String pis_name;
	private Date pis_date;
	private String employee_name;
	private String subcontractor_name;
	private String item_name;
	private Date po_date;
	private Integer pi_status;
	private String po_code;
	private String pi_code;
	
}
