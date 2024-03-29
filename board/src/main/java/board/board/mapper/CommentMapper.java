package board.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import board.board.dto.CommentDto;

@Mapper
public interface CommentMapper {
	public void save(CommentDto commentDto) throws Exception;

	public List<CommentDto> findAll(Long boardId) throws Exception;

	public void deleteComment(int id) throws Exception;
}
