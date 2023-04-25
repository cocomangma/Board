<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/css/style.css">

<style type="text/css">
.a {
	position: relative;
	left: 750px;
}

.b {
	position: relative;
	right: -920px;
	border: none;
	padding: 10px 20px;
	border-radius: 50px;
	font-family: "paybooc-Light", sans-serif;
	font-weight: 600;
	transition: 0.25s;
	color: white;
	background-color: aqua;
}

.c {
	position: relative;
	left: 650px;
	top: 22px;
	font-size: 13px;
}

.d {
	margin-left: 430px;
}
</style>

</head>
<body>

	<div class="container">
		<h2 class="d">게시글 목록</h2>

		<div class="c">[ ${sessionScope.memberDto.memberemail } 님 안녕하세요.
			]</div>

		<a href="/member/logout" class="b">로그아웃</a><br> <br>

		<form action="openBoardList" method="get" id="search" class="search">
			<div class="a">
				<select name="type">
					<option>선택</option>
					<option value="title"
						<c:if test="${type eq 'title'}">selected</c:if>>제목</option>
				</select> <input type="text" placeholder="검색어를 입력하세요" name="keyword">
				<input type="submit" value="검색">
			</div>
		</form>
		<table class="board_list">

			<colgroup>
				<col width="15%" />
				<col width="*" />
				<col width="15%" />
				<col width="5%" />
				<col width="15%" />
			</colgroup>

			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>

			<c:choose>
				<c:when test="${fn:length(list)>0 }">
					<c:forEach items="${list}" var="lists">
						<tr>
							<td>${lists.boardIdx}</td>
							<td class="title"><a
								href="openBoardList2?boardIdx=${lists.boardIdx }&page=${paging.page}">${lists.title }</a></td>
							<td>${lists.creatorId}</td>
							<td>${lists.hitCnt}</td>
							<td><fmt:parseDate var="formattedDay"
									value="${lists.createdDatetime }" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate var="newformattedDay" value="${formattedDay }"
									pattern="yyyy-MM-dd HH:mm:ss" /> ${newformattedDay }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<th colspan="5"><br>
						<div style="font-size: 15px;">조회 가능한 게시글이 없습니다.</div> <br></th>
				</c:otherwise>
			</c:choose>
		</table>
		<a href="openBoardWrite" class="btn">글쓰기</a>
	</div>

	<div class="page_wrap">
		<div class="page_nation">

			<c:choose>
				<c:when test="${paging.page<=1 }">
					<a class="prev"><img src="../../resource/images/page_prev.png"></a>
				</c:when>

				<c:otherwise>
					<a href="openBoardList?page=${paging.page-1 }"><img
						src="../../resource/images/page_prev.png"></a>
				</c:otherwise>
			</c:choose>

			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="i" step="1">
				<c:choose>

					<c:when test="${i eq paging.page }">
						<a>${i}</a>
					</c:when>

					<c:otherwise>
						<a style="background-color: white;" href="openBoardList?page=${i}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>


			<c:choose>
				<c:when test="${paging.page >= paging.maxPage }">
					<a class="next"><img src="../../resource/images/page_next.png"></a>
				</c:when>

				<c:otherwise>
					<a href="openBoardList?page=${paging.page+1 }"><img
						src="../../resource/images/page_next.png"></a>
				</c:otherwise>
			</c:choose>

		</div>
	</div>

</body>
</html>