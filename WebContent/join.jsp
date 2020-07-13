<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title> join </title>

<style type="text/css">
	div {
		text-align: center;
		margin: 50px auto;
	}
	table {
		width: 500px;
		margin: 0px auto;
		border-collapse: collapse;
	}
	table, tr, th, td {
		border: 1px solid black;
	}
	fieldset {
		width: 300px;
	}
</style>

<script type="text/javascript">

	function join_ok(f) {
		
		// 유효성 검사 필요
		var m_id = f.m_id.value;
		if(m_id == "") {
			alert("아이디를 입력하세요.");
			f.m_id.value="";
			f.m_id.focus();
			return;
		}
		var m_pw = f.m_pw.value;
		if(m_pw == ""){
			alert("비밀번호를 입력하세요.");
			f.m_pw.value="";
			f.m_pw.focus();
			return;
		}
		var m_name = f.m_name.value;
		if(m_name == ""){
			alert("이름을 입력하세요.");
			f.m_name.value="";
			f.m_name.focus();
			return;
		}
		var m_age = f.m_age.value;
		if(m_age == ""){
			alert("나이를 입력하세요.");
			f.m_age.value="";
			f.m_age.focus();
			return;
		}
		
		f.action = "join_ok.jsp";
		f.submit();
	}
	
</script>

</head>

<body>
	<div>
		<form method="post">
			<fieldset>
				<legend> 회원가입 </legend>
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td> <input type="text" name="m_id" size="15"> </td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td> <input type="password" name="m_pw" size="15"> </td>
							</tr>
							<tr>
								<th>이름</th>
								<td> <input type="text" name="m_name" size="15"> </td>
							</tr>
							<tr>
								<th>나이</th>
								<td> <input type="number" name="m_age" size="15"> </td>
							</tr>
							<tr>
								<td colspan="2"> 
									<input type="button" value="회원가입" onclick="join_ok(this.form)">
									<input type="reset" value="취소">
								</td>
							</tr>
						</tbody>
					</table>
			</fieldset>
		</form>
</body>
</html>