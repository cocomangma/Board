<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style2.css">
<style type="text/css">
.a {
	margin-left: 300px;
}

.b {
	position: relative;
	left: 280px;
	top: 350px;
}

.checkId {
	border: 1px solid #65b836;
	color: #fff;
	background: #55a532 linear-gradient(#91dd70, #55ae2e);
}

#pwsuccess, #pwfail, #emailtest, #pwtest, #nametest, #phonetest {
	font-size: 12px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	<br>

	<form action="/member/memberSave" method="post" class="joinForm">
		<input type="hidden" id="checkIdFalg" value="false" />
		<div class="textForm">
			<input type="text" name="memberemail" placeholder="이메일" class="email"
				id="email"> <br> <input type="button"
				onclick="checkId()" value="이메일 중복 체크" class="checkId">
		</div>
		<div class="textform" id="emailtest">이메일 형식으로 입력해주세요</div>

		<div class="textForm">
			<input type="password" name="memberpassword" placeholder="비밀번호"
				class="pw" id="pw"> <br>
		</div>

		<div class="textform" id="pwtest">6~12자리 사이로 입력하세요</div>

		<div class="textForm">
			<input type="password" name="memberrepassword" placeholder="비밀번호 확인"
				class="repw" id="repw"> <br>
		</div>

		<div id="pwsuccess" style="color: blue;">비밀번호가 일치합니다</div>
		<div id="pwfail" style="color: red;">비밀번호가 다릅니다.</div>

		<div class="textForm">
			<input type="text" name="membername" placeholder="이름" class="name"
				id="name"> <br>
		</div>

		<div class="textform" id="nametest">한글로 2~4자리로 입력하세요</div>

		<div class="textForm">
			<input type="text" name="memberphone"
				placeholder="전화번호 ( - 는 뺴고 번호만 입력하세요)" class="phone" id="phone">
			<br>
		</div>

		<div class="textform" id="phonetest">xxxx-xxxx-xxxx형식으로 입력하세요</div>

		<br> <input type="submit" value="회원가입" class="btn" id="submit">
		<br> <a class="out" href="/member/loginForm">← 돌아가기</a>
	</form>



</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function checkId() {

		var email = $('#email').val();
		$('#checkIdFalg').val("false");

		$.ajax({
			type : "post",
			url : "/member/checkId",
			data : {
				"memberemail" : email
			},
			datatype : 'json',
			success : function(result) {
				if (result > 0) {
					alert("이 아이디는 사용 불가능합니다.");
					$("#submit").attr("disabled", "disabled");
				} else {
					alert("이 아이디는 사용 가능합니다.");
					$('#checkIdFalg').val("true");
				}
			},
			error : function() {
				alert("아이디 중복 확인 ajax 실행 실패");
			}
		});

	}

	$(function() {
		$("#pwtest").hide();
		$("#pwsuccess").hide();
		$("#pwfail").hide();
		$("#emailtest").hide();
		$("#nametest").hide();
		$("#phonetest").hide();

		$('input')
				.keyup(
						function() {
							//유효성 검사 변수
							var pw = $('#pw').val();
							var repw = $('#repw').val();
							var email = $('#email').val();
							var name = $('#name').val();
							var phone = $('#phone').val();

							//정규식표현 변수

							var regexEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
							var regexPw = /^[A-Za-z0-9]{6,12}$/;
							var regexName = /^[가-힣]{2,4}$/
							var regexPhone = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/

							if (email != "") {

								if (regexEmail.test(email) == true) {
									$('#emailtest').hide();
									$("#submit").removeAttr("disabled");
								} else {
									$('#emailtest').show();
									$("#submit").attr("disabled", "disabled");
								}

							}

							if (pw != "") {

								if (regexPw.test(pw) == true) {
									$('#pwtest').hide();
									$("#submit").removeAttr("disabled");
								} else {
									$('#pwtest').show();
									$("#submit").attr("disabled", "disabled");
								}

							}

							if (pw != "" || repw != "") {
								if (pw == repw) {
									$('#pwsuccess').show();
									$("#pwfail").hide();
									$("#submit").removeAttr("disabled");
								} else {
									$('#pwsuccess').hide();
									$("#pwfail").show();
									$("#submit").attr("disabled", "disabled");

								}
							}

							if (name != "") {

								if (regexName.test(name) == true) {
									$('#nametest').hide();
									$("#submit").removeAttr("disabled");
								} else {
									$('#nametest').show();
									$("#submit").attr("disabled", "disabled");
								}

							}

							if (phone != "") {

								if (regexPhone.test(콜) == true) {
									$('#phonetest').hide();
									$("#submit").removeAttr("disabled");
								} else {
									$('#phonetest').show();
									$("#submit").attr("disabled", "disabled");
								}

							}

						})
	})

	$(document).ready(function() {

		$('#email').focus();

		$('#submit').on("click", function() {

			if ($('#email').val() == "") {
				alert("이메일을 입력하세요")
				$('#email').focus();
				return false;
			}

			if ($('#checkIdFalg').val() == "false") {
				alert("이메일 중복체크를 해주시기 바랍니다.");
				$('#email').focus();
				return false;
			}

			if ($('#pw').val() == "") {
				alert("비밀번호를 입력하세요")
				$('#pw').focus();
				return false;
			}

			if ($('#name').val() == "") {
				alert("이름을 입력하세요")
				$('#name').focus();
				return false;
			}

			if ($("#phone").val() == "") {
				alert("전화번호를 입력하세요")
				$("#phone").focus();
				return false;

			}

			alert('회원가입을 축하합니다.' + " " + $('#name').val() + '님')

		})

	})
</script>


</html>