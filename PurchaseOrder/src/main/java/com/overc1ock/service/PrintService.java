package com.overc1ock.service;

import java.util.HashMap;
import java.util.List;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PoDTO;
import com.overc1ock.domain.PpDTO;

public interface PrintService {
	
	List<ContractDTO> printlist(HashMap<String, Object> map);
	void enterpo(PoDTO podto);
	void enterpojoin(PoDTO podto);
	void printupdate(PoDTO podto);
	

}
