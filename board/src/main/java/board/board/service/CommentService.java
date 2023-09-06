package board.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.board.dto.CommentDto;
import board.board.mapper.CommentMapper;

@Service
public class CommentService {

	@Autowired
	private CommentMapper commentMapper;

	public void save(CommentDto commentDto) throws Exception {
		commentMapper.save(commentDto);
	}

	public List<CommentDto> findAll(Long boardId) {

		return commentMapper.findAll(boardId);
	}


}
