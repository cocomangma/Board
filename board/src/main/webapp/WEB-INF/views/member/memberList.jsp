<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style2.css">
 <style type="text/css">
table {
    border-top: 1px solid #444444;
    border-collapse: collapse;
    text-align: center;
  }
  
  th, td {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 8px;
  }
  
  th:first-child, td:first-child {
    border-left: none;
  }
  
  .out{
  
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 class="a">회원 리스트</h2><br>
<table>
  <tr>
    <th>번호</th>
    <th>이메일</th>
    <th>비밀번호</th>
    <th>이름</th>
    <th>전화번호</th>
    <th>수정</th>
    <th>삭제</th>
  </tr>
  <c:forEach items="${list }" var="member">
  <tr>
    <td>${member.memberidx}</td>
    <td>${member.memberemail}</td>
    <td>${member.memberpassword}</td>
    <td>${member.membername}</td>
    <td>${member.memberphone}</td>
    <td>
    <a href ="/member/memberUpdateDetail?memberidx=${member.memberidx }">수정</a>
    </td>
    <td>
    <a href ="/member/memberDelete?memberidx=${member.memberidx }">삭제</a>
    </td>
  </tr>
  </c:forEach>
</table>
    <br><br><a class="out" href="/member/adminPage">← 돌아가기</a>
</body>

</html>