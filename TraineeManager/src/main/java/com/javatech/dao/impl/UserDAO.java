package com.javatech.dao.impl;

import java.util.List;

import com.javatech.dao.IUserDAO;
import com.javatech.mapper.UserMapper;
import com.javatech.model.UserModel;

public class UserDAO extends AbstarctDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		StringBuilder sql = new StringBuilder("SELECT * FROM users AS u");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid");
		sql.append(" WHERE username = ? AND password = ? AND status = ?");
		List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
		return users.isEmpty() ? null : users.get(0);
	}

	@Override
	public List<UserModel> findAll() {
		String sql = "SELECT * FROM users";
		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}

	@Override
	public Long save(UserModel user) {
		StringBuilder sql = new StringBuilder("INSERT INTO users (email, username, password,");
		sql.append(" phone_number, address, dob, university, role_id, status, created_date, created_by)");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		return insert(sql.toString(), user.getEmail(), user.getUserName(), user.getPassword(),
				user.getPhoneNumber(), user.getAddress(), user.getDOB(), user.getUniversity(),
				user.getRoleId(), user.getStatus(), user.getCreatedDate(), user.getCreatedBy());
	}

	@Override
	public List<UserModel> findAllTrainees() {
		String sql = "SELECT * FROM users WHERE status = 1";
		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}

	@Override
	public List<UserModel> findAllPending() {
		String sql = "SELECT * FROM users WHERE status = 0";
		List<UserModel> users = query(sql, new UserMapper());
		return users;
	}
}
