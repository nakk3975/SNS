package com.ahn.sns.post.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ahn.sns.post.comment.bo.CommentBO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post/comment")
public class CommentController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("userLoginId");
		
		int count = commentBO.insertComment(userId, loginId, postId, content);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
