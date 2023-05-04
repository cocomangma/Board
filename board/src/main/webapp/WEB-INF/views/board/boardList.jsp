<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="container">
		<h2 class="text-center">게시글 목록</h2>
        <div class="d-flex justify-content-end align-items-baseline mb-5">
            <div class="fw-bold">${sessionScope.memberDto.memberemail } 님 안녕하세요.</div>
            <a href="/member/logout" class="btn btn-danger">로그아웃</a>
        </div>
		<form:form action="openBoardList" method="get" id="search" class="d-flex justify-content-between search" modelAttribute="searchDto">
		    <div class="col-auto">
		        <a href="openBoardWrite" class="btn btn-primary">글쓰기</a>
		    </div>
		    <div class="col-auto d-flex me-2">
                <div>
                    <form:select path="type" class="form-select">
                        <form:option value="all" label="선택"/>
                        <form:option value="title" label="제목"/>
                        <form:option value="creatorId" label="작성자"/>
                    </form:select>
                </div>
                <div>
                    <form:input path="keyword" class="form-control keyword" placeholder="검색어를 입력하세요"/>
                </div>
                <div>
                    <input type="submit" class="btn btn-Dark" value="검색">
                </div>
		    </div>
		</form:form>
		<table class="table">
			<colgroup>
				<col width="15%" />
				<col width="*" />
				<col width="15%" />
				<col width="10%" />
				<col width="15%" />
			</colgroup>
			<thead class="table-light">
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${fn:length(list)>0 }">
					<c:forEach items="${list}" var="lists">
						<tr>
							<th scope="row">${lists.boardIdx}</td>
							<td class="title"><a
								href="openBoardList2?boardIdx=${lists.boardIdx }&page=${paging.page}">${lists.title }</a></td>
							<td>${lists.creatorId}</td>
							<td>${lists.hitCnt}</td>
							<td>${lists.createdDatetime }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<th class="text-center" colspan="5">조회 가능한 게시글이 없습니다.</th>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
	</div>

    <div class="Page navigation">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1 }">
                    <li class="page-item"><a class="page-link">&lt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="openBoardList?page=${paging.page-1 }">&lt;</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
                var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page }">
                         <li class="page-item active"><a class="page-link">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="openBoardList?page=${i}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
				<c:when test="${paging.page >= paging.maxPage }">
                    <li class="page-item"><a class="page-link">&gt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="openBoardList?page=${paging.page+1 }">&gt;</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>