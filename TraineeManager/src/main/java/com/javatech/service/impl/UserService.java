package com.javatech.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.javatech.dao.IUserDAO;
import com.javatech.model.UserModel;
import com.javatech.service.IUserService;

public class UserService implements IUserService {
	@Inject
	private IUserDAO userDAO;
	@Override
	public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
		return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
	}

	@Override
	public List<UserModel> findAll() {
		return userDAO.findAll();
	}

	@Override
	public List<UserModel> findAllTrainees() {
		return userDAO.findAllTrainees();
	}
	
	@Override
	public List<UserModel> findAllPending() {
		return userDAO.findAllPending();
	}
	
	@Override
	public Long save(UserModel userModel) {
		return userDAO.save(userModel);
	}
}
