<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>${ORDER_SYS_NAME}</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/main.css" rel="stylesheet">
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	function changecode() {
		document.getElementById("code").src = "savecode.order?time=" + Math.random();
	}

	function check() {

		var code = document.getElementById("codeInput");
		var userCode = code.value;
		var url = "checkcode.order?code=" + userCode + "&time=" + Math.random();

		txtAjaxRequest(url, "get", true, null, checkCallBack, null, null);

	}
	function checkCallBack(txt, obj) {

		var result = document.getElementById("codeResult");
		var go = document.getElementById("goBtu");
		result.style.display = "inline-block";
		if (txt == "OK") {
			result.src = "img/ok.png";

			go.disabled = false;
		} else {
			result.src = "img/fail.png";
			go.disabled = "disabled";
		}

	}

	function getVerifyCode(){
		var url = "getVerifyCode.order?time=" + Math.random();

		txtAjaxRequest(url, "get", true, null, null, null, null);

	}
	function changeLogin(){
		var userId = document.getElementById("userID");
		var userPssword = document.getElementById("passwordID");
		var verifyCode = document.getElementById("verifyCodeID");

		// verifyCode.style.display="none";
		userId.innerHTML=""
		userPssword.innerHTML=""
		verifyCode.innerHTML=""
		var newUserId = '<label>?????????:</label> <input type="text" class="form-control"\n' +
				'\t\t\t\t\tname="userAccount" value="${USER_INFO.userAccount }" placeholder="????????????????????????" required autofocus >';
		userId.innerHTML=newUserId;

		var newUserPassword = '<div id="passwordID" class="form-group login-text" style="text-align: left;">\n' +
				'\t\t\t\t<label>?????????:</label> <input type="password"\n' +
				'\t\t\t\t\tclass="form-control" name="userPass" value="${USER_INFO.userPass }" placeholder="????????????????????????" required >';
        var newVerifyCode = '<label>?????????:&nbsp;</label><input class="form-control login-inputcode"\n' +
				'\t\t\t\t\ttype="text" name="codetext" onblur="check()" id="codeInput" />&nbsp;&nbsp;&nbsp;<button type="button" onclick="getVerifyCode()"> ???????????????</button> '
		userPssword.innerHTML=newUserPassword;
		verifyCode.innerHTML = newVerifyCode;
		// document.getElementById("codeBtu").hidden


	}
</script>


</head>

<body class="login-body">

	<div class="panel login-panel">
		<form role="form" method="post" action="login.order">
			<h2 class="text-center">??????????????????</h2>
			<c:if test="${not empty ERROR_MSG}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
					${ERROR_MSG}
				</div>
			</c:if>
			<div id="userID" class="form-group login-text" style="text-align: left;">
				<label>?????????:</label> <input type="text" class="form-control"
					name="userAccount" value="${USER_INFO.userAccount }" placeholder="????????????????????????" required autofocus >
			</div>
			<div id="passwordID"  class="form-group login-text" style="text-align: left;">
				<label>???&nbsp;&nbsp;???:</label> <input type="password"
					class="form-control" name="userPass" value="${USER_INFO.userPass }" placeholder="?????????????????????" required >
			</div>

			<div id="verifyCodeID" class="form-group login-text" style="text-align: left;">
				<label>?????????:&nbsp;</label><input class="form-control login-inputcode"
					type="text" name="codetext" onblur="check()" id="codeInput" />&nbsp;&nbsp;&nbsp;<img
					id="code" src="savecode.order" onclick="changecode()"
					style="width:100px;height:30px;">&nbsp;<img alt="" src=""
					id="codeResult" style="width: 30px;height: 30px;display: none">
			</div>

			<button class="btn btn-lg btn-primary btn-block login-text"
				disabled="disabled" id="goBtu" type="submit">??????</button>
<%--			<button class="btn btn-lg btn-primary btn-block login-text"--%>
<%--					id="codeBtu" type="button" onclick="changeLogin()">???????????????</button>--%>
			<a href="${pageContext.request.contextPath}/pages/loginCode.jsp"><button class="btn btn-lg btn-primary btn-block login-text"
					   id="codeBtu" type="button">???????????????</button></a>

		</form>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="bootstrap/js/jquery-1.11.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.js"></script>
</body>
</html>
