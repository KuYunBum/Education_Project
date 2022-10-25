<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<link rel="stylesheet" href="/css/join.css">

	<div class="container_1">
		<form action="" method="post" onsubmit="return update_summit()" enctype="multipart/form-data">
			<div align="right">
				<button type="submit" class="btn" >수정</button>
				<button type="button" class="btn" onclick="deleteSabun();">삭제</button>
				<button  type="button" class="btn" onclick="location.href='/'">뒤로</button>
			</div><br>
			<div class="img_box">
				<!--증명사진 profile-->
				<div class="img_box_img preview-image">
					<img class="images" alt="" style="width:100%; margin-top:10px;" src="/resources/upload/${insaDto.profile_image }">
					<input type="text" style="display:none;" id="profile2" value="${insaDto.profile_image }"> 
				</div>
				<label for="img_btn" id="img_label">사진등록</label><br>
				<input type="file" style="display:none;" id="img_btn" name="profile_image1">
				<input type="hidden" name="profile_image2" value="${insaDto.profile_image }">
			</div>			
			<label class="label1" for="sabun">*사번 </label> 
			<input type="text" style="width: 250px; background: aqua;" id="sabun" readonly="readonly" dir="rtl" value="${insaDto.sabun }"> 
			<label class="label1" for="name">*한글성명 </label> 
			<input type="text" class="form-input1" id="name" name="name" value="${insaDto.name }">
			<label class="label1" for="eng_name">영문성명 </label> 
			<input type="text" class="form-input2" id="eng_name" name="eng_name" value="${insaDto.eng_name }"><br> 
			<label class="label1" for="id">*아이디 </label> 
			<input type="text" class="form-input1" id="id" name="id" value="${insaDto.id }" readonly="readonly">
			<label class="label1" for="pwd">*비밀번호 </label> 
			<input type="password" class="form-input1" id="pwd" name="pwd" value="${insaDto.pwd }" autocomplete="off">
			<label class="label1"for="pwdCheck">*비밀번호 확인 </label> 
			<input type="password" class="form-input2" id="pwdCheck" value="${insaDto.pwd }" autocomplete="off"><br>
			<label class="label1"for="phone">전화번호 </label> 
			<input type="text" class="form-input1" id="phone" name="phone" maxlength="13" value="${insaDto.phone }"> 
			<label class="label1" for="hp">*휴대폰번호 </label> 
			<input type="text" class="form-input1" id="hp" name="hp" maxlength="13" value="${insaDto.hp }">
			<label class="label1"for="hidden_reg_no">*주민번호 </label> 
			<input type="text" class="form-input2" id="hidden_reg_no" maxlength="13" value="${insaDto.reg_no }"><br>
			<input type="hidden" id="reg_no" name="reg_no">
			<input type="hidden" id="email" name="email" value="${insaDto.email }">
			<label class="label1" for="email">*이메일 </label> 
			<input type="text" class="form-input3" id="email1" name="email1" > 
			@<input type="text" class="form-input3" id="i_domain">
			<select class="form-input3" name="domain" id="s_domain">
				<option value="none" selected="selected">선택</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="selfInput">직접입력</option>
			</select>
			<label class="label2" for="job_type">직종 </label> 
			<select class="form-input1" name="job_type" id="job_type">
				<option value="${insaDto.job_type }" selected="selected">${insaDto.job_type }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '106' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>
			<label class="label2" for="years">연령 </label> 
			<input type="text" class="form-input3" id="years" name="years" value="${insaDto.years }" readonly="readonly" placeholder="(자동생성)">
			<label class="label2" for="sex">성별 </label>
			<select class="form-input3" name="sex" id="sex" >
				<option value="${insaDto.sex }" selected="selected">${insaDto.sex }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '102' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select><br>
			<label class="label1" for="zip2">주소 </label>
			<c:choose>
				<c:when test="${insaDto.zip eq '0' }">
					<input type="text" style="width: 165px;" id="zip2" readonly="readonly" placeholder="우편번호" >
				</c:when>
				<c:otherwise>
					<input type="text" style="width: 165px;" id="zip2" value="${insaDto.zip}" readonly="readonly">
				</c:otherwise>
			</c:choose>
			<input type="hidden" id="zip" name="zip">			
			<button type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
			<input type="text" style="width: 375px;" placeholder="주소" id="addr1" name="addr1" value="${insaDto.addr1 }">
			<input type="text" style="width: 305px;" placeholder="세부주소" id="addr2" name="addr2" value="${insaDto.addr2 }"><br>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			<label class="label1"for="pos_gbn_code">직위 </label> 
		    <select class="form-input1" name="pos_gbn_code" id="pos_gbn_code" >
				<option value="${insaDto.pos_gbn_code }" selected="selected">${insaDto.pos_gbn_code }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '107' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1" for="dept_code">부서 </label> 
			<select class="form-input1" name="dept_code" id="dept_code" >
				<option value="${insaDto.dept_code }" selected="selected">${insaDto.dept_code }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '105' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1"for="salary2" >연봉 </label> 
			<c:choose>
				<c:when test="${insaDto.salary eq '0' }">
					<input type="text" class="form-input2" id="salary2" dir="rtl" value="" placeholder="(만원)"><br>
				</c:when>
				<c:otherwise>
					<input type="text" class="form-input2" id="salary2" dir="rtl" value="${insaDto.salary }"><br>
				</c:otherwise>
			</c:choose>
			<input type="hidden" id="salary" name="salary">
			<label class="label1" for="join_gbn_code">입사구분 </label> 
			<select class="form-input1" name="join_gbn_code" id="join_gbn_code" >
				<option value="${insaDto.join_gbn_code }" selected="selected">${insaDto.join_gbn_code }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '101' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="gart_level">최종학력 </label> 
			<select class="form-input1" name="gart_level" id="gart_level" >
				<option value="${insaDto.gart_level }" selected="selected">${insaDto.gart_level }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '112' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="put_yn">투입여부 </label> 
			<select class="form-input1" name="put_yn" id="put_yn" >
				<option value="${insaDto.put_yn }" selected="selected">${insaDto.put_yn }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '103' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1" for="mil_yn">군필여부 </label> 
			<select class="form-input2" name="mil_yn" id="mil_yn" >
				<option value="${insaDto.mil_yn }" selected="selected">${insaDto.mil_yn }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '104' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select><br>  
			<label class="label1" for="mil_type">군별 </label> 
			<select class="form-input1" name="mil_type" id="mil_type" >
				<option value="${insaDto.mil_type }" selected="selected">${insaDto.mil_type }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '108' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="mil_level">계급 </label> 
			<select class="form-input1" name="mil_level" id="mil_level" >
				<option value="${insaDto.mil_level }" selected="selected">${insaDto.mil_level }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '109' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1" for="mil_startDate">입영일 </label> 
			<input type="text" style="width: 200px;" id="mil_startDate" name="mil_startDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${insaDto.mil_startDate }'/>">
			<label class="label1" for="mil_endDate">전역일 </label> 
			<input type="text" style="width: 200px;" id="mil_endDate" name="mil_endDate" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${insaDto.mil_endDate }'/>"><br>
			<label class="label1" for="kosa_reg_yn">KOSA등록 </label> 
			<select class="form-input1" name="kosa_reg_yn" id="kosa_reg_yn" >
				<option value="${insaDto.kosa_reg_yn }" selected="selected">${insaDto.kosa_reg_yn }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '110' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="kosa_class_code">KOSA등급 </label> 
			<select class="form-input1" name="kosa_class_code" id="kosa_class_code">
				<option value="${insaDto.kosa_class_code }" selected="selected">${insaDto.kosa_class_code }</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '111' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="join_day">*입사일 </label> 
			<input type="text" style="width: 200px;" id="join_day" name="join_day" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${insaDto.join_day }'/>">
			<label class="label1" for="retire_day">퇴사일 </label> 
			<input type="text" style="width: 200px;" id="retire_day" name="retire_day" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${insaDto.retire_day }'/>"><br> 
			<label class="label1" for="cmp_reg_no">사업자번호 </label> 
			<input type="text" class="form-input1" id="cmp_reg_no" name="cmp_reg_no" value="${insaDto.cmp_reg_no }" maxlength="10"> 
			<label class="label1" for="crm_name">사업체명 </label> 
			<input type="text" class="form-input1" id="crm_name" name="crm_name" value="${insaDto.crm_name }"> 
			<label class="label1" for="cmp_reg_image">사업자등록증 </label> 
			<input type="text" class="form-input1" style="margin-right: 30px;" id="cmp_reg_image" value="${fn:split(insaDto.cmp_reg_image,'_')[1]}" readonly="readonly">
			<button type="button" id="modal_btn1" class="btn2">미리보기</button>
			<div class="black_bg1"></div>
			<div class="modal_wrap1">
			    <div class="modal_close1"><a href="#">close</a></div>
			    <div class="update_modal"></div>
			    <div class="img1">
			       <img alt="사업자등록증" style="width:100%;" src="/resources/upload/${insaDto.cmp_reg_image }">
			    </div>
			</div>
			<label for="cmp_reg_btn" id="cmp_reg_label">등록증 업로드</label><br>
			<input type="file" style="display:none;" id="cmp_reg_btn" name="cmp_reg_image1">   
			<input type="hidden" name="cmp_reg_image2" value="${insaDto.cmp_reg_image }">
			<div class="text-div">
				<label style="width: 120px; text-align: center; padding-top: 20px; margin-right: 5px;" for="self_intro">자기소개 </label> 
			</div>
			<textarea style="width: 630px; height: 50px; margin-top: 5px; float: left;" id="self_intro" name="self_intro" >${insaDto.self_intro }</textarea>
			<div class="text-div2">
				<label class="label1" for="carrier">이력서 </label> 
				<input type="text" class="form-input1" style="margin-right: 30px;" id="carrier" value="${fn:split(insaDto.carrier,'_')[1]}" readonly="readonly"> 
				<button type="button" onclick="location.href='/download?sabun=${insaDto.sabun }'">다운로드</button>
				<label for="carrier_btn" id="carrier_label">파일 업로드</label><br>
				<input type="file" style="display:none;" id="carrier_btn" name="carrier1">
				<input type="hidden" name="carrier2" value="${insaDto.carrier }">
			</div>
		</form><br>
<!-- 		<button type="button" onclick="selectGrid()">검색</button> -->
		<table id="list"></table>
		<div id="pager"></div>
		
		
		<script type="text/javascript" src="js/update.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
</div>
</body>
</html>