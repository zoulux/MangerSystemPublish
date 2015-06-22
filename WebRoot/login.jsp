
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>学生管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- CSS -->
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/supersized.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

<script type="text/javascript">
function check() {
	if (postFrom.username.value == "") {
		alert("用户名不能为空");
		return false;
	}
	if (postFrom.password.value == "") {
		alert("密码不能为空");
		return false;
	}
	return true;
}


</script>


</head>
<body>
	<div class="page-container">
		<h1>Login</h1>
		<form action="./CheckUserServlet" method="post" onsubmit="return check()"
			name="postFrom">
			<input type="text" name="username" class="username"
				placeholder="Username"> <input type="password"
				name="password" class="password" placeholder="Password"> <span>
				<button type="submit">Login</button>
			</span> <span><button type="reset">Regist</button> </span>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>

	<!-- Javascript -->
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/supersized.3.2.7.min.js"></script>
	<script src="assets/js/supersized-init.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>

</html>

