package com.ahn.sns.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahn.sns.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private LikeDAO likeDAO;
	
	public int insertLike(int userId, int postId) {
		return likeDAO.insertLike(userId ,postId);
	}
	
	public int selectCountLike(int postId) {
		return likeDAO.selectCountLike(postId);
	}
	
	public int deleteLike(int userId, int postId) {
		return likeDAO.deleteLike(userId, postId);
	}
	
	public boolean isLike(int userId, int postId) {
		int count = likeDAO.selectLikeById(userId, postId);
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public int deleteLikeByPost(int postId) {	
		return likeDAO.deleteLikeByPostId(postId);

	}
}
