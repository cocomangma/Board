<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<meta charset="UTF-8">
<style type="text/css">
#list {
	position: relative;
	left: 0px;
}

.d {
	margin-left: 430px;
}
</style>

</head>
<body>
	<div class="container">
		<h2 class="d">게시글 상세 화면</h2>
		<br>
		<table class="board_detail">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세내용</caption>
			<tbody>
				<tr>
					<th scope="row">글번호</th>
					<td>${board.boardIdx}</td>
					<th scope="row">조회수</th>
					<td>${board.hitCnt}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${board.creatorId}</td>
					<th scope="row">작성일</th>
					<td><fmt:parseDate var="formattedDay"
									value="${board.createdDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate var="newformattedDay" value="${formattedDay }"
									pattern="yyyy-MM-dd HH:mm:ss" /> ${newformattedDay }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="4">${board.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="4" class="view_text">${board.contents}</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><img width="70%" alt="image"
						src="${request.getContextPath()}/resource/images/${board.image} " /></td>
				</tr>
			</tbody>
		</table>
		<br> <br> <input type="button" id="list" value="목록으로"><br>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$('#list').on("click",function(){
				location.href = "openBoardList";
			})

			$('#listAdmin').on("click",function(){

				location.href = "openAdminBoardList";
			})

		})
	</script>
</body>
</html>