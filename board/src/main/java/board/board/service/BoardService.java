// BoardServiceImpl.java
package board.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.board.dto.BoardDto;
import board.board.dto.SearchDto;
import board.board.mapper.BoardMapper;
import board.util.Paging;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;

	int pageLimit = 3; //한페이지당 보여줄 글 갯수
	int blockLimit = 3; //하단에 보여줄 페이지 번호 갯수

	public List<BoardDto> selectBoardList(SearchDto searchDto) throws Exception {

		int pageStart = (searchDto.getPage() - 1) * pageLimit;
		searchDto.setStart(pageStart);
		searchDto.setLimit(pageLimit);

		log.info("searchDto = {}", searchDto);

		return boardMapper.selectBoardList(searchDto);
	}

	public void insertBoard(BoardDto board) throws Exception{
		boardMapper.insertBoard(board);

	}

	public BoardDto selectBoardDetail(int boardIdx) throws Exception {
		BoardDto board = boardMapper.selectBoardDetail(boardIdx);
		System.out.println("@@@@@@@@@@@@@W");
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


	public Paging pagingParam(SearchDto searchDto) throws Exception {

		log.info("pagingParam searchDto: " + searchDto);
		//전체 글 갯수 조회
		int boardCount = boardMapper.boardCount(searchDto);
		//전체 페이지 갯수 계산 (10/3=3.333 =>4)
		int maxPage = (int) (Math.ceil((double)boardCount/pageLimit));
		//시작 페이지 값 계산(1,4,7...)
		int startPage = (((int) (Math.ceil((double)searchDto.getPage()/blockLimit)))-1) * blockLimit + 1;
		//끝 페이지 값 계산 (3,6,9...)
		int endPage = startPage + blockLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;

		}

		Paging paging = new Paging();
		paging.setPage(searchDto.getPage());
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);

		return paging;
	}





}