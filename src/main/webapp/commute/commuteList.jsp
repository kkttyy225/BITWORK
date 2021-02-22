<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>근태 기간별 조회</title>
	<link rel="stylesheet" href="../css/normalize.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/board.css">
    <script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
    <style>
    ul {
    	list-style : none;
    	margin: 0;
    	padding: 0;
    	display: flex;
    }
    li {
    	padding: 0 10px;
    }
    </style>
</head>
<body>
	<jsp:include page="../commons/nav.jsp"/>
    <jsp:include page="../commons/aside.jsp"/>
    <main>
	    <h2>근태 현황 조회</h2>
	    <form action="list">
			<input type="date" id="startDay" name="startDay" value="${searchOption.start }">부터
			<input type="date" id="endDay" name="endDay" value="${searchOption.end }">까지
			<button type="submit">조회</button>
		</form>
	    <table border>
		    <thead>
		    	<tr>
					<th>근무일자</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>근태구분</th>
				</tr>
			</thead>
			<tbody id="tbody"> 
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.CDate}</td>
					<td>${list.onTime}</td>
					<td>${list.offTime}</td>
					<td>${list.status}</td>
				</tr>
			</c:forEach>		
			</tbody>
	    </table>
	    <ul>
	    	<li>
	    		<c:if test="${paging.nowBlock ne 1}">
		    		<c:set var="prev" value="href='list?nowPage=${paging.startPage - 1}'"/>
	    		</c:if>
	    		<a ${prev}>이전</a>
	    	</li>
	    <c:forEach var="page" begin="${paging.startPage}" end="${paging.endPage}">
	    	<li>
	    		<a href="list?startDay=${searchOption.start}&endDay=${searchOption.end}&nowPage=${page}">${page}</a>
	    	</li>
	    </c:forEach>
		    <li>
		    <c:if test="${paging.endPage ne paging.totalPage}">
		    	<c:set var="next" value="href='list?nowPage=${paging.endPage + 1}'"/>
		    </c:if>
	    		<a ${next}>다음</a>
	    	</li>	    	
	    </ul>
	</main>
</body>
</html>