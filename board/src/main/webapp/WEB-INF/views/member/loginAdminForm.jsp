<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style2.css">
<style type="text/css">
.a {
	margin-left: 250px;
	color: red;
}

.b {
	position: relative;
	left: 280px;
	top: 300px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div><h2 class="a">관리자 로그인</h2></div>
	<br>
	<form action="/member/loginAdmin" method="post" class="joinForm">
		<div class="textForm">
			<input type="text" name="memberemail" placeholder="이메일" class="email"
				id="email"><br>
		</div>
		<div class="textForm">
			<input type="password" name="memberpassword" placeholder="비밀번호"
				class="pw" id="pw">
		</div>
		<br>
		<input type="submit" value="로그인" class="btn" id="submit">
	</form>

</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

var msg = "${msg}";

if(msg!=""){
	
alert(msg);
	
}

	$(document).ready(function() {

		$('#email').focus();

		$('#submit').on("click", function() {
			if ($('#email').val() == "") {
				alert("이메일을 입력하세요")
				$('#email').focus();
				return false;
			}

			if ($('#pw').val() == "") {
				alert("비밀번호를 입력하세요")
				$('#pw').focus();
				return false;
			}

		})
	})
</script>
</html>