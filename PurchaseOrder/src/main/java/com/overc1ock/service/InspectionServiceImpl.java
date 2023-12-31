package com.overc1ock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PiDTO;
import com.overc1ock.domain.PisDTO;
import com.overc1ock.mapper.PurchaseOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class InspectionServiceImpl implements InspectionService{
	
	PurchaseOrderMapper mapper;

	@Override
	public List<PiDTO> pilist(Criteria cri) {
		log.info("===============검수 리스트===============");
		return mapper.pilist(cri);
	}

	@Override
	public List<PisDTO> pislist(String pi_code) {
		log.info("===============검수 일정 리스트===============");
		return mapper.pislist(pi_code);
	}



	@Override
	public void piupdate(String pocode) {
		mapper.piupdate(pocode);
		
	}

	@Override
	public void pisinput(PiDTO pidto) {
		mapper.pisinput(pidto);	
	}
	

	@Override
	public void beforepisinput(PiDTO pidto) {
		mapper.beforepisinput(pidto);
		
	}

	@Override
	public void pistext(PisDTO pisdto) {
		mapper.pistext(pisdto);
		
	}

}
