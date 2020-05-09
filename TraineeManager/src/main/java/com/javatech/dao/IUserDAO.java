package com.javatech.dao;

import java.util.List;

import com.javatech.model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel>{
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	List<UserModel> findAll();
	List<UserModel> findAllTrainees();
	List<UserModel> findAllPending();
	Long save(UserModel userModel);
}
