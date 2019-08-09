package com.bit.tsigner.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.tsigner.model.entity.BookingVo;


public interface BookingDao {
	List<BookingVo> selectAll() throws SQLException;
}
