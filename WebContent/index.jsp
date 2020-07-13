<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title> index </title>

<style type="text/css">
	fieldset {
		width : 300px;
		margin: auto;
	}
	div {
		text-align: center;
		margin: 50px auto;
	}
</style>

<script type="text/javascript">
	function login_go(f) {
		f.action = "login.jsp";
		f.submit();
	}
	function join_go(f) {
		f.action = "join.jsp";
		f.submit();
	}
</script>

</head>

<body>

	<div>
		<form method="post">
			<fieldset>
			<%-- DB 컬럼 이름 = 파라미터 이름 = VO 변수 이름 --%>
				<legend> 로그인 </legend>
					<p> 아이디 : <input type="text" name="m_id"> </p>
					<p> 패스워드 : <input type="password" name="m_pw"> </p>
					<input type="button" value="로그인" onclick="login_go(this.form)"> &nbsp;
					<input type="button" value="회원가입" onclick="join_go(this.form)"> &nbsp;
			</fieldset>
		</form>
	</div>
	
</body>
</html>