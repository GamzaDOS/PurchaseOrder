package com.overc1ock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PpDTO;
import com.overc1ock.service.CloseService;
import com.overc1ock.service.InspectionService;
import com.overc1ock.service.IssueService;
import com.overc1ock.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/purchaseorder/*")
@AllArgsConstructor
public class PurchaseOrderController {
	
	IssueService issueservice;
	InspectionService inspectionservice;
	ReportService reportService;
	CloseService closeService;
	
	@GetMapping("/index1")
	public void index() {	
	}
	
	@GetMapping("/issue")
	public void issue(Model model, Criteria cri) {
	    model.addAttribute("completelist", issueservice.completelist(cri));
	    model.addAttribute("contractlist", issueservice.contractlist());
	}
	
	@PostMapping("/issues")
	public String issueSearch(@ModelAttribute PpDTO ppdto, Model model) {
		model.addAttribute("contractlist", issueservice.contractlist());
		return "/purchaseorder/issue";
	}
	

	@GetMapping("/inspection")
	public void inspection(Model model, Criteria cri) {
		model.addAttribute("pilist",inspectionservice.pilist(cri));
		model.addAttribute("pislist",inspectionservice.pislist());		
	}
	
	@GetMapping("/close")
	public void close(Model model, Criteria cri) {
		model.addAttribute("closelist",closeService.closelist(cri));
	}
	
	
	@PostMapping("/close")
	public void closeMemo(@RequestParam("noteInput") String noteInput) {

	    //closeService.saveDatabase(noteInput);
	}
	
	@GetMapping("/report")
	public void report(Model model, Criteria cri) {
		model.addAttribute("count1",reportService.contractlistCount(cri));
		model.addAttribute("count2",reportService.pocount(cri));
		model.addAttribute("count3",reportService.closecount(cri));
		
		
	}
	
	//출력화면
	
	@GetMapping("/print")
	public void print(Model model) {
		
	}
	
	

	

}
