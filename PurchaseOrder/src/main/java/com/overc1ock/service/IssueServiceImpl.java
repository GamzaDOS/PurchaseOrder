package com.overc1ock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PpDTO;
import com.overc1ock.mapper.PurchaseOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class IssueServiceImpl implements IssueService{
	
	PurchaseOrderMapper mapper;
	
	

	@Override
	public List<PpDTO> completelist(Criteria cri) {
		log.info("===============완료된 조달계획 리스트===============");
		return mapper.completelist(cri);
	}

	@Override
	public List<ContractDTO> contractlist(String code) {
		log.info("===============조달계획 계약서===============");
		return mapper.contractlist(code);
	}



}
