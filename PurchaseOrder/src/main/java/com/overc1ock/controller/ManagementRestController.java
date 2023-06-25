package com.overc1ock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.overc1ock.service.InspectionService;
import com.overc1ock.service.IssueService;
import com.overc1ock.service.ReportService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/purchaseorder/*")
@AllArgsConstructor
@Log4j
public class ManagementRestController {
	@Autowired
	private ReportService reportService;

}
