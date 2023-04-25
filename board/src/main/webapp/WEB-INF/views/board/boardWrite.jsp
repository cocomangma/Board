<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
 <style type="text/css">
    
    	.a{
    		position: relative;
    		top: -160px;
    	}
    	
    	#list{position: relative; left: 900px;}
    	
    	.d {
	margin-left: 430px;
}
    </style>

<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="container">
        <h2 class="d">게시판 등록</h2><br>
        <form id="frm" name="frm" method="post" action="/board/insertBoard" enctype="multipart/form-data">
            <table class="board_detail">
            
            
                <tr>
                    <td>제목</td>
                    <td><input type="text" id="title" name="title"></td>
                </tr>
                <tr>
                	<td>작성자</td>
                	<td><input type="text" id="creatorId" name="creatorId" ></td>
                </tr>
                <tr>
				<td class="a">내용</td>
                    <td>
                        <textarea id="contents" name="contents"></textarea>
                    </td>
                </tr>
              	
                <tr>
                <td>이미지</td>
                <td>
                	<input type="file" id="upload" name="upload">
                </td>
                </tr>
            </table>
            <br>
            <input type="submit" id="submit" value="저장">
            <input type="button" id="list" value="목록으로">
        </form>
    </div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#title").focus();
		
		$("#list").on("click",function(){
			location.href="openBoardList";
		})
		
		$("#submit").on("click",function(){
			if($("#title").val()==""){
				alert('제목을 입력하세요');
				$("#title").focus();
				return false;
			}
		})
	})
	
</script>
</body>
</html>