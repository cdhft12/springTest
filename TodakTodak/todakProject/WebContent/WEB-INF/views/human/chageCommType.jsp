<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
		
	<script type="text/javascript">
	$(document).ready(function(){
		$("#changeComm").click(function(){
			alert("��ư ����~!");
			$("#hc_tanda").val();
		});
	});
	</script>
</head>
<body>
		<form name="change" id="change" method="post">
			<input type="hidden" name="hc_tanda" id="hc_tanda">
			<input type="hidden" name="hc_comnum" id="hc_comnum">
			<label><input type="checkbox" name="work" id="work" value="70"> ���</label>
     		<label><input type="checkbox" name="afterWork" id="afterWork" value="71"> ���</label>
     		<label><input type="checkbox" name="vacation " id="vacation " value="72"> �ް�</label>
     		<input type="button" value="���" id="changeComm"/>	
		</form>
</body>
</html>