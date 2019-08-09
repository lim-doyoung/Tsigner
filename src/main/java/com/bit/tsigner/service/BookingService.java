package com.bit.tsigner.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface BookingService {
	void getList(Model model) throws SQLException;
}
