package com.ahn.sns.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ahn.sns.post.bo.PostBO;
import com.ahn.sns.post.model.Post;
import com.ahn.sns.post.model.PostDetail;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/main/view")
	public String mainView(
			Model model
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.mainList(userId);
		
		model.addAttribute("posts", postList);
		
		return "/post/main";
	}
	
	@GetMapping("/mypost/view")
	public String myPostView(
			Model model
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<PostDetail> postList = postBO.myPostList(userId);
		
		model.addAttribute("posts", postList);
		
		return "/post/main";
	}
	
	@GetMapping("/create/view")
	public String createView() {
		return "/post/create";
	}
	
	@GetMapping("/update/view")
	public String updateView(
			@RequestParam("postId") int postId
			,Model model) {
		
		Post post = postBO.getPost(postId);
		
		model.addAttribute("post", post);
		return "/post/update";
	}
	
}
