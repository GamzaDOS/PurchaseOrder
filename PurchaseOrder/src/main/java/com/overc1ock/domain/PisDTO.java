package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PisDTO {
	
	private String pis_name;
	private Date pis_date;
	private String employee_name;
	private Integer completion_rate;

}
