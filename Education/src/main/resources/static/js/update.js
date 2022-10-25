			const zip = $('#zip');
			const years = $('#years');
			const salary = $('#salary');
		
			$(function () {
				
// 				전화번호 유효성 검사
				$('#phone, #hp').on("keyup", function() { 
					$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
				});
				
// 				주민등록번호 *처리
				var reg_no = $('#hidden_reg_no').val();
				$('#reg_no').val(reg_no);
				var temp1 = reg_no.substring(0,6);
				var temp2 = reg_no.substring(7,8);
				var c = temp1;
				c += '-'+temp2;
				for(var i=0; i<5; i++){
					c += '*';
				}
				$('#hidden_reg_no').val(c);
				$('#hidden_reg_no').on("focus", function() {
					var val = $('#reg_no').val();
					val = val.replace(/-/g,'');
					$('#hidden_reg_no').val(val);
				});
				$('#hidden_reg_no').on("blur", function() {
					var hidden_reg_no = $('#hidden_reg_no').val();
					var reg_no = $('#hidden_reg_no').val();
					var temp1 = reg_no.substring(0,6);
					var temp2 = reg_no.substring(6,7);
					var temp3 = reg_no.substring(0,6);
					var temp4 = reg_no.substring(6,13);
					var c = temp1;
					c += '-'+temp2;
					for(var i=0; i<5; i++){
						c += '*';
					}
					if(hidden_reg_no!=''){
						$('#hidden_reg_no').val(c);
// 					나이 처리
						var dateObj = new Date();
						var curDate = "";
						var tmpAge = 0;
						var y = dateObj.getFullYear();
						var m = dateObj.getMonth();
						if(m<10) {
							m='0'+m;
						}
						var d = dateObj.getDate();
						if(d<10){
							d='0'+d;
						}
						curDate = y+m+d;
						if(temp2<=2){
							tmpAge=y-(1900+parseInt(temp1.substring(0,2)));
						}else{
							tmpAge=y-(2000+parseInt(temp1.substring(0,2)));
						}
						var tmpBirthday = temp1.substring(2,6);
						if(curDate<(y+tmpBirthday)){
							tmpAge+=1;
						}
						$('#years').val(tmpAge);
					}else{
						$('#hidden_reg_no').val('');
						$('#years').val('');
					}
					temp3 += '-' + temp4;
					$('#reg_no').val(temp3);
// 					성별 처리
					if(temp2=="1"||temp2=="3"){
						$('#sex').val("남자").prop("selected", true);
					}else if(temp2=="2"||temp2=="4"){
						$('#sex').val("여자").prop("selected", true);
					}else{
						$('#sex').val("").prop("selected", true);
					}
				});
				
	//			이메일 유효성 검사
				var email = $('#email').val();
				var email1 = email.split('@');
				$("#email1").val(email1[0]);
				$("#i_domain").val(email1[1]);
				
	//			이메일 도메인 미선택시 도메인 비활성화
				if($('#i_domain').val()=='naver.com'){
					$("#s_domain").val("naver.com"). prop("selected", true);
					$('#i_domain').attr("readonly", true)
				}else if($('#i_domain').val()=='daum.net'){
					$("#s_domain").val("daum.net"). prop("selected", true);
					$('#i_domain').attr("readonly", true)
				}else{
					$("#s_domain").val("selfInput"). prop("selected", true);
					$('#i_domain').attr("readonly", true)
				}
					
				$('#s_domain').on('change', function () {
					if($('#s_domain').val()=='naver.com'){
						$('#i_domain').attr("readonly", true).css("background", "white").val($('#s_domain').val());
					}else if($('#s_domain').val()=='daum.net'){
						$('#i_domain').attr("readonly", true).css("background", "white").val($('#s_domain').val());
					}else if($('#s_domain').val()=='selfInput'){
						$('#i_domain').attr("readonly", false).css("background", "white").val('');
					}else{
						$('#i_domain').val('').attr("readonly", true).css("background", "aqua")
					}
				});
				
				if($('#mil_yn').val()=='N'){
					$('#mil_type,#mil_level,#mil_startDate,#mil_endDate').val('').attr("disabled", true)
				}
				if($('#kosa_reg_yn').val()=='N'){
					$('#kosa_class_code').val('').attr("disabled", true)
				}
				
	// 			군필여부
				$('#mil_yn').change(function() {
					var result = $('#mil_yn option:selected').val();
					if (result == 'N') {
						$('#mil_type,#mil_level,#mil_startDate,#mil_endDate').val('').attr("disabled", true)
					} else {
						$('#mil_type,#mil_level,#mil_startDate,#mil_endDate').attr("disabled", false)
						
					}
				});
	
// 				kosa등록 여부
				$('#kosa_reg_yn').change(function() {
					var result = $('#kosa_reg_yn option:selected').val();
					if (result == 'N') {
						$('#kosa_class_code').val('').attr("disabled", true)
					} else {
						$('#kosa_reg_yn').val('Y')
						$('#kosa_class_code').attr("disabled", false)
					}
				})
	
				
// 				연봉 ,처리
				var salary = $('#salary2').val();
				$('#salary').val(salary);
				salary = currencyFormatter(salary);
				$('#salary2').val(salary);
				$('#salary2').on("focus", function() {
					var val = $('#salary2').val();
					if(!isEmpty(val)){
						val = val.replace(/,/g,'');
						$('#salary2').val(val);
						$('#salary').val(val);
					}
				});
				
				$('#salary2').on("blur", function() {
					var val = $('#salary2').val();
					if(!isEmpty(val)&&isNumeric(val)){
						$('#salary').val(val);
						val = currencyFormatter(val);
						$('#salary2').val(val);
					}
				});
				
// 				사업자번호 - 처리
				$('#cmp_reg_no').on("focus", function() {
					var val = $('#cmp_reg_no').val();
					val = val.replace(/-/g,'');
					$('#cmp_reg_no').val(val);
				});
				$('#cmp_reg_no').on("blur", function() {
					if($('#cmp_reg_no').val()!=''){
						var cmp_reg_no = $('#cmp_reg_no').val();
						var temp1 = cmp_reg_no.substring(0,3);
						var temp2 = cmp_reg_no.substring(3,5);
						var temp3 = cmp_reg_no.substring(5);
						var sum = temp1+"-"+temp2+"-"+temp3;
					}
					$('#cmp_reg_no').val(sum);
				});
			
	// 			datePicker
				$("#join_day,#retire_day,#mil_startDate,#mil_endDate").datepicker({
			           dateFormat: 'yy-mm-dd' //달력 날짜 형태
			           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			           ,changeYear: true //option값 년 선택 가능
			           ,changeMonth: true //option값  월 선택 가능                
			           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
			           ,buttonText: "선택" //버튼 호버 텍스트              
			           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
			           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
			           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
			           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
			           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
				});    
				
			    $('#join_day').datepicker("option", "maxDate", $("#retire_day").val());
			    $('#join_day').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#retire_day").datepicker( "option", "minDate", selectedDate );
			    });
			    $('#retire_day').datepicker("option", "minDate", $("#join_day").val());
			    $('#retire_day').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#join_day").datepicker( "option", "maxDate", selectedDate );
			    });
			    $('#mil_startDate').datepicker("option", "maxDate", $("#mil_endDate").val());
			    $('#mil_startDate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#mil_endDate").datepicker( "option", "minDate", selectedDate );
			    });
			    $('#mil_endDate').datepicker("option", "minDate", $("#mil_startDate").val());
			    $('#mil_endDate').datepicker("option", "onClose", function ( selectedDate ) {
			        $("#mil_startDate").datepicker( "option", "maxDate", selectedDate );
			    });

// 			    파일업로드
			    var fileTarget1 = $('#cmp_reg_btn');
			    fileTarget1.on('change', function(){  // 값이 변경되면
				    if(window.FileReader){  // modern browser
				    	var filename = $(this)[0].files[0].name;
				    }else {  // old IE
				    	var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				    }
					 $(this).siblings('#cmp_reg_image').val(filename);
				
//					모달창
			        var parent = $('.update_modal');
			        parent.children('.upload-display').remove();
			        $('.img1').remove();
			
			        if(window.FileReader){
			            //image 파일만
			            if (!$(this)[0].files[0].type.match(/image\//)) return;
			            
			            var reader = new FileReader();
			            reader.onload = function(e){
			                var src = e.target.result;
			                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" style="width:100%;" class="upload-thumb"></div></div>');
			            }
			            reader.readAsDataURL($(this)[0].files[0]);
			        }
			
			        else {
			            $(this)[0].select();
			            $(this)[0].blur();
			            var imgSrc = document.selection.createRange().text;
			            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
			
			            var img = $(this).siblings('.upload-display').find('img');
			            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";       
					}
			    });
			    
			    var fileTarget2 = $('#carrier_btn');
				    fileTarget2.on('change', function(){  // 값이 변경되면
				    if(window.FileReader){  // modern browser
				    	var filename = $(this)[0].files[0].name;
				    }else {  // old IE
			    		var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			  		}
			      
			      // 추출한 파일명 삽입
			    	$(this).siblings('#carrier').val(filename);
			    });
			    
// 			    profile preview
				var imgTarget = $('#img_btn');
				imgTarget.on('change', function(){
			    	if(window.FileReader){  // modern browser
				        var filename = $(this)[0].files[0].name;
				    } 
				    else {  // old IE
				      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
				    }
				    
				    // 추출한 파일명 삽입
				    $(this).siblings('#profile2').val(filename);
					$('#profile2').val($(this).val());
			        var parent = $('#profile2').parent();
					
			        if(window.FileReader){
			            //image 파일만
			            if (!$(this)[0].files[0].type.match(/image\//)) return;
			            
			            var reader = new FileReader();
			            reader.onload = function(e){
						$( 'img' ).remove( '.images' );
			                var src = e.target.result;
			                parent.prepend('<img class="images" alt="" src="'+src+'" style="width:100%; margin-top:10px;">');
			            }
			            reader.readAsDataURL($(this)[0].files[0]);
			        }else {
			            $(this)[0].select();
			            $(this)[0].blur();
			            var imgSrc = document.selection.createRange().text;
			            parent.prepend('<div class="upload-display"><img ></div>');
			
			            var img = $(this).siblings('.upload-display').find('img');
			            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
			        }
			    });
			});
			
			function deleteSabun(){
				var result = confirm("삭제하시겠습니까");
				if(result){
					location.href='delete?sabun='+$('#sabun').val();
				}
			}
			
			function onClick() {
			     document.querySelector('.modal_wrap1').style.display ='block';
			     document.querySelector('.black_bg1').style.display ='block';
			 }   
			 function offClick() {
			     document.querySelector('.modal_wrap1').style.display ='none';
			     document.querySelector('.black_bg1').style.display ='none';
			 }
			
			 document.getElementById('modal_btn1').addEventListener('click', onClick);
			 document.querySelector('.modal_close1').addEventListener('click', offClick);
			
			
/*         	$("#list").jqGrid({          
                colNames:["no","근무가능일","월 제시금액(단위:만원)","PJ형태구분코드","장비유뮤","현재연봉(단위:만원)","근무지"],
                colModel:[
                          {name:"seq", index:"seq", align:"center"},
                          {name:"wrk_posb_day", index:"wrk_posb_day", align:"center", formatter: "date", formatoptions: { newformat: "y/m/d"}},
                          {name:"sugst_money", index:"sugst_money", align:"center"},
                          {name:"pjt_gbn_code", index:"pjt_gbn_code", align:"center"},
                          {name:"eqm_yn", index:"eqm_yn", align:"center"},
                          {name:"current_salary", index:"current_salary", align:"center"},
                          {name:"work_area", index:"work_area", align:"center"}
                         ],
                datatype:'local',
                height:200,
                width:1450,
                pager: '#pager',
                rowNum:10,
	        });
        	
	        function selectGrid() {
	        	$.ajax({
				    url: '/grid',
				    type: 'POST',
				    data: 'sabun='+ $('#sabun').val(),
				    dataType: 'json',
				    success: function(data) {
				    	$('#list').clearGridData();
				    	$("#list").jqGrid('setGridParam',{data}).trigger('reloadGrid');
				    }
	 	        });
			}	*/
	        
	       
 			$("#list").jqGrid({   
				url: '/grid',
				mtype: 'POST',
				postData: {
					sabun:$('#sabun').val()
				},
			    datatype: 'json',
 				loadtext  : "로딩중...",
                colNames:["no","근무가능일","월 제시금액(단위:만원)","PJ형태구분코드","장비유뮤","현재연봉(단위:만원)","근무지"],
                colModel:[
                          {name:"seq", index:"seq", align:"center"},
                          {name:"wrk_posb_day", index:"wrk_posb_day", align:"center", formatter: "date", formatoptions: { newformat: "y/m/d"}},
                          {name:"sugst_money", index:"sugst_money", align:"center"},
                          {name:"pjt_gbn_code", index:"pjt_gbn_code", align:"center"},
                          {name:"eqm_yn", index:"eqm_yn", align:"center"},
                          {name:"current_salary", index:"current_salary", align:"center"},
                          {name:"work_area", index:"work_area", align:"center"}
                         ],
                height:200,
                width:1450,
                pager: '#pager',
                rowNum:10,
                viewrecords:true
	        }); 
		
			function update_summit() {
				
				if(zip.val()==""){
					zip.val(Number(zip.val()));
				}
				if(salary.val()==""){
					salary.val(Number(salary.val()));
				}
				
				
// 				이메일 유효성 검사
				var email = $('#email').val();
				var email1 = $("#email1").val();
				var domain = $('#i_domain').val();
				var emailSum = email1+"@"+domain;
				$("#email").val(emailSum);
				var emailCheck2 = new RegExp(/^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/);
				if(!emailCheck2.test($("#email").val())){
					alert("이메일은 영문,숫자만 입력 가능합니다.");
					$("#email").val("");
					$("#email").focus();
					return false;
				}
				
				if($('#pwd').val().length<8||$('#pwd').val().length>16){
					alert("8~15자 사이의 비밀번호를 입력해주세요.");
					return false;
				}
				
//				비밀번호 확인
				if($('#pwd').val()==''){
					alert("비밀번호를 입력하세요.");
					return false;
				}
				if($('#pwd').val()!=$('#pwdCheck').val()){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				
// 				한글이름 유효성 검사
				var nameCheck = new RegExp(/^[가-힣]+$/);
				if(!nameCheck.test($("#name").val())){
					alert("한글이름은 한글만 입력 가능합니다.");
					$("#name").val("");
					$("#name").focus();
					return false;
				}
				
// 				영어이름 유효성 검사
				if($("#eng_name").val()!=''){
					var nameCheck2 = new RegExp(/^[a-zA-Z]+$/);
					if(!nameCheck2.test($("#eng_name").val())){
						alert("영문이름은 영문만 입력 가능합니다.");
						$("#eng_name").val("");
						$("#eng_name").focus();
						return false;
					}
				}
				
// 				전화번호 유효성 검사
				if($("#phone").val()!=''){
					var phoneCheck = new RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/);
					if(!phoneCheck.test($("#phone").val())){
						alert("전화번호를 확인해주세요.");
						$("#phone").val("");
						$("#phone").focus();
						return false;
					}
				}
// 				핸드폰번호 유효성 검사
				var hpCheck = new RegExp(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/);
				if(!hpCheck.test($("#hp").val())){
					alert("핸드폰번호를 확인해주세요.");
					$("#hp").val("");
					$("#hp").focus();
					return false;
				}
				
// 				우편주소 유효성 검사
				if($("#zip").val()!=''){
					var zipCheck = new RegExp(/[0-9]/g);
					if(!zipCheck.test($("#zip").val())){
						alert("숫자만 입력 가능합니다.");
						$("#zip").val("");
						$("#zip").focus();
						return false;
					}
				}

// 				주민등록번호 유효성 검사
				var juminCheck = new RegExp(/\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4]\d{6}/g);
				if(!juminCheck.test($("#reg_no").val())){
					alert("주민등록번호를 확인해주세요");
					$("#hidden_reg_no").val("");
					$("#hidden_reg_no").focus();
					return false;
				}
				
// 				사업자번호 유효성 검사
				if($("#cmp_reg_no").val()!=''){	
					var cmpCheck = new RegExp(/([0-9]{3})-?([0-9]{2})-?([0-9]{5})/);
					if(!cmpCheck.test($("#cmp_reg_no").val())){
						alert("사업자번호를 확인해주세요");
						$("#cmp_reg_no").val("");
						$("#cmp_reg_no").focus();
						return false;
					}
				}
				var result = confirm("수정하시겠습니까");
				if(result){
					return true;
				}else{
					return false;
				}
			}
			
// 			연봉 유효성 검사
			function isEmpty(value) {
				if(value.length==0||value==null){
					return true;
				}else {
					return false;
				}
			}
			
			function isNumeric(value) {
				var regExp = /^[0-9]+$/g;
				return regExp.test(value);
			}
			
			function currencyFormatter(amount) {
				return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
			}
			
// 			주소검색
			function sample6_execDaumPostcode() {
			    new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			            var addr = ''; // 주소 변수
			            var extraAddr = ''; // 참고항목 변수
			
			            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                addr = data.roadAddress;
			            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                addr = data.jibunAddress;
			            }
			
			            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			            if(data.userSelectedType === 'R'){
			                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                    extraAddr += data.bname;
			                }
			                // 건물명이 있고, 공동주택일 경우 추가한다.
			                if(data.buildingName !== '' && data.apartment === 'Y'){
			                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                }
			                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                if(extraAddr !== ''){
			                    extraAddr = ' (' + extraAddr + ')';
			                }
			                // 조합된 참고항목을 해당 필드에 넣는다.
			                document.getElementById("addr2").value = extraAddr;
			            
			            } else {
			                document.getElementById("addr2").value = '';
			            }
			
			            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			            document.getElementById('zip').value = data.zonecode;
			            document.getElementById('zip2').value = data.zonecode;
			            document.getElementById("addr1").value = addr;
			            // 커서를 상세주소 필드로 이동한다.
			            document.getElementById("addr2").focus();
			        }
			    }).open();
			}