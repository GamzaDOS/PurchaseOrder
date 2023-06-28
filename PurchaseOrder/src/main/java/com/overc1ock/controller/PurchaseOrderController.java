package com.overc1ock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.overc1ock.domain.ContractDTO;
import com.overc1ock.domain.Criteria;
import com.overc1ock.domain.PiDTO;
import com.overc1ock.domain.PisDTO;
import com.overc1ock.domain.PoDTO;
import com.overc1ock.domain.PpDTO;
import com.overc1ock.service.CloseService;
import com.overc1ock.service.InspectionService;
import com.overc1ock.service.IssueService;
import com.overc1ock.service.PrintService;
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
	PrintService printService;
	
    @RequestMapping("")
    public String redirectToIndex(Model model, Criteria cri, String code) {
	    model.addAttribute("completelist", issueservice.completelist(cri));    
        return "/purchaseorder/issue";
    }
	
	@GetMapping("/index1")
	public void index() {	
	}
	
	@GetMapping("/issue")
	public void issue(Model model, Criteria cri, String code) {
	    model.addAttribute("completelist", issueservice.completelist(cri));
	}

	@GetMapping("/inspection")
	public void inspection(HttpServletRequest request,Model model, Criteria cri, @ModelAttribute("piDTO") PiDTO piDTO) {
		model.addAttribute("pilist",inspectionservice.pilist(cri));
		String pocode = request.getParameter("po_code");		
		log.info("과연 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡpo는" + pocode);
		inspectionservice.piupdate(pocode);	
		inspectionservice.pisinput(piDTO);
		inspectionservice.beforepisinput(piDTO);
		log.info("과연 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡinspection는" + pocode);
		
	}
	
	@PostMapping("/inspection2")
	public String inspection2(@ModelAttribute PiDTO piDTO) {
	    inspectionservice.pisinput(piDTO);
	    inspectionservice.beforepisinput(piDTO);
	    log.info("inspection은: " + piDTO);
	    return "redirect:/purchaseorder/inspection";
	}

	@PostMapping("/pistext")
	public String pistext(@ModelAttribute PisDTO pisDTO) {
	    inspectionservice.pistext(pisDTO);
	    log.info("pistext은mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm " + pisDTO);
	    return "redirect:/purchaseorder/inspection";
	}
	
	
	
	@GetMapping("/close")
	public void close(HttpServletRequest request, Model model, Criteria cri) {
		String poCode = request.getParameter("poCodeInput");
	    model.addAttribute("closelist", closeService.closelist(cri));
	    closeService.closelist2(poCode);
	    log.info("과연 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + poCode);

	}
	
	
	@GetMapping("/report")
	public void report(Model model, Criteria cri) {
		model.addAttribute("count1",reportService.contractlistCount(cri));
		model.addAttribute("count3",reportService.closecount(cri));
		model.addAttribute("count4",reportService.closecount2(cri));
		model.addAttribute("count5",reportService.pilistcount1(cri));
		model.addAttribute("count6",reportService.pilistcount2(cri));	
	}
	
	//출력화면
	
	@GetMapping("/print")
	public void print(@RequestParam("contract_code") String contractcode, @RequestParam("itemcode") String itemcode, Model model) {
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("code", itemcode);
	    map.put("code2", contractcode);
	    log.info("과연 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + map);
	   List<ContractDTO> aaa = printService.printlist(map);
	   model.addAttribute("resultList", aaa);
	   log.info("과연2 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + aaa);
	   
	   
	}
	
	@PostMapping("/print")
	 public void print(@ModelAttribute("poDTO") PoDTO poDTO,Model model) {
		printService.enterpo(poDTO);
		printService.enterpojoin(poDTO);
		printService.printupdate(poDTO);
		log.info("과연2 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ" + poDTO);
		//조달계획 업데이트
		
	}
	
	

	

}
