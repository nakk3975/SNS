package com.ahn.sns.post;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ahn.sns.post.bo.PostBO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@RestController
@RequestMapping("/post")
public class PostRestController {

	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String, String> createPost(
			@RequestParam("file") MultipartFile file
			, @RequestParam("title") String title
			, @RequestParam("content") String content
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		int userId = (Integer)session.getAttribute("userId");
		String loginId = (String)session.getAttribute("loginId");
		
		int count = postBO.insertPost(userId, loginId, title, content, file);
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
