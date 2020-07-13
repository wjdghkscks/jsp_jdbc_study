<%@page import="com.ict.edu.VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	ArrayList<VO> list = DAO.getInstance().getList();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title> 전체 리스트 보기 </title>

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
	function back_go() {
		history.go(-1);
	}
</script>

</head>

<body>
	<div>
		<h1> 리스트 보기 </h1>
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
				<c:choose>
					<c:when test="${empty list}">
						<tr><td colspan="5"><p>자료가 존재하지 않습니다.</p></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}">
							<tr>
								<td>${k.idx}</td>
								<td>${k.m_id}</td>
								<td>${k.m_name}</td>
								<td>${k.m_age}</td>
								<td>${k.m_reg.substring(0, 10)}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<button onclick="back_go()">뒤로가기</button>					
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
</body>
</html>
