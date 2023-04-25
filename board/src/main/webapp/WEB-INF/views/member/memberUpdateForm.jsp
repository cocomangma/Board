<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style2.css">
<meta charset="UTF-8">
<style type="text/css">

</style>
</head>
<body>

	<h2 style="margin-left: 270px;" class="a">회원정보수정</h2>
	<br>
	<form action="/member/memberUpdate" method="post" class="joinForm">
		<input name="memberidx" type="hidden" value="${mdto.memberidx}">
		<div class="textForm">
		<td>이메일</td>
			<input type="text" value="${mdto.memberemail}" id="email"
				name="memberemail" class="email">
		</div>
		<div class="textForm">
				<td>비밀번호</td>
				<input type="text" value="${mdto.memberpassword}" id="pw"
					name="memberpassword" class="pw">
		</div>
		<div class="textForm">
		<td>이름</td>
			<input type="text" value="${mdto.membername}" id="name"
				name="membername" class="name">
		</div>
		<div class="textForm">
		<td>전화번호</td>
			<input type="text" value="${mdto.memberphone}" id="phone"
				name="memberphone" class="phone">
		</div>
		<input type="submit" value="정보수정" class="btn" id="submit">
	</form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#email').select();

		$('#submit').on("click", function() {
			if ($('#email').val() == "") {
				alert("이메일을 입력하세요")
				$('#email').select();
				return false;
			}

			if ($('#pw').val() == "") {
				alert("비밀번호를 입력하세요")
				$('#pw').select();
				return false;
			}

			if ($('#name').val() == "") {
				alert("이름을 입력하세요")
				$('#name').select();
				return false;
			}
			if ($('#phone').val() == "") {
				alert("연락처를 입력하세요")
				$('#phone').select();
				return false;
			}
		})
	})
</script>
</html>