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
    <h2>�λ���� �ý���</h2><br>      
    <p>�λ����� �Է� <button onclick="location.href='insert'">�Է�</button></p>
    <p>�λ����� ��ȸ <button onclick="location.href='select'">��ȸ</button></p>
  </div>
</div>

</body>
</html>