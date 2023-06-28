package com.overc1ock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PiDTO;
import com.overc1ock.domain.PisDTO;
import com.overc1ock.service.InspectionService;
import com.overc1ock.service.IssueService;
import com.overc1ock.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/api/*")
@AllArgsConstructor
@Log4j
public class ManagementRestController {
	
	IssueService issueService;
	InspectionService inspectionService;
	
	//@GetMapping("/issue")
	//public void issue(Model model, Criteria cri) {
	//    model.addAttribute("completelist", issueService.completelist(cri));
	//    model.addAttribute("contractlist", issueService.contractlist());
	//}

	@GetMapping("/issue2")
	public List<ContractDTO> issue2(Criteria cri, String aa) {
		log.info("aa값ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ"+aa);
		//Map<String, Object> response = new HashMap<>();
		//response.put("completelist", issueService.completelist(cri));
		//response.put("contractlist", issueService.contractlist(aa));
		//return response;
		return issueService.contractlist(aa);
	}
	
	@GetMapping("/inspection2")
	public List<PisDTO> inspection2(Criteria cri, String aa) {
		log.info("aa값ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ"+aa);;
		return inspectionService.pislist(aa);
	}
}
