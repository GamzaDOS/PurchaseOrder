package com.overc1ock.mapper;

import java.util.HashMap;
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
	List<ContractDTO>contractlist(String code);
	
	//발주서 화면

	List<ContractDTO> printlist(HashMap<String, Object> map);
	void enterpo(PoDTO podto);
	void enterpojoin(PoDTO podto);
	void printupdate(PoDTO podto);
	

	
	//검수
	List<PiDTO>pilist(Criteria cri);
	List<PisDTO>pislist(String pi_code);
	void piupdate(String pocode);
	
	
	//검수 인풋
	void pisinput(PiDTO pidto);
	void beforepisinput(PiDTO pidto);
	
	
	//검수일정
	
	void pistext(PisDTO pisdto);
	
	
	
	//마감
	List<CloseDTO>closelist(Criteria cri);
	void closelist2(String pocode);
	
	

	
	
	//리포트
	int contractlistCount(Criteria cri);
	int pocount(Criteria cri);
	int closecount(Criteria cri);
	int closecount2(Criteria cri);
	int pilistcount1(Criteria cri);
	int pilistcount2(Criteria cri);
	

}
