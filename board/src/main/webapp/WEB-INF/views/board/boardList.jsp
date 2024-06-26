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
		<input type="hidden" value="${searchDto.page}"/>
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
				<c:if test="${ sessionScope.memberDto.memberemail eq 'admin'}">
				<col width="5%" />
				<col width="5%" />
				</c:if>
			</colgroup>
			<thead class="table-light">
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">작성일</th>
					<c:if test="${ sessionScope.memberDto.memberemail eq 'admin'}">
					<th scope="col">수정</th>
					<th scope="col">삭제</th>
					</c:if>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${fn:length(list)>0 }">
					<c:forEach items="${list}" var="lists">
						<tr>
							<th scope="row">${lists.boardIdx}</td>
							<td class="title"><a
								href="openBoardList2?boardIdx=${lists.boardIdx }">${lists.title }</a></td>
							<td>${lists.creatorId}</td>
							<td>${lists.hitCnt}</td>
							<td>${lists.createdDatetime }</td>
							<c:if test="${ sessionScope.memberDto.memberemail eq 'admin'}">
							<td><a href="openBoardDetail?boardIdx=${lists.boardIdx }">수정</a></td>
									<td><a href="deleteBoard?boardIdx=${lists.boardIdx }">삭제</a></td>
									</c:if>
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
                    <li class="page-item"><a class="page-link" href="openBoardList?page=${paging.page-1 }&type=${searchDto.type}&keyword=${searchDto.keyword}">&lt;</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="${paging.startPage }" end="${paging.endPage }"
                var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page }">
                         <li class="page-item active"><a class="page-link">${i}</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="openBoardList?page=${i}&type=${searchDto.type}&keyword=${searchDto.keyword}">${i}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
				<c:when test="${paging.page >= paging.maxPage }">
                    <li class="page-item"><a class="page-link">&gt;</a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="openBoardList?page=${paging.page+1 }&type=${searchDto.type}&keyword=${searchDto.keyword}">&gt;</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</body>
</html>