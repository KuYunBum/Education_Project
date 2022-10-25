<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:include page="/WEB-INF/view/include/header.jsp"/>

<style>
	body {
		background: #212529;
	}
	.container {
		margin-top: 150px;
		text-align: center;
		background: #212529;
	}
	.jumbotron {
		width: 500px;
		margin: auto;
		background: #212529;
	}
	.jumbotron h2, p, button {
		color: white;
	}
	button {
		background: #212529;
		border-color: white;
	}
</style>

<div class="container">
  <div class="jumbotron">
    <h2>인사관리 시스템</h2><br>      
    <p>인사정보 입력 <button onclick="location.href='insert'">입력</button></p>
    <p>인사정보 조회 <button onclick="location.href='select'">조회</button></p>
  </div>
</div>

</body>
</html>