
package board.board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import board.board.dto.SearchDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.board.dto.BoardDto;
import board.board.dto.CommentDto;
import board.board.service.BoardService;
import board.board.service.CommentService;
import board.member.dto.MemberDto;
import board.util.Paging;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private CommentService commentService;

	@Autowired
	ServletContext servletContext;

	@GetMapping("/openBoardList")
	public ModelAndView openBoardList(
			@ModelAttribute SearchDto searchDto) throws Exception {

		ModelAndView mv = new ModelAndView("/board/boardList");

		List<BoardDto> list = boardService.selectBoardList(searchDto);

		//paging 로직
		Paging paging = boardService.pagingParam(searchDto);
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		System.out.println("paging:"+paging);
		return mv;
	}

	@GetMapping("/openBoardList2")
	public ModelAndView openBoardList2(int boardIdx, MemberDto memberdto,@RequestParam(value = "page",defaultValue = "1") int page,Model model) throws Exception {
		ModelAndView mv = new ModelAndView ("/board/boardList2");
		BoardDto board = boardService.selectBoardList2(boardIdx);
		mv.addObject("board", board);
		model.addAttribute("page",page);
		List<CommentDto> commentDto = commentService.findAll((long) boardIdx);
		model.addAttribute("commentDto",commentDto);
		return mv;
	}

	@GetMapping("/openBoardWrite")
	public String openBoardWrite() throws Exception {
		return "/board/boardWrite";
	}

	@PostMapping("/insertBoard")
	public String insertBoard(BoardDto board) throws Exception {
		boardService.insertBoard(board);

		MultipartFile multi = board.getUpload();
		String uploadPath = servletContext.getRealPath("/resource/images");
		File file = new File(uploadPath + "/" + multi.getOriginalFilename());

		multi.transferTo(file);
		log.info("multi:"+multi);
		log.info("file:"+file);
		System.out.println("@@@@@@@@@@@@");


		return "redirect:/board/openBoardList";

	}

	@GetMapping("/openBoardDetail")
	public ModelAndView openBoardDetail(int boardIdx) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardUpdate");
		BoardDto board = boardService.selectBoardDetail(boardIdx);
		mv.addObject("board", board);

		return mv;
	}

	@PostMapping("/updateBoard")
	public String updateBoard(BoardDto board, @RequestParam("originalImage") String originalImage) throws Exception {

		// 기존 이미지 삭제
		String deletePath = servletContext.getRealPath("/resource/images") + "/" + originalImage;
		System.out.println(deletePath);
		File delFile = new File(deletePath + "/" + board.getImage());
		System.out.println("delFile:" + delFile);
		delFile.delete();

		// 새로운 이미지 등록
		MultipartFile multi = board.getUpload();
		String newPath = servletContext.getRealPath("/resource/images") + "/" + board.getImage(); // 업로드 위치 설정
		File file2 = new File(newPath);
		System.out.println("multi:" + multi);
		System.out.println("file2:" + file2);

		multi.transferTo(file2);

		boardService.updateBoard(board);

		return "redirect:/board/openBoardList";

	}

	@GetMapping("/deleteBoard")
	public String deleteBoard(int boardIdx) throws Exception {

		boardService.deleteBoard(boardIdx);
		BoardDto board = new BoardDto();

		String deletePath = servletContext.getRealPath("/resource/images");
		File delFile = new File(deletePath + "/" + board.getImage());
		System.out.println(deletePath);
		System.out.println("delFile:" + delFile);
		delFile.delete();

		return "redirect:/board/openBoardList";
	}

}
