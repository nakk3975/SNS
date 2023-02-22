package com.ahn.sns.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.sns.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> mainPost();
	
	public int insertPost(
			@Param("userId") int userId
			, @Param("name") String name
			, @Param("title") String title
			, @Param("content") String content
			, @Param("imagePath") String imagePath);
	
	public List<Post> selectMyPost(@Param("userId") int userId);
}
