<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title> 내 정보 수정 </title>

<style type="text/css">
	div {
		text-align: center;
		margin: 50px auto;
	}
	table {
		width: 600px;
		margin: 0px auto;
		border-collapse: collapse;
	}
	table, tr, th, td {
		border: 1px solid black;
		padding: 5px;
	}
	fieldset {
		width: 300px;
	}
</style>

<script type="text/javascript">
	function update_ok(f) {
		f.action = "update_ok.jsp";
		f.submit();
	}
	function back_go() {
		history.go(-1);
	}
</script>

</head>

<body>
	<div>
		<h1> 내 정보 수정 </h1>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${vo.idx}</td>
						<td>${vo.m_id}</td>
						<td> <input type="text" name="m_name" value="${vo.m_name}" size="10"> </td>
						<td> <input type="number" name="m_age" value="${vo.m_age}" size="5"> </td>
						<td>${vo.m_reg.substring(0,10)}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<input type="button" value="수정하기" onclick="update_ok(this.form)">
							<input type="button" value="뒤로가기" onclick="back_go()">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>