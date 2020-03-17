<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>인사 인덱스</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#signUP").click(function(){	
	 			$("#selectHuman")
	 			.attr("enctype","multipart/form-data")
	 			.attr("action","/etc/moveSignup.td")
	            .submit();
			});
			$("#select").click(function(){				
	 			$("#selectHuman")
	 			.attr("action","/human/select.td")
	            .submit();
			});
			$("#reference").click(function(){				
	 			$("#selectHuman")
	 			.attr("action","/human/reference.td")
	            .submit();
			});
			$("#selectappt").click(function(){				
	 			$("#selectHuman")
	 			.attr("action","/human/apptRecord.td")
	            .submit();
			});
			$("#commuteRecord").click(function(){				
	 			$("#selectHuman")
	 			.attr("action","/human/commuteRecord.td")
	            .submit();
			});
			$("#deptReference").click(function(){				
				$.ajax({
					url:"/human/deptAuthority.td",
					type:"POST",
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("권한이 불충분합니다.").css("color","#000099");
						}
						if(resultData==true){
							$("#selectHuman")
				 			.attr("action","/human/deptReference.td")
				            .submit();
						}
					}
				});
			});
			$("#approval").click(function(){				
				$.ajax({
					url:"/human/Authority.td",
					type:"POST",
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("권한이 불충분합니다.").css("color","#000099");
						}
						if(resultData==true){
							
							$("#selectHuman")
				 			.attr("action","/human/selectAppr.td")
				            .submit();
						}
					}
				});
			});
			$("#appointment").click(function(){				
				$.ajax({
					url:"/human/Authority.td",
					type:"POST",
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("권한이 불충분합니다.").css("color","#000099");
						}
						if(resultData==true){
							
							$("#selectHuman")
				 			.attr("action","/human/apptSelect.td")
				            .submit();
						}
					}
				});
			});
			$("#deptCommRecord").click(function(){				
				$.ajax({
					url:"/human/deptAuthority.td",
					type:"POST",
					error:function(){
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("권한이 불충분합니다.").css("color","#000099");
						}
						if(resultData==true){
							
							$("#selectHuman")
				 			.attr("action","/human/selectAllcommRecord.td")
				            .submit();
						}
					}
				});
			});
		});	
	</script>
</head>

<body>		
		 <form id="selectHuman" name="selectHuman" method="POST">
			<input type="button" name="signUP" id="signUP" value="회원가입">
			<input type="button" name="select" id="select" value="사원현황">
			<input type="button" name="reference" id="reference" value="인사정보 조회">
			<input type="button" name="deptReference" id="deptReference" value="부서 인사정보 조회">
			<input type="button" name="approval" id="approval" value="회원등록 승인 페이지">
			<input type="button" name="appointment" id="appointment" value="인사발령">
			<input type="button" name="selectappt" id="selectappt" value="인사발령 조회">
			<input type="button" name="commuteRecord" id="commuteRecord" value="출퇴근 기록 조회">
			<input type="button" name="deptCommRecord" id="deptCommRecord" value="부서 출퇴근 기록 조회">
		
			<span id="msg"></span>    
		</form>
</body>
	
</html>
