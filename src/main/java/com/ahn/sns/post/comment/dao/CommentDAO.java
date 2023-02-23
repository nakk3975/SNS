package com.ahn.sns.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ahn.sns.post.comment.model.Comment;

@Repository
public interface CommentDAO {

	public List<Comment> postComment(@Param("postId") int postId);
	
	public int insertComment(
			@Param("userId") int userId
			, @Param("loginId") String loginId
			, @Param("postId") int postId
			, @Param("content") String content);
	
	public int deleteCommentByPostId(@Param("postId") int postId);
	
}
