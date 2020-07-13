<%@ page import="com.ict.edu.DAO"%>
<%@ page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	// 데이터 삭제를 위하여 session 에 저장된 primary key 를 호출하여 저장함
	VO vo = (VO)session.getAttribute("vo");
	
	int result = DAO.getInstance().getDelete(vo.getIdx());
	
	pageContext.setAttribute("result", result);
	
%>

	<c:choose>
		<c:when test="${result > 0}">
			<c:if test=""></c:if>
				<script>
					alert("회원 탈퇴가 완료되었습니다.");
					location.href="list.jsp";
				</script>
		</c:when>
	</c:choose>

