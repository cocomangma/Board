package board.board.dto;

import java.security.Timestamp;

import lombok.Data;

@Data
public class CommentDto {
	private Long id;
	private String commentWriter;
	private String commentContents;
	private Long boardId;
	private Timestamp commentCreatedTime;
}
