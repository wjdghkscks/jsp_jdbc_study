<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String m_name = request.getParameter("m_name");
	String m_age = request.getParameter("m_age");
	
	// 수정하려는 데이터의 Primary Key 값을 가져옴
	VO vo = (VO)session.getAttribute("vo");
	String idx = vo.getIdx();
	
	int result = DAO.getInstance().getUpdate(m_name, m_age, idx);
	
	pageContext.setAttribute("result", result);
	
	// 기존 session 정보 업데이트하기 (덮어쓰기)
	vo.setM_name(m_name);
	vo.setM_age(m_age);
	session.setAttribute("vo", vo);

%>

<c:choose>
	<c:when test="${result > 0}">
		<script>
			alert("데이터가 성공적으로 수정되었습니다.");
			location.href = "onelist.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("데이터 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>