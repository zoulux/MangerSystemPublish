
<!DOCTYPE html>
<html lang="en" class="no-js">

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>密码修改失败</title>
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



</head>
<body>
	<div class="page-container" align="center">
		<h1>旧密码输入不正确</h1>

		<br /> <br /> <br /> <br /> <br /> <span>


			<h1>
				<span id="tiao">3</span>秒后自动返回
			</h1> </span>

		<script language=javascript>
			var tiao = document.getElementById("tiao").innerHTML;
			var seccond = parseInt(tiao);
			setInterval("redirect()", 1000); //每1秒钟调用redirect()方法一次
			function redirect() {

				if (seccond == 0) {
					location.href = "LoginServlet";
				} else {

					seccond--;
					document.getElementById("tiao").innerHTML = seccond;
				}
			}
		</script>
	</div>

	<!-- Javascript -->
	<script src="assets/js/jquery-1.8.2.min.js"></script>
	<script src="assets/js/supersized.3.2.7.min.js"></script>
	<script src="assets/js/supersized-init.js"></script>
	<script src="assets/js/scripts.js"></script>
</body>

</html>

