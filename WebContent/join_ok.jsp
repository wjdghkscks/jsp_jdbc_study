<%@ page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	String m_name = request.getParameter("m_name");
	String m_age = request.getParameter("m_age");
	
	int result = DAO.getInstance().getInsert(m_id, m_pw, m_name, m_age);
	
	pageContext.setAttribute("result", result);
	
%>

<c:choose>

	<c:when test="${result > 0}">
		<script>
			alert("회원가입이 완료되었습니다.");
			location.href="index.jsp";
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("회원 가입 실패. 입력 정보를 다시 확인하세요.");
			location.href="join.jsp";
		</script>
	</c:otherwise>
	
</c:choose>
