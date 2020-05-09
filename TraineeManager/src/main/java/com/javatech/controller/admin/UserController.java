package com.javatech.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javatech.model.UserModel;
import com.javatech.service.IUserService;

@WebServlet(urlPatterns = { "/admin-trainee-list","/admin-pending-list"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private IUserService userService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserModel userModel = new UserModel();
		String servletPath = req.getServletPath();
		if (servletPath.equals("/admin-trainee-list")) {
			userModel.setListResult(userService.findAllTrainees());
		}
		else if(servletPath.equals("/admin-pending-list")) {
			userModel.setListResult(userService.findAllPending());
		}
		req.setAttribute("user", userModel);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/list.jsp");
		rd.forward(req, resp);
	}
}
