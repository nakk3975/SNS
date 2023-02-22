package com.ahn.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.sns.common.EncryptUtils;
import com.ahn.sns.user.dao.UserDAO;
import com.ahn.sns.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int inputUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	public int selectLoginId(String loginId) {
		return userDAO.selectId(loginId);
	}
	
	public User selectLogin(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectLogin(loginId, encryptPassword);
	}
	
	public User passwordSearch(String loginId, String email) {
		return userDAO.selectPasswordSearch(loginId, email);
	}
	
	public int updatePassword(int id, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.updatePassword(id, encryptPassword);
	}
	
	public User getUserById(int id) {
		return userDAO.selectUserById(id);
	}

}
