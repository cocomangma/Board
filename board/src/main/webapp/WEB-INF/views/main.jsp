<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

body{
	
	bottom: 0;
	margin-top: 350px;
	
}

#menu {
	background-color: antiquewhite;
	height: 50;
}

#menu>ul {
	width: 430px;
	margin-left: auto;
	margin-right: auto;
}

#menu>ul>li {
	float: left;
	list-style: none;
	margin-top: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
}


#menu>ul>li>a {
	display: inline-block;
	background-color: tomato;
	height: 60px;
	width: 100px;
	border-radius: 5px;
	text-align: center;
	line-height: 60px;
	text-decoration: none;
	color: white;
	font-size: 15px;
	font-weight: bold;
}

.a{
	position: relative;
	left: 100px;

}

#menu>ul>li>a:hover {
	background-color: brown;
}
</style>
</head>
<body>
	<div id="menu">
		<ul>

			<li><a href="/member/loginForm">회원 로그인</a></li>  
			<li><a class="a" href="/member/loginAdminForm">관리자 로그인</a></li>

		</ul>

	</div>


</body>
</html>
















