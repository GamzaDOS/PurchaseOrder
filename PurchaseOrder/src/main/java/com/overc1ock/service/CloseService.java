package com.overc1ock.service;

import java.util.List;

import com.overc1ock.domain.CloseDTO;
import com.overc1ock.domain.Criteria;

public interface CloseService {
	
	List<CloseDTO>closelist(Criteria cri);
	void closelist2(String pocode);

}
