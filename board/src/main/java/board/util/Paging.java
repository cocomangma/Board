package board.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Paging {
	private int page; //현재 페이지
	private int maxPage; //전체 필요한 페이지
	private int startPage; //현재 페이지 기준 시작 페이지
	private int endPage; //현재 페이지기준 마지막 페이지

}


