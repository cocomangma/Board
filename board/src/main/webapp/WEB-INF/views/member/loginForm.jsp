<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style2.css">
<style type="text/css">
.a {
	margin-left: 270px;
}

.b {
	position: relative;
	left: 300px;
	top: 300px;
}

#kakao {
	position: relative;
	left: 190px;
	top: 260px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h2 class="a">회원 로그인</h2>
	</div>
	<br>
	<form action="login" method="post" class="joinForm">
		<div class="textForm">
			<input type="text" name="memberemail" placeholder="이메일" class="email"
				id="email"><br>
		</div>
		<div class="textForm">
			<input type="password" name="memberpassword" placeholder="비밀번호"
				class="pw" id="pw">
		</div>
		<br> <input type="submit" value="로그인" class="btn" id="submit">


	</form>
	<br>
	<br>
	<div>
		<button id="kakao">
			<img
				src="${pageContext.request.contextPath}/resource/images/kakaoImage.png">
		</button>
	</div>
	<div>
		<a class="b btn"  href="/member/memberSaveForm">회원가입</a>
	</div>
	<input type="button" onclick="kakaoLogout()" value="카카오 로그아웃">

</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
	function moveBoard() {
		location.href = "/board/openBoardList";
	}

	Kakao.init('94582037f7b661f1d64a734a1f4b6700');
	$("#kakao").on("click", function() {
		//1. 로그인 시도
		Kakao.Auth.login({
			success : function(authObj) {

				//2. 로그인 성공시, API 호출
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						console.log("성공:" + res);
						var id = res.id;
						scope: 'account_email';
						alert('로그인성공');
						moveBoard();
					}
				})
				console.log(authObj);
				var token = authObj.access_token;
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});

	}) //

	function kakaoLogout(kakaoKey) {
	    Kakao.init('94582037f7b661f1d64a734a1f4b6700'); // 초기화
	    Kakao.isInitialized();

	    if (!Kakao.Auth.getAccessToken()) { // 토큰이 있는지 확인 (토큰 가져와보기)
	      console.log('Not logged in.');
	      return;
	    }

	    Kakao.Auth.logout(function() { // 카카오 로그아웃
	      console.log(Kakao.Auth.getAccessToken());
	    });
	  };

	var msg = "${msg}";

	if (msg != "") {

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