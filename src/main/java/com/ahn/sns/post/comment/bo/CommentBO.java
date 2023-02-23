package com.ahn.sns.post.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.sns.post.comment.dao.CommentDAO;
import com.ahn.sns.post.comment.model.Comment;
import com.ahn.sns.post.comment.model.CommentDetail;
import com.ahn.sns.user.bo.UserBO;
import com.ahn.sns.user.model.User;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserBO userBO;
	
	// 특정 post의 댓글 목록을 조회하는 기능
	public List<CommentDetail> commentList(int postId){
		
		List<Comment> commentList = commentDAO.postComment(postId);
		List<CommentDetail> detailComment = new ArrayList<>();
		
		for(Comment comment:commentList) {
			CommentDetail detail = new CommentDetail();
			
			User user = userBO.getUserById(comment.getUserId());
			
			detail.setId(comment.getId());
			detail.setUserId(comment.getUserId());
			detail.setPostId(comment.getPostId());
			detail.setContent(comment.getContent());
			detail.setLoginId(user.getLoginId());
			detail.setCreatedAt(comment.getCreatedAt());
			detail.setUpdatedAt(comment.getUpdatedAt());
			
			detailComment.add(detail);
		}
		
		return detailComment;
	}
	
	public int insertComment(int userId, String loginId, int postId, String content) {
		return commentDAO.insertComment(userId, loginId, postId, content);
	}
	
	public int deleteCommentByPost(int postId) {
		return commentDAO.deleteCommentByPostId(postId);
	
	}
}
