<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/style.css">

<style type="text/css">

.d {
	margin-left: 430px;
}

</style>
</head>
<body>
<div class="container">
		<h2 class="d">게시글 수정 화면</h2><br>
		<form id="frm" method="post" action="updateBoard" enctype="multipart/form-data">
		<input type="hidden" name="boardIdx" value="${board.boardIdx}" >
		<input type="hidden" name="originalImage">
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
						<th scope="row">글 번호</th>
						<td>${board.boardIdx}</td>
						<th scope="row">조회수</th>
						<td>${board.hitCnt}</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${board.creatorId}</td>
						<th scope="row">작성일</th>
						<td>
							<fmt:parseDate var="formattedDay" value="${lists.createdDatetime }" pattern="yyyy-MM-dd"/>
						<fmt:formatDate var="newformattedDay" value="${formattedDay }" pattern="yyyy-MM-dd HH:mm:ss"/>
						${newformattedDay }

						</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td colspan="3"><input type="text" id="title" name="title"
							value="${board.title }"/></td>
					</tr>

					<tr>
						<th scope="row">내용</th>
						<td colspan="3" class="view_text">
						<textarea title="내용" id="contents" name="contents">${board.contents }</textarea>
						</td>
					</tr>

					<tr>
						<th scope="row">기존 이미지</th>
						<td colspan="3" class="view_text" >
						<img width="30%" alt="originalImage"
						src="${request.getContextPath()}/resource/images/${board.image} " /></td>
					</tr>

					<tr>
						<th scope="row">수정할 이미지</th>
						<td colspan="3" class="view_text">
						<input type="file" id="upload" name="upload">
						</td>
					</tr>

				</tbody>
			</table>

			<br>
			<input type="submit" id="edit" value="수정하기">
			<input type="button" id="list" value="목록으로"><br><br>
		</form>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {

				$("#title").select();

				$("#edit").on("click", function() {
					if ($("#title").val() == "") {
						alert("제목을 입력하세요");
						return false;
					}
				})

				$("#list").on("click", function() {
					location.href = "openBoardList";

				});


				/* $("#delete").on("click", function() {
					var frm = $("#frm")[0];
					console.log(frm);
					frm.action = "deleteBoard";
					frm.submit();

				}); */
				console.log("@@@@@@@")
			})
			console.log("@@@@@@@")
		</script>

	</div>
</body>
</html>