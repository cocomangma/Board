
package board.board.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import board.board.dto.BoardDto;
import board.board.service.BoardService;
import board.member.dto.MemberDto;
import board.util.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	ServletContext servletContext;

	@GetMapping("/openBoardList")
	public ModelAndView openBoardList(@RequestParam(value = "page",defaultValue = "1") int page) throws Exception {

		ModelAndView mv = new ModelAndView("/board/boardList");
		System.out.println("page:"+page);
		List<BoardDto> list = boardService.selectBoardList(page);
		
		//paging 로직
		Paging paging = boardService.pagingParam(page);
		mv.addObject("list", list);  
		mv.addObject("paging", paging);  
		System.out.println("paging:"+paging);
		
		return mv;
	}

	@GetMapping("/openAdminBoardList")
	public ModelAndView adminBoardList(@RequestParam(value = "page",required = false,defaultValue = "1") int page) throws Exception {
		ModelAndView mv = new ModelAndView("/board/adminBoardList");
		List<BoardDto> list = boardService.selectAdminBoardList(page);
		Paging paging = boardService.pagingParam(page);
		System.out.println("page:"+page);
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

		System.out.println("multi:" + multi);
		System.out.println("file:" + file);
		
		
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

		return "redirect:/board/openAdminBoardList";

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

		return "redirect:/board/openAdminBoardList";
	}

}
