package board.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import board.board.dto.BoardDto;

@Mapper
public interface BoardMapper {
	public List<BoardDto> selectBoardList(Map<String, Integer> pagingParams) throws Exception;
	public void insertBoard(BoardDto board)throws Exception;
	public void updateHitcount(int boardIdx) throws Exception;
	public BoardDto selectBoardDetail(int boardIdx) throws Exception;
	public void updateBoard(BoardDto board) throws Exception;
	public void deleteBoard(int boardIdx) throws Exception;
	public BoardDto selectBoardList2(int boardIdx) throws Exception;
	public int boardCount()throws Exception;;

}




