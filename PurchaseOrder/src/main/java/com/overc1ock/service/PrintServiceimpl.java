package com.overc1ock.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PoDTO;
import com.overc1ock.domain.PpDTO;
import com.overc1ock.mapper.PurchaseOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class PrintServiceimpl implements PrintService{
	
	PurchaseOrderMapper mapper;

	@Override
	public List<ContractDTO> printlist(HashMap<String, Object> map) {
		return mapper.printlist(map);
	}

	@Override
	public void enterpo(PoDTO podto) {
		mapper.enterpo(podto);
	}

	@Override
	public void enterpojoin(PoDTO podto) {
		mapper.enterpojoin(podto);		
	}

	@Override
	public void printupdate(PoDTO podto) {
		mapper.printupdate(podto);
		
	}


	
	




}
