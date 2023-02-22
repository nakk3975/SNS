package com.ahn.sns.post.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ahn.sns.post.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> inputLike(
			@RequestParam("postId") int postId
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.insertLike(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/unlike")
	public Map<String,String> inputUnlike(
			@RequestParam("postId") int postId
			, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		int count = likeBO.deleteLike(userId, postId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
