package com.overc1ock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PpDTO {
	
	private String item_code;
	private String item_name;
	private String pp_code;
	private Integer consumption;
	private Date procurement_date;
	private Date production_date;
	private Date pp_date;
	private String process;
	
}
