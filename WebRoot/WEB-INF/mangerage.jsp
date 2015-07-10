<!DOCTYPE html>
<%@page import="com.zlx.tools.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@include file="../commons/taglibs.jsp"%>
<%@ page isELIgnored="false"%>

<html lang="zh-CN">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.zlx.selectsql.SelectFromSql"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>用户管理系统</title>

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/index.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/ihover.css" />

<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="assets/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function createVirtualForm(servlet, key, value) {
		var mForm = document.createElement("form");
		mForm.action = servlet;
		mForm.method = "post";
		mForm.style.display = "none";

		var txt = document.createElement("textarea");
		txt.name = key;
		txt.value = value;

		mForm.appendChild(txt);
		document.body.appendChild(mForm);
		mForm.submit();

	}

	function updateUser() {

		var mCheckBoxs = document.getElementsByName("checkbox");
		//

		var targetBox;
		for ( var i = 0; i < mCheckBoxs.length; i++) {
			if (mCheckBoxs[i].checked) {
				targetBox = mCheckBoxs[i];
				break;
			}

		}
		alert(targetBox.id);
		var tr = targetBox.parentNode.parentNode;
		var tds = tr.cells;
		var updateForm = document.forms["updateForm"];

		updateForm.sno.value = tds[1].innerHTML;
		updateForm.sname.value = tds[2].innerHTML;
		updateForm.sports.value = tds[3].innerHTML;
		updateForm.shufen.value = tds[4].innerHTML;
		updateForm.jiexi.value = tds[5].innerHTML;
		updateForm.gaodai.value = tds[6].innerHTML;
		updateForm.safe.value = tds[7].innerHTML;
		updateForm.english.value = tds[8].innerHTML;
		updateForm.englishNet.value = tds[9].innerHTML;
		updateForm.lishi.value = tds[10].innerHTML;
		updateForm.xingshi.value = tds[11].innerHTML;

		//	alert(targetId);
		//	createVirtualForm("UpdateUserServlet", "userId", targetId);

	}

	function checkpwd() {

		var oldpwd = updateAdminForm.oldpwd.value;
		var newpwd = updateAdminForm.newpwd.value;
		var newpwdagain = updateAdminForm.newpwdagain.value;

		//	alert(">>" + oldpwd + ">>" + newpwd + ">>>" + newpwdagain)
		if (oldpwd == "" || newpwd == "" || newpwdagain == "") {
			alert("请准确填写，不要留空哦！");
			return false;
		}
		if (newpwd != newpwdagain) {
			alert("两次新密码不一致请重新填写");
			return false;
		}
		return true;

	}

	function search() {

		var mSerach = document.getElementById("searchInput");
		var content = mSerach.value;

		createVirtualForm("selectUserServlet", "txt", content);

		// 		var mForm = document.createElement("form");
		// 		mForm.action = "./selectUserServlet";
		// 		mForm.method = "post";
		// 		mForm.style.display = "none";

		// 		var txt = document.createElement("textarea");
		// 		txt.name = "txt";
		// 		txt.value = content;

		// 		mForm.appendChild(txt);
		// 		document.body.appendChild(mForm);
		// 		mForm.submit();

	}

	function checkRow() {
		var mCheckBoxs = document.getElementsByName("checkbox");
		var a = 0;
		for ( var i = mCheckBoxs.length - 1; i >= 0; i--) {
			if (mCheckBoxs[i].checked) {
				a++;
			}
		}
		if (a == 1) {
			alert(a);
		} else {
			alert(a);
		}

	}

	function updateDeleteRow() {
		var mCheckBoxs = document.getElementsByName("checkbox");
		//var arr = new Array();
		var a = 0;
		for ( var i = mCheckBoxs.length - 1; i >= 0; i--) {
			if (mCheckBoxs[i].checked) {
				//	arr.push(mCheckBoxs[i].id);
				a++;
			}
		}
		//	alert("" + a);
		var mButton = document.getElementById("deleteRow");
		mButton.innerHTML = "删&nbsp;除" + a + "&nbsp;行";
	}

	function checkAllChange() {

		var mCheckBox = document.getElementById("checkAll");
		var mCheckBoxs = document.getElementsByName("checkbox");
		if (mCheckBox.checked) {
			for ( var i = 0; i < mCheckBoxs.length; i++) {
				//alert(mCheckBoxs[i].id);
				mCheckBoxs[i].checked = true;
			}
		} else {
			for ( var i = 0; i < mCheckBoxs.length; i++) {
				mCheckBoxs[i].checked = false;
			}
		}

		updateDeleteRow();
	}

	function submitAdd() {
		var mForm = document.getElementById("addForm");
		if (mForm.onsubmit())
			mForm.submit();
	}

	function submitUpdate() {
		var mForm = document.getElementById("updateForm");
		if (mForm.onsubmit())
			mForm.submit();

	}

	function deleteStus() {
		var mCheckBoxs = document.getElementsByName("checkbox");
		var arr = new Array();

		for ( var i = mCheckBoxs.length - 1; i >= 0; i--) {
			if (mCheckBoxs[i].checked) {
				arr.push(mCheckBoxs[i].id);
			}
		}

		var tip = window.confirm("真的要删除这" + arr.length + "项吗？")
		if (tip == 1) {
			var mForm = document.createElement("form");
			mForm.action = "./DeleteUserServlet";
			mForm.method = "post";
			mForm.style.display = "none";

			var txt = document.createElement("textarea");
			txt.name = "txt";
			txt.value = arr;

			mForm.appendChild(txt);
			document.body.appendChild(mForm);
			mForm.submit();

			//	alert("删掉了"+arr);
		} else {
			//	alert("算了吧");

		}
	}

	function checkStu() {

		if (addForm.sno.value == "") {
			alert("学号不能为空");
			return false;
		}
		if (isNaN(addForm.sno.value)) {
			alert("学号不合法");
			return false;

		}

		if (addForm.sname.value == "") {
			alert("姓名不能为空");
			return false;
		}
		var re = /[^\u4e00-\u9fa5]/;
		if (re.test(addForm.sname.value)) {
			alert("姓名不合法");
			return false;

		}

		if (addForm.sports.value == "") {
			alert("体育成绩不能为空")
			return false;
		}
		if (isNaN(addForm.sports.value)) {
			alert("体育成绩不合法")
			return false;

		}

		if (addForm.shufen.value == "") {
			alert("数分成绩不能为空")
			return false;
		}
		if (isNaN(addForm.shufen.value)) {
			alert("数分成绩不合法")
			return false;
		}

		if (addForm.jiexi.value == "") {
			alert("解析几何成绩不能为空")
			return false;
		}
		if (isNaN(addForm.jiexi.value)) {
			alert("解析几何成绩不合法")
			return false;
		}

		if (addForm.gaodai.value == "") {
			alert("高代成绩不能为空")
			return false;
		}
		if (isNaN(addForm.gaodai.value)) {
			alert("高代成绩不合法")
			return false;
		}

		if (addForm.safe.value == "") {
			alert("安全教育成绩不能为空")
			return false;
		}
		if (isNaN(addForm.safe.value)) {
			alert("安全教育成绩不合法")
			return false;
		}

		if (addForm.english.value == "") {
			alert("英语成绩不能为空")
			return false;
		}
		if (isNaN(addForm.english.value)) {
			alert("英语成绩不合法")
			return false;
		}

		if (addForm.englishNet.value == "") {
			alert("网络实训成绩不能为空")
			return false;
		}
		if (isNaN(addForm.englishNet.value)) {
			alert("网络实训成绩不合法")
			return false;
		}

		if (addForm.lishi.value == "") {
			alert("近代史不能为空")
			return false;
		}
		if (isNaN(addForm.lishi.value)) {
			alert("近代史成绩不合法")
			return false;
		}

		if (addForm.xingshi.value == "") {
			alert("形势政策成绩不能为空")
			return false;
		}
		if (isNaN(addForm.xingshi.value)) {
			alert("形势政策成绩不合法")
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	/* $(document).ready(function() {
		alert(">>");
		$("#search").html("sdfsdfsd");
		$("#sportxx").html('xx');
	}); */
</script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
#flash {
	width: 240px;
	height: 180px;
	margin: 0 auto;
}
</style>
</head>

<body>

	<div class="container-fluid">
		<div class="row" id="row1">
			<div class="col-md-4" id="div1">
				<img src="assets/img/logo.png" id="img1" /> <a
					href="./SelectServlet" id="logo">Student Manage System</a>
			</div>
			<div class="col-md-5"></div>
			<div class="col-md-3" id="div2">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search for..."
						id="searchInput"> <span class="input-group-btn">
						<button class="btn btn-default" type="button" onclick="search()"
							id="search">Go</button> </span>
				</div>
			</div>
		</div>
		<div class="row" id="row2">
			<div class="col-md-3" id="div3">
				<div class="ih-item circle effect10 bottom_to_top" id="div4">
					<a href="LoginServlet">
						<div class="img">
							<img src="assets/img/3.jpg" alt="img">
						</div>
						<div class="info">
							<h3>管理员</h3>
							<p>点 击 退 出</p>
						</div> </a>
				</div>
				<div id="div5">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target=".bs-example-modal-sm3">修改密码</button>
				</div>

				<div id="flash">
					<object type="application/x-shockwave-flash" style="outline: none;"
						data="http://cdn.abowman.com/widgets/hamster/hamster.swf?up_foodColor=cba920&up_wheelCenterColor=E4EB2F&up_bodyColor=E6DEBE&up_eyeColor=000000&up_snoutColor=F7F4E9&up_feetColor=D4C898&up_wheelColor=FFFFFF&up_waterColor=E0EFFF&up_wheelSpokeColor=DEDEDE&up_earColor=D4C898&up_bgColor=E8E8E8&up_wheelOuterColor=FF4D4D&up_tailColor=E6DEBE&"
						width="240" height="180">
						<param name="movie"
							value="http://cdn.abowman.com/widgets/hamster/hamster.swf?up_foodColor=cba920&up_wheelCenterColor=E4EB2F&up_bodyColor=E6DEBE&up_eyeColor=000000&up_snoutColor=F7F4E9&up_feetColor=D4C898&up_wheelColor=FFFFFF&up_waterColor=E0EFFF&up_wheelSpokeColor=DEDEDE&up_earColor=D4C898&up_bgColor=E8E8E8&up_wheelOuterColor=FF4D4D&up_tailColor=E6DEBE&"></param>
						<param name="AllowScriptAccess" value="always"></param>
						<param name="wmode" value="opaque"></param>
					</object>
				</div>


				<div id="div6">
					<p>Copyright&copy;2015</p>
					<p>zouluxin 版权所有 违者必究</p>
				</div>
			</div>
			<div class="col-md-9">
				<div id="div7">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target=".bs-example-modal-sm1">添&nbsp;加</button>

					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target=".bs-example-modal-sm" title="一次只能选择修改一行"
						onclick="updateUser()">修&nbsp;改</button>

					<button type="button" class="btn btn-default" id="deleteRow"
						onclick="deleteStus()">删&nbsp;除0&nbsp;行</button>
				</div>
				<div class="col-md-9" id="div8">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td><input type="checkbox" value="" id="checkAll"
									onchange="checkAllChange()"></td>
								<td>学号</td>
								<td>姓名</td>
								<td>体育</td>
								<td>数学分析</td>
								<td>解析几何</td>
								<td>高等代数</td>
								<td>安全教育</td>
								<td>大学英语</td>
								<td>网络实训</td>
								<td>近代史</td>
								<td>形势政策</td>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${List}" var="list">
								<tr>

									<td><input type="checkbox" name="checkbox"
										id=${list.sno
										} onclick="updateDeleteRow()">
									</td>
									<td>${list.sno}</td>
									<td>${list.sname}</td>
									<td>${list.sports}</td>
									<td>${list.shufen}</td>
									<td>${list.jiexi}</td>
									<td>${list.gaodai}</td>
									<td>${list.safe}</td>
									<td>${list.english}</td>
									<td>${list.englishNet}</td>
									<td>${list.lishi}</td>
									<td>${list.xingshi}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!--修改弹窗-->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">修改成绩</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<form class="form-horizontal" name="updateForm"
									action="UpdateUserServlet">
									<div class="form-group">
										<label class="col-sm-5 control-label">学号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" readonly="readonly"
												name="sno" id="sno">
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-5 control-label">学生姓名</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" readonly="readonly"
												name="sname" id="sname">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">体育</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="sports" name="sports">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">数学分析</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="shufen" name='shufen'>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">解析几何</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="jiexi" name="jiexi">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">高等代数</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="gaodai" name="gaodai">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">安全教育</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="safe" name="safe">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">大学英语</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="english" name="english">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">网络实训</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="englishNet" name="englishNet">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">近代史</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="lishi" name="lishi">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">形势政策</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="数值"
												id="xingshi" name="xingshi">
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">Save
											changes</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!--
			添加弹窗
		-->

	<div class="modal fade bs-example-modal-sm1" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">增加成员</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<form class="form-horizontal" action="./AddUserServlet"
									name="addForm" id="addForm" onsubmit="return checkStu()"
									method="post">
									<div class="form-group">
										<label class="col-sm-5 control-label">学号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="学号"
												name="sno">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">姓名</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="姓名"
												name="sname">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">体育</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="sports">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">数学分析</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="shufen">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">解析几何</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="jiexi">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">高等代数</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="gaodai">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">安全教育</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="safe">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">大学英语</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="english">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">网络实训</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="englishNet">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">近代史</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="lishi">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">形势政策</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="分数"
												name="xingshi">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="submitAdd()">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>

	<!--=更改密码弹窗-->
	<div class="modal fade bs-example-modal-sm3" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">修改密码</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-12">
								<form class="form-horizontal" action="UpdateAdminServlet"
									method="post" onsubmit="return checkpwd()"
									name="updateAdminForm">
									<div class="form-group">
										<label class="col-sm-5 control-label">旧密码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="输入旧密码"
												id="oldpwd" name="oldpwd">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">新密码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="输入新密码"
												id="newpwd" name="newpwd">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-5 control-label">重复密码</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="重复新密码"
												id="newpwdagain" name="newpwdagain">
										</div>
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="submit" class="btn btn-primary">保存</button>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>