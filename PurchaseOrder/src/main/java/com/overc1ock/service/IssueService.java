package com.overc1ock.service;

import java.util.List;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PpDTO;

public interface IssueService {
	
	List<PpDTO>completelist(Criteria cri);
	List<ContractDTO>contractlist(String code);

}
