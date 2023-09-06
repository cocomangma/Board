package board.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.board.dto.CommentDto;
import board.board.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@PostMapping("/save")
	@ResponseBody
	public List<CommentDto> save(@ModelAttribute CommentDto commentDto) throws Exception{
		System.out.println("comment"+commentDto);
		commentService.save(commentDto);
		//게시글에 작성된 댓글 리스트 가져옴
		List<CommentDto> commentDtoList = commentService.findAll(commentDto.getBoardId());
		return commentDtoList;

	}

}
