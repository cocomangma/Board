package board.board.dto;

import lombok.Data;

@Data
public class SearchDto {
    private String type;
    private String keyword;
    private int page;
    private int start;
    private int limit;

    SearchDto() {
        this.type = "all";
        this.page = 1;
    }
}
