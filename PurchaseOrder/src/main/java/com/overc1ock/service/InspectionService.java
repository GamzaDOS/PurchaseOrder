package com.overc1ock.service;

import java.util.List;


import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PiDTO;
import com.overc1ock.domain.PisDTO;


public interface InspectionService {
	
	List<PiDTO>pilist(Criteria cri);
	List<PisDTO>pislist(String pi_code);
	void piupdate(String pocode);
	
	
	// input
	void pisinput(PiDTO pidto);
	void beforepisinput(PiDTO pidto);
	
	
	//text
	void pistext(PisDTO pisdto);
}
