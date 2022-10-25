<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
    
<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<link rel="stylesheet" href="/css/select.css">

	<div class="container_1">
		<form action="select" method="post">
			<label class="label1" for="sabun">사번 </label> 
			<input type="text" class="form-input1" id="sabun" name="sabun" value="${pageMaker.sabun}"> 
			<label class="label1" for="name">사원명 </label> 
			<input type="text" class="form-input1" id="name" name="name" value="${pageMaker.name}">
			<label class="label1" for="join_gbn_code">입사구분 </label> 
			<select class="form-input1" name="join_gbn_code" id="join_gbn_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '101' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="put_yn">투입여부 </label> 
			<select class="form-input1" name="put_yn" id="put_yn">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '103' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>				
			</select> 
			<label class="label1"for="pos_gbn_code">직위 </label> 
		    <select class="form-input1" name="pos_gbn_code" id="pos_gbn_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '107' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1" for="join_day">입사일 </label> 
			<input type="text" style="width: 215px;" id="join_day" name="join_day" value="${pageMaker.join_day}">
			<label class="label1" for="retire_day">퇴사일 </label> 
			<input type="text" style="width: 215px;" id="retire_day" name="retire_day" value="${pageMaker.retire_day}">
			<label class="label1" for="job_type">직종 </label> 
			<select class="form-input1" name="job_type" id="job_type">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '106' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>
			<div align="right">
				<button type="button" class="btn" id="searchBtn">검색</button>
				<button type="button" class="btn" onclick="sabun_delete();">삭제</button>
				<button type="button" class="btn" id="reset">초기화</button>
				<button type="button" class="btn" onclick="location.href='/'">뒤로</button>
			</div>			
		</form><br>
		
		<table border="1" style="width: 100%;" >
			<tr style="text-align: center;">
				<th style="width: 30px;"><input type="checkbox" id="allCheck" name="allCheck"></th>
				<th style="width: 80px;">사번</th>
				<th style="width: 120px;">성명</th>
				<th style="width: 180px;">주민번호</th>
				<th style="width: 180px;">휴대폰번호</th>
				<th style="width: 120px;">직위</th>
				<th style="width: 120px;">입사일</th>
				<th style="width: 120px;">퇴사일</th>
				<th style="width: 120px;">투입여부</th>
				<th style="width: 120px;">연봉(만원)</th>
			</tr>
			<c:if test="${empty list}">
				<tr><td colspan="10">검색 결과가 없습니다.</td></tr>
			</c:if>
			<c:forEach var="test" items="${list}">
				<tr>
					<td><input type="checkbox" value="${test.sabun }" name="rowCheck"></td>
					<td><a href="update?sabun=${test.sabun }">${test.sabun }</a></td>
					<td>${test.name }</td>
					<td>${test.reg_no }</td>
					<td>${test.phone }</td>
					<td>${test.pos_gbn_code }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${test.join_day }"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${test.retire_day }"/></td>
					<td>${test.put_yn }</td>
					<c:choose>
						<c:when test="${test.salary eq '0'}">
							<td></td>
						</c:when>
						<c:otherwise>					
							<td>${test.salary }</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<div style="text-align: center;">
			<div class="pagination"><!-- 게시판 갯수 -->
			    	<c:if test="${pageMaker.page !=0}">
			    		<a href='select${pageMaker.makeSearch(1)}'>&laquo;</a>
			    	</c:if>
			    	<c:if test="${pageMaker.prev }">
			    		<a href='select${pageMaker.makeSearch(pageMaker.startPage-1)}'>&lt;</a>
			    	</c:if>
			    	
			    	<c:forEach begin="${pageMaker.startPage }" end="${ pageMaker.endPage}" var="idx">
			    		<a href='select${pageMaker.makeSearch(idx)}' 
			    		 <c:out value="${pageMaker.page==idx?' class=active ':'' }"/> >
			    		 ${idx}</a>
			    	</c:forEach>
			    	
			    	<c:if test="${pageMaker.next }">
			    		<a href='select${pageMaker.makeSearch(pageMaker.endPage+1)}'>&gt;</a>
			    		
			    	</c:if>
			    	
			    	
			    	<c:if test="${pageMaker.page != pageMaker.totalEndPage}">
			    		<a href='select${pageMaker.makeSearch(pageMaker.totalEndPage)}'>&raquo;</a>
			    	</c:if>
			    </div>
		    </div>
	</div>
	
	<script>
		$('#searchBtn').on("click",function(event){
			  
			  self.location="select"+'${pageMaker.makePage(1)}'
			  +"&sabun="+$('#sabun').val()+"&name="+$('#name').val()+"&join_gbn_code="+$('#join_gbn_code').val()+"&put_yn="+$('#put_yn').val()
			  +"&pos_gbn_code="+$('#pos_gbn_code').val()+"&join_day="+$('#join_day').val()+"&retire_day="+$('#retire_day').val()+"&job_type="+$('#job_type').val();
			  
		});
	</script>
	<script type="text/javascript" src="js/select.js"></script>
</body>
</html>