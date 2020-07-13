<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<h1> 개인 회원 정보 </h1>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.m_id}</td>
				<td>${vo.m_pw}</td>
				<td>${vo.m_name}</td>
				<td>${vo.m_age}</td>
				<td>${vo.m_reg.substring(0,10)}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">
					<button onclick="">전체 리스트 보기</button>
					<button onclick="">내 정보 수정</button>
					<button onclick="">회원탈퇴</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>
