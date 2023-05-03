// BoardServiceImpl.java
package board.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.board.dto.BoardDto;
import board.board.mapper.BoardMapper;
import board.util.Paging;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	int pageLimit = 3; //한페이지당 보여줄 글 갯수
	int blockLimit = 3; //하단에 보여줄 페이지 번호 갯수

	public List<BoardDto> selectBoardList(int page) throws Exception {

		int pageStart = (page-1) * pageLimit;
		Map<String,Integer> pagingParams = new HashMap<>();
		pagingParams.put("start", pageStart);
		pagingParams.put("limit", pageLimit);

		return boardMapper.selectBoardList(pagingParams);
	}

	public void insertBoard(BoardDto board) throws Exception{
		boardMapper.insertBoard(board);

	}

	public BoardDto selectBoardDetail(int boardIdx) throws Exception {
		BoardDto board = boardMapper.selectBoardDetail(boardIdx);
		return board;
	}


	public void updateBoard(BoardDto board) throws Exception {
		boardMapper.updateBoard(board);
	}


	public void deleteBoard(int boardIdx) throws Exception {
		boardMapper.deleteBoard(boardIdx);
	}


	public void updateHitcount(int boardIdx) throws Exception {
		boardMapper.updateHitcount(boardIdx);
	}


	public BoardDto selectBoardList2(int boardIdx) throws Exception {
		boardMapper.updateHitcount(boardIdx);
		BoardDto board = boardMapper.selectBoardList2(boardIdx);
		return board;
	}


	public Paging pagingParam(int page) throws Exception {

		//전체 글 갯수 조회
		int boardCount = boardMapper.boardCount();
		//전체 페이지 갯수 계산 (10/3=3.333 =>4)
		int maxPage = (int) (Math.ceil((double)boardCount/pageLimit));
		//시작 페이지 값 계산(1,4,7...)
		int startPage = (((int) (Math.ceil((double)page/blockLimit)))-1) * blockLimit + 1;
		//끝 페이지 값 계산 (3,6,9...)
		int endPage = startPage + blockLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;

		}

		Paging paging = new Paging();

		paging.setPage(page);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);

		return paging;
	}





}