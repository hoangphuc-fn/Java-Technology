package com.javatech.dao;

import java.util.List;

import com.javatech.mapper.RowMapper;

public interface GenericDAO<T> {
	@SuppressWarnings("hiding")
	<T>List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);
	void update(String sql, Object...parameters);
	Long insert(String sql, Object...parameters);
}
