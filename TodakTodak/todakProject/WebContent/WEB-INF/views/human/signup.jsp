<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
		String uploadPath=request.getRealPath("/");
		out.println("uploadPath>>> : "+uploadPath);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script> 	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#signUP").click(function(){
			alert("Ŭ��!");
			$("hmp_bank").attr("38");
			$("#insertMember").attr("action","/etc/insertMember.td").submit();
			
		});
	});
	function sample4_execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            var fullRoadAddr = data.roadAddress; 
	            var extraRoadAddr = ''; 
	            if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }	             
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	         
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }
	            document.getElementById('hmp_postcode').value = data.zonecode; 
	            document.getElementById('hmp_addr').value = fullRoadAddr;
	            if(data.autoRoadAddress) {
	 
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
	            }else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
	
	            } else {
	                document.getElementById('guide').innerHTML = '';
	            }
	        }
	    }).open();
}		
</script>
</head>
	<body>
		<form name="insertMember"
		      id="insertMember"
		      method="POST"
		      enctype="multipart/form-data">
		      <table border="1" align="center">
		      		<tr>
		      			<td colspan="2" align="center">
		      				�������
		      			</td>
		      		</tr>
		      		<tr>
						<td align="center">����</td>
						<td>&nbsp;<input type="text"
						name="hmp_name" id="hmp_name"></td>
					</tr>
					<tr>
						<td align="center">���̵�</td>
						<td>&nbsp;<input type="text"
						name="hmp_id" id="hmp_id"></td>
					</tr>
					<tr>
						<td align="center">��й�ȣ</td>
						<td>&nbsp;<input type="text"
						name="hmp_pw" id="hmp_pw"></td>
					</tr>
					<tr>
						<td align="center">�������</td>
						<td>&nbsp;<input type="text"
						name="hmp_birth" id="hmp_birth"></td>
					</tr>
					<tr>
						<td align="center">�ֹε�Ϲ�ȣ</td>
						<td>&nbsp;<input type="text"
						name="hmp_residentnum" id="hmp_residentnum"></td>
					</tr>
					<tr>
						<td align="center">�ڵ�����ȣ</td>
						<td>&nbsp;<input type="text"
						name="hmp_hpnum" id="hmp_hpnum"></td>
					</tr>
					<tr>
						<td align="center">�̸���</td>
						<td>&nbsp;<input type="text"
						name="hmp_email" id="hmp_email" ></td>
					</tr>
					<tr>
						<td align="center">����</td>
						<td>&nbsp;<input type="file"
						name="hmp_picture" id="hmp_picture"></td>
					</tr>
					<tr>
						<td align="center">�����ȣ</td>
						<td>
							<input type="text" id="hmp_postcode" name="hmp_postcode" placeholder="�����ȣ">
							<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						</td>
					</tr>
					<tr>
						<td align="center">���θ��ּ�</td>
						<td>&nbsp;<input type="text" name="hmp_addr" id="hmp_addr" placeholder="���θ��ּ�">
							<span id="guide" style="color:#999"></span>
						</td>
					</tr>
					<tr>
					<td align="center">���ּ�</td>
						<td>&nbsp;<input type="text"
						name="cadress" id="cadress"></td>
					</tr>	
					<tr>
						<td align="center">����</td>
						<td>&nbsp;<input type="text"
						name="hmp_bank" id="hmp_bank" value="����" readonly ></td>
					</tr>
					<tr>
						<td align="center">�����ָ�</td>
						<td>&nbsp;<input type="text"
						name="hmp_depositors" id="hmp_depositors"></td>
					</tr>
					<tr>
						<td align="center">���¹�ȣ</td>
						<td>&nbsp;<input type="text"
						name="hmp_accountnum" id="hmp_accountnum"></td>
					</tr>
					<tr>
					<td align="center">�����з�</td>
						<td><SELECT NAME = "hmp_education">
							<OPTION VALUE="28">����</OPTION>
							<OPTION VALUE="29">�ʴ���</OPTION>
							<OPTION VALUE="30">����</OPTION>
							<OPTION VALUE="31">����</OPTION>
							<OPTION VALUE="32">�ڻ�</OPTION>
						</SELECT></td>
					</tr>
					<tr>
						<td align="center">�з³���</td>
						<td>&nbsp;<input type="text"
						name="hmp_educontents" id="hmp_educontents"></td>
					</tr>
					<tr>
						<td align="center">���</td>
						<td><SELECT NAME = "hmp_workexperience">
							<OPTION VALUE="65">���</OPTION>
							<OPTION VALUE="66">����</OPTION>
						</SELECT></td>
					</tr>
					<tr>
						<td align="center">��³���</td>
						<td>&nbsp;<input type="text"
						name="hmp_workcontents" id="hmp_workcontents"></td>
					</tr>					
					<tr>
				<td colspan="2" align="center">
					
					<input type="button" value="�Է�" name="signUP" id="signUP">
				</td>
			</tr>
		      </table>
		      </form>
	</body>
</html>