package com.overc1ock.service;

import java.util.List;

import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PpDTO;

public interface ReportService {
	
	int contractlistCount(Criteria cri);
	int pocount(Criteria cri);
	int closecount(Criteria cri);
	int closecount2(Criteria cri);
	int pilistcount1(Criteria cri);
	int pilistcount2(Criteria cri);
}
