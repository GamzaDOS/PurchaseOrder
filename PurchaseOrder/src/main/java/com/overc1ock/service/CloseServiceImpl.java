package com.overc1ock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.overc1ock.domain.CloseDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.mapper.PurchaseOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class CloseServiceImpl implements CloseService{
	
	PurchaseOrderMapper mapper;
	
	
	@Override
	public List<CloseDTO> closelist(Criteria cri) {
		return mapper.closelist(cri);
	}


	@Override
	public String saveDataToDatabase(String noteInput) {
		return mapper.saveDataToDatabase(noteInput);
		
	}

}
