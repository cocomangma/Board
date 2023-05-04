package board.board.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class BoardDto {
    private int boardIdx;
    private String title;
    private String contents;
    private int hitCnt;
    private String creatorId;
    private String createdDatetime;
    
    //이미지 업로드
    private String image;
    private MultipartFile upload;
    
    public MultipartFile getUpload() {
		return upload;
	}
    
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		this.image = upload.getOriginalFilename();
	}
}




