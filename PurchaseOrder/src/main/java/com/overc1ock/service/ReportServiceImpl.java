package com.overc1ock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PpDTO;
import com.overc1ock.mapper.PurchaseOrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReportServiceImpl implements ReportService{
	
	PurchaseOrderMapper mapper;

	@Override
	public int contractlistCount(Criteria cri) {
		return mapper.contractlistCount(cri);
	}

	@Override
	public int pocount(Criteria cri) {
		return mapper.pocount(cri);
	}

	@Override
	public int closecount(Criteria cri) {
		return mapper.closecount(cri);
	}

	@Override
	public int closecount2(Criteria cri) {
		return mapper.closecount2(cri);
	}

	@Override
	public int pilistcount1(Criteria cri) {
		return mapper.pilistcount1(cri);
	}

	@Override
	public int pilistcount2(Criteria cri) {
		return mapper.pilistcount2(cri);
	}

}
