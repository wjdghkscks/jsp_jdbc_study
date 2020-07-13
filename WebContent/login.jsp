<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 	request.setCharacterEncoding("UTF-8"); 
	String m_id = request.getParameter("m_id");
	String m_pw = request.getParameter("m_pw");
	
	/* 메소드 호출 */
	
		// vo 불러오기
		VO vo = DAO.getInstance().getLogin(m_id, m_pw);
	
		// 로그인 정보는 보통 session에 저장
		// 4대 저장소에 저장한 이후 비로소 EL, JSTL 사용이 가능
		session.setAttribute("vo", vo);
	
%>

<c:choose>
	<c:when test = "${empty vo}" >
		<script>
			alert("로그인 실패");
			location.href="index.jsp";
		</script>
	</c:when>
	
	<c:otherwise>
		<!-- 1) <script> 2) forward 3) redirect -->
		<!-- 메시지 표시 O : 1   ///   X : 2, 3 -->
		
		<script>
			alert("로그인 성공");
			location.href="onelist.jsp";
		</script>
		
	</c:otherwise>
	
</c:choose>

