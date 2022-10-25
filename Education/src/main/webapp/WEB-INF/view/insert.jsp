<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/view/include/header.jsp"/>
<link rel="stylesheet" href="/css/join.css">

	<div class="container_1">
		<form action="" method="post" onsubmit="return insert_summit();" enctype="multipart/form-data">
			<div align="right">
				<button type="submit" id="summit_btn" class="btn">등록</button>
				<button type="reset" class="btn">초기화</button>
				<button type="button" class="btn" onclick="location.href='/'">뒤로</button>
			</div><br>
			<div class="img_box">
				<!--증명사진 profile-->
				<div class="img_box_img preview-image">
					<input type="hidden" id="profile2"> 
				</div>
				<label for="img_btn" id="img_label">사진등록</label><br>
				<input type="file" style="display:none;" id="img_btn" name="profile_image1">
			</div>
			<label class="label1" for="sabun">*사번 </label> 
			<input type="text" style="width: 250px; background: aqua;" id="sabun" readonly="readonly" dir="rtl" placeholder="자동생성"> 
			<label class="label1" for="name">*한글이름 </label> 
			<input type="text" class="form-input1" id="name" name="name">
			<label class="label1" for="eng_name">영문이름 </label> 
			<input type="text" class="form-input2" id="eng_name" name="eng_name"><br> 
			<label class="label1" for="id">*아이디 </label> 
			<input type="text" class="form-input1" id="id" name="id">
			<label class="label1" for="hidden_pwd">*비밀번호 </label> 
			<input type="text" class="form-input1" id="hidden_pwd">
			<input type="hidden" id="pwd" name="pwd">
			<label class="label1"for="hidden_pwdCheck">*비밀번호 확인 </label> 
			<input type="text" class="form-input2" id="hidden_pwdCheck"><br>
			<input type="hidden" id="pwdCheck">
			<label class="label1"for="phone">전화번호 </label> 
			<input type="text" class="form-input1" id="phone" name="phone" maxlength="13"> 
			<label class="label1" for="hp">*휴대폰번호 </label> 
			<input type="text" class="form-input1" id="hp" name="hp" maxlength="13">
			<label class="label1"for="hidden_reg_no">*주민번호 </label> 
			<input type="text" class="form-input2" id="hidden_reg_no" maxlength="13"><br>
			<input type="hidden" id="reg_no" name="reg_no">
			<input type="hidden" id="email" name="email">
			<label class="label1" for="email1">*이메일 </label> 
			<input type="text" class="form-input3" id="email1"> 
			@<input type="text" class="form-input3" id="i_domain">
			<select class="form-input3" name="domain" id="s_domain">
				<option value="none" selected="selected">선택</option>
				<option value="naver.com">네이버</option>
				<option value="daum.net">다음</option>
				<option value="selfInput">직접입력</option>
			</select>
			<label class="label2" for="job_type">직종 </label> 
			<select class="form-input1" name="job_type" id="job_type">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '106' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>
			<label class="label2" for="years">연령 </label> 
			<input type="text" class="form-input3" id="years" name="years" readonly="readonly" placeholder="(자동생성)">
			<label class="label2" for="sex">성별 </label>
			<select class="form-input3" name="sex" id="sex">
				<option value="" selected="selected">(자동생성)</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '102' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select><br>
			<label class="label1" for="zip2">주소 </label> 
			<input type="text" style="width: 165px;" id="zip2" placeholder="우편번호" readonly="readonly">
			<input type="hidden" id="zip" name="zip">
			<button type="button" onclick="sample6_execDaumPostcode()">주소검색</button>
			<input type="text" style="width: 375px;" placeholder="주소" id="addr1" name="addr1" readonly="readonly">
			<input type="text" style="width: 305px;" placeholder="세부주소" id="addr2" name="addr2" readonly="readonly"><br>
			<input type="hidden" id="sample6_extraAddress" placeholder="참고항목">
			<label class="label1"for="pos_gbn_code">직위 </label> 
		    <select class="form-input1" name="pos_gbn_code" id="pos_gbn_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '107' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1" for="dept_code">부서 </label> 
			<select class="form-input1" name="dept_code" id="dept_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '105' }">
						<option value="${var.gubun }${var.code }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select> 
			<label class="label1"for="salary2">연봉 </label> 
			<input type="text" class="form-input2" id="salary2" dir="rtl" placeholder="(만원)"><br>
			<input type="hidden" id="salary" name="salary">
			<label class="label1" for="join_gbn_code">입사구분 </label> 
			<select class="form-input1" name="join_gbn_code" id="join_gbn_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '101' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="gart_level">최종학력 </label> 
			<select class="form-input1" name="gart_level" id="gart_level">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '112' }">
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
			<label class="label1" for="mil_yn">군필여부 </label> 
			<select class="form-input2" name="mil_yn" id="mil_yn">
				<option value="N" selected="selected">N</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '104' && var.code eq '101' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select><br>  
			<label class="label1" for="mil_type">군별 </label> 
			<select class="form-input1" name="mil_type" id="mil_type">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '108' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="mil_level">계급 </label> 
			<select class="form-input1" name="mil_level" id="mil_level">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '109' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="mil_startDate">입영일 </label> 
			<input type="text" style="width: 200px;" id="mil_startDate" name="mil_startDate">
			<label class="label1" for="mil_endDate">전역일 </label> 
			<input type="text" style="width: 200px;" id="mil_endDate" name="mil_endDate"><br> 
			<label class="label1" for="kosa_reg_yn">KOSA등록 </label> 
			<select class="form-input1" name="kosa_reg_yn" id="kosa_reg_yn">
				<option value="N" selected="selected">N</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '110' && var.code eq '101'}">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="kosa_class_code">KOSA등급 </label> 
			<select class="form-input1" name="kosa_class_code" id="kosa_class_code">
				<option value="" selected="selected">선택</option>
				<c:forEach items="${comList }" var="var">
					<c:if test="${var.gubun eq '111' }">
						<option value="${var.name }">${var.name }</option>
					</c:if>
				</c:forEach>
			</select>  
			<label class="label1" for="join_day">*입사일 </label> 
			<input type="text" style="width: 200px;" id="join_day" name="join_day">
			<label class="label1" for="retire_day">퇴사일 </label> 
			<input type="text" style="width: 200px;" id="retire_day" name="retire_day"><br> 
			<label class="label1" for="cmp_reg_no">사업자번호 </label> 
			<input type="text" class="form-input1" id="cmp_reg_no" name="cmp_reg_no" maxlength="10">
			<label class="label1" for="crm_name">사업체명 </label> 
			<input type="text" class="form-input1" id="crm_name" name="crm_name"> 
			<label class="label1" for="cmp_reg_image">사업자등록증 </label> 
			<input type="text" class="form-input1" id="cmp_reg_image">
			<button type="button" style="margin-left:50px;" id="modal_btn1">미리보기</button>
			<div class="black_bg1"></div>
			<div class="modal_wrap1">
			    <div class="modal_close1"><a href="#">close</a></div>
			    <div class="insert_modal1"></div>
			</div>
			<label for="cmp_reg_btn" id="cmp_reg_label">등록증 업로드</label><br>
			<input type="file" style="display:none;" id="cmp_reg_btn" name="cmp_reg_image1">
			<div class="text-div">
				<label style="width: 120px; text-align: center; padding-top: 20px; margin-right: 5px;" for="self_intro">자기소개 </label> 
			</div>
			<textarea style="width: 630px; height: 50px; margin-top: 5px; float: left;" id="self_intro" name="self_intro"></textarea>
			<div class="text-div2">
				<label class="label1" for="carrier">이력서 </label> 
				<input type="text" class="form-input1" id="carrier"> 
				<button type="button" style="margin-left:50px;" id="modal_btn2">미리보기</button>
			<div class="black_bg2"></div>
			<div class="modal_wrap2">
			    <div class="modal_close2"><a href="#">close</a></div>
			    <div class="insert_modal2"></div>
			</div>
				<label for="carrier_btn" id="carrier_label">이력서 업로드</label><br>
				<input type="file" style="display:none;" id="carrier_btn" name="carrier1">
<!-- 				<input type="file" style="display:none;" id="carrier_image" name="carrier_image1"> -->
			</div>
		</form>
		
		<script type="text/javascript" src="js/join.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</div>
</body>
</html>