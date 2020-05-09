package com.javatech.service;

import java.util.List;
import com.javatech.model.UserModel;

public interface IUserService {
	UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
	List<UserModel> findAll();
	List<UserModel> findAllTrainees();
	List<UserModel> findAllPending();
	Long save(UserModel userModel);
}
