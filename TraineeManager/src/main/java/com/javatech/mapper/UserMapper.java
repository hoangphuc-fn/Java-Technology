package com.javatech.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.javatech.model.RoleModel;
import com.javatech.model.UserModel;

public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet rs) {
		try {
			UserModel user = new UserModel();
			user.setId(rs.getLong("id"));
			user.setEmail(rs.getString("email"));
			user.setUserName(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setPhoneNumber(rs.getString("phone_number"));
			user.setAddress(rs.getString("address"));
			user.setDOB(rs.getTimestamp("dob"));
			user.setUniversity(rs.getString("university"));
			user.setRoleId(rs.getLong("role_id"));
			user.setStatus(rs.getInt("status"));
			user.setCreatedBy(rs.getLong("created_by"));
			user.setModifiedBy(rs.getLong("modified_by"));
			user.setDeactivedAt(rs.getTimestamp("deactived_at"));
			if (rs.getTimestamp("created_date") != null) {
				user.setCreatedDate(rs.getTimestamp("created_date"));
			}
			if (rs.getTimestamp("modified_date") != null) {
				user.setModifiedDate(rs.getTimestamp("modified_date"));
			}
			try {
				RoleModel role = new RoleModel();
				role.setCode(rs.getString("code"));
				role.setName(rs.getString("name"));
				user.setRole(role);
			} catch (Exception e) {
				System.out.print(e.getMessage());
			}
			return user;
		} catch (SQLException e) {
			return null;
		}
	}
}
