package com.javatech.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.dao.IUserDAO;
import com.javatech.dao.impl.UserDAO;
import com.javatech.model.UserModel;
import com.javatech.service.IUserService;

@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private IUserDAO x = new UserDAO();
	@Inject
	private IUserService userService;
	@SuppressWarnings("unused")
	private UserModel user = new UserModel();
	@SuppressWarnings("deprecation")
	Timestamp time = new Timestamp(1997,8,18,0,0,0,0);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		@SuppressWarnings("unused")
//		List<UserModel> u =  x.findAll();
//		user.setEmail("16520946@gm.uit.edu.vn");
//		user.setUserName("Hoàng Bi");
//		user.setPassword("123a");
//		user.setPhoneNumber("0357126121xxx");
//		user.setAddress("Quảng Trị");
//		user.setDOB(new Timestamp(System.currentTimeMillis()));
//		user.setUniversity("uit");
//		user.setRoleId(2L);
//		user.setStatus(0);
//		user.setCreatedBy(1L);
//		user.setCreatedDate(new Timestamp(System.currentTimeMillis()));
//		x.save(user);
		List<UserModel> lu = userService.findAll();
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
		rd.forward(request, response);
	}
}
