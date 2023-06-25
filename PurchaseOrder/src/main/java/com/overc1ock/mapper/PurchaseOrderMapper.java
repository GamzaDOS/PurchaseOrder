package com.overc1ock.mapper;

import java.util.List;

import com.overc1ock.domain.CloseDTO;
import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PiDTO;
import com.overc1ock.domain.PisDTO;
import com.overc1ock.domain.PoDTO;
import com.overc1ock.domain.PpDTO;

public interface PurchaseOrderMapper {
	
	//발행
	List<PpDTO>completelist(Criteria cri);
	List<ContractDTO>contractlist();
	
	//검수
	List<PiDTO>pilist(Criteria cri);
	List<PisDTO>pislist();
	
	//마감
	List<CloseDTO>closelist(Criteria cri);
	String saveDataToDatabase(String noteInput);

	
	
	//리포트
	int contractlistCount(Criteria cri);
	int pocount(Criteria cri);
	int closecount(Criteria cri);
	

}
