package com.ahn.sns.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectCountLike(@Param("postId") int postId);
	
	public int deleteLike(
			@Param("userId") int userId
			, @Param("postId") int postId);
	
	public int selectLikeById(
			@Param("userId") int userId
			, @Param("postId") int postId);
}
