package com.bit.tsigner.controller;

import java.sql.SQLException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.tsigner.service.BookingService;


@Controller
public class BookingController {
	@Inject
	BookingService bookingService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@RequestMapping(value = "/booking")
	public String booking(Model model) throws SQLException {
		logger.debug("부킹페이지");
		
		bookingService.getList(model);
		return "booking";
	}
}
