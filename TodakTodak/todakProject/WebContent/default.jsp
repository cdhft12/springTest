<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�λ� �ε���</title>
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
						alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("������ ������մϴ�.").css("color","#000099");
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
						alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("������ ������մϴ�.").css("color","#000099");
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
						alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("������ ������մϴ�.").css("color","#000099");
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
						alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("������ ������մϴ�.").css("color","#000099");
						}
						if(resultData==true){
							
							$("#selectHuman")
				 			.attr("action","/human/selectAllcommRecord.td")
				            .submit();
						}
					}
				});
			});
			$("#selectapptAll").click(function(){				
				$.ajax({
					url:"/human/Authority.td",
					type:"POST",
					error:function(){
						alert('�ý��� ���� �Դϴ�. �����ڿ��� ���� �ϼ���');
					},
					success:function(resultData){
						if(resultData==false){
							$("#msg").text("������ ������մϴ�.").css("color","#000099");
						}
						if(resultData==true){
							
							$("#selectHuman")
				 			.attr("action","/human/apptAllselect.td")
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
			<input type="button" name="signUP" id="signUP" value="ȸ������">
			<input type="button" name="select" id="select" value="�����Ȳ">
			<input type="button" name="reference" id="reference" value="�λ����� ��ȸ">
			<input type="button" name="deptReference" id="deptReference" value="�μ� �λ����� ��ȸ">
			<input type="button" name="approval" id="approval" value="ȸ����� ���� ������">
			<input type="button" name="appointment" id="appointment" value="�λ�߷�">
			<input type="button" name="selectappt" id="selectappt" value="�����λ�߷� ��ȸ">
			<input type="button" name="selectapptAll" id="selectapptAll" value="��ü�λ�߷� ��ȸ">
			<input type="button" name="commuteRecord" id="commuteRecord" value="����� ��� ��ȸ">
			<input type="button" name="deptCommRecord" id="deptCommRecord" value="����� ��� ��ȸ/����">
		
			<span id="msg"></span>    
		</form>
</body>
	
</html>