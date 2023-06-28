package com.overc1ock.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PisDTO;
import com.overc1ock.domain.PpDTO;


import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class Test1 {
	
	@Autowired
	PurchaseOrderMapper mapper;
	
//	@Test
//	public void contractTest() {
//		List<ContractDTO> list = mapper.contractlist();
//		for(ContractDTO aa : list) {
//			log.info("결과는 ?"+aa);
//		}
//	
//	}
	
	@Test
	public void searchTest() {
		Criteria cri = new Criteria();
		cri.setStartDate("2023-06-01");
		cri.setEndDate("2023-06-10");
		cri.setItem_name("품목");
	    List<PpDTO> result = mapper.completelist(cri);
	    for (PpDTO aa : result) {
	        log.info(aa);
	    }
	}
	
	@Test
	public void count1() {
		Criteria cri = new Criteria();
		cri.setStartDate("2023-06-01");
		cri.setEndDate("2023-06-25");
		int list = mapper.contractlistCount(cri);
		log.info(list);

	}
	
	

	
	

}
	
	
