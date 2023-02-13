package com.ahn.sns.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.sns.user.model.User;

@Repository
public interface UserDAO {

	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
	
	public int selectId(@Param("loginId") String loginId);
	
	public User selectLogin(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
	public User selectPasswordSearch(
			@Param("loginId") String loginId
			, @Param("email") String email);
	
	public int updatePassword(
			@Param("id") int id
			, @Param("password") String password);
}
