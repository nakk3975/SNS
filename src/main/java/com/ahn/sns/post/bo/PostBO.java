package com.ahn.sns.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ahn.sns.common.FileManagerService;
import com.ahn.sns.post.comment.bo.CommentBO;
import com.ahn.sns.post.comment.model.CommentDetail;
import com.ahn.sns.post.dao.PostDAO;
import com.ahn.sns.post.like.bo.LikeBO;
import com.ahn.sns.post.model.Post;
import com.ahn.sns.post.model.PostDetail;
import com.ahn.sns.user.bo.UserBO;
import com.ahn.sns.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	@Autowired
	private UserBO userBO;
	@Autowired
	private LikeBO likeBO;
	@Autowired
	private CommentBO commentBO;
	
	public List<PostDetail> mainList(int userId) {
		
		List<Post> postList = postDAO.mainPost();
		
		List<PostDetail> listDetail = new ArrayList<>();
		
		// 생성된 postDetail 객체를 리스트로 구성한다.
		for(Post post:postList) {
			// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
			PostDetail detail = new PostDetail();
			
			User user = userBO.getUserById(post.getUserId());
			// 좋아요 개수 조회
			int likeCount = likeBO.selectCountLike(post.getId());
			// 좋아요 여부 조회
			boolean isLike = likeBO.isLike(userId, post.getId());
			
			List<CommentDetail> commentList = commentBO.commentList(post.getId());
			
			detail.setId(post.getId());
			detail.setTag(post.getTag());
			detail.setUserId(post.getUserId());
			detail.setContent(post.getContent());
			detail.setImagePath(post.getImagePath());
			detail.setCreatedAt(post.getCreatedAt());
			detail.setLike(isLike);
			detail.setLikeCount(likeCount);
			detail.setLoginId(user.getLoginId());
			detail.setCommentList(commentList);
			
			listDetail.add(detail);
		}
		return listDetail;
		
	}
	
public List<PostDetail> myPostList(int userId) {
		
		List<Post> postList = postDAO.selectMyPost(userId);
		
		List<PostDetail> listDetail = new ArrayList<>();
		
		// 생성된 postDetail 객체를 리스트로 구성한다.
		for(Post post:postList) {
			// postDetail 객체를 생성하고, post 객체의 정보를 저장한다.
			PostDetail detail = new PostDetail();
			
			User user = userBO.getUserById(post.getUserId());
			// 좋아요 개수 조회
			int likeCount = likeBO.selectCountLike(post.getId());
			// 좋아요 여부 조회
			boolean isLike = likeBO.isLike(userId, post.getId());
			
			List<CommentDetail> commentList = commentBO.commentList(post.getId());
			
			detail.setId(post.getId());
			detail.setTag(post.getTag());
			detail.setUserId(post.getUserId());
			detail.setContent(post.getContent());
			detail.setImagePath(post.getImagePath());
			detail.setCreatedAt(post.getCreatedAt());
			detail.setLike(isLike);
			detail.setLikeCount(likeCount);
			detail.setLoginId(user.getLoginId());
			detail.setCommentList(commentList);
			
			listDetail.add(detail);
		}
		return listDetail;
		
	}
	
	public int insertPost(int userId, String name, String title, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		return postDAO.insertPost(userId, name, title, content, imagePath);
	}
	
	public int deletePost(int postId, int userId) {
		
		Post post = postDAO.selectPost(postId);
		// 대상 post 삭제
		int count = postDAO.deleteMyPost(postId, userId);		
		if(count == 1){
			
			FileManagerService.removeFile(post.getImagePath());
			// 대상 post 좋아요와 댓글 삭제
			likeBO.deleteLikeByPost(postId);
			commentBO.deleteCommentByPost(postId);
		}
		return count;
	}
	


}
