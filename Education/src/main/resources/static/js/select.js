/**
 * 
 */

		$(function() {
			
			var chkObj = document.getElementsByName("rowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='rowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='rowCheck']").click(function(){
				if($("input[name='rowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
			

			$('#reset').on("click",function(){
				$('#sabun,#name,#join_gbn_code,#put_yn,#pos_gbn_code,#join_day,#retire_day,#job_type').val('');
			});
		
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
		});
		
		function sabun_delete() {
			var valueArr = new Array();
		    var list = $("input[name='rowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("체크를 해주세요.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");
				if(chk){
					$.ajax({
					    url : '/delete',                    
					    type : 'POST',               
					    traditional : true,
					    data : {
					    	valueArr : valueArr     
					    },
		                success: function(){
							alert("삭제가 완료 되었습니다.");
	                        location.replace("select?page=1&perPageNum=10&sabun=&name=&join_gbn_code=&put_yn=&pos_gbn_code=&join_day=&retire_day=&job_type=")
		                }
					});
					return true;
				}else{
					return false;
				}
			}
		}