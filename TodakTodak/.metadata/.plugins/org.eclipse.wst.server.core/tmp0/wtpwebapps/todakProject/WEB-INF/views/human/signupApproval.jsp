<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java142.todak.human.vo.ApprVO"%>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	Object obj=request.getAttribute("approvalMember");
	ApprVO avo=(ApprVO)obj;
	String fulladdr="../../upload/";
	fulladdr=fulladdr+avo.getHmp_picture();
	String education=avo.getHmp_education();
	String workexperience=avo.getHmp_workexperience();
	switch(education){
		case "����":
			education="28";
			break;
		case "�ʴ���":
			education="29";
			break;
		case "����":
			education="30";
			break;
		case "����":
			education="31";
			break;
		case "�ڻ�":
			education="32";
			break;
	}
	if(workexperience.equals("�����")){
		workexperience="65";
	}
	if(workexperience.equals("����")){
		workexperience="66";
	}
%>
<title>���Խ���</title>
<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
				
		<script type="text/javascript">
	$(document).ready(function(){
		$("#accept").click(function(){
			$("#flag").val("Y");
			$("#approvalMember").attr("action","/human/apprResult.td").submit();
			
		});
		$("#negative").click(function(){
			$("#flag").val("N");
			$("#approvalMember").attr("action","/human/apprResult.td").submit();
			
		});
		 $("#hm_hiredate").datepicker({
	    	 dateFormat: 'yymmdd'
	    	,showMonthAfterYear:true             
	        ,yearSuffix: "��" 
	       	,changeYear: true //�޺��ڽ����� �� ���� ����
	        ,changeMonth: true //�޺��ڽ����� �� ���� ����       
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
	        ,monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'] 
	        ,dayNamesMin: ['��','��','ȭ','��','��','��','��']
	        ,dayNames: ['�Ͽ���','������','ȭ����','������','�����','�ݿ���','�����']
	    });
	});
	</script>
</head>
<body>
	<form name="approvalMember"
		  id="approvalMember"
		  method="POST">
		      <table border="1" align="center">
		      		<tr>
		      			<td colspan="2" align="center">
		      				�������
		      			</td>
		      		</tr>
		      		<tr>
						<td align="center">����</td>
						<td>&nbsp;<input type="text" name="hm_name" id="hm_name" value='<%=avo.getHmp_name() %>' readonly></td>
					</tr>
		      		
					<tr>
						<td align="center">���̵�</td>
						<td>&nbsp;<input type="text" name="hm_id" id="hm_id" value='<%=avo.getHmp_id() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">���̵�</td>
						<td>&nbsp;<input type="text" name="hm_pw" id="hm_pw" value='<%=avo.getHmp_pw() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">�������</td>
						<td>&nbsp;<input type="text" name="hm_birth" id="hm_birth" value='<%=avo.getHmp_birth() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">�ֹε�Ϲ�ȣ</td>
						<td>&nbsp;<input type="text" name="hm_residentnum" id="hm_residentnum" value='<%=avo.getHmp_residentnum() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">�ڵ�����ȣ</td>
						<td>&nbsp;<input type="text" name="hm_hp" id="hm_hp" value='<%=avo.getHmp_hpnum() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">�̸���</td>
						<td>&nbsp;<input type="text" name="hm_email" id="hm_email" value='<%=avo.getHmp_email() %>' readonly></td>
					</tr>	
					<tr>
						<td align="center">����</td>
						<td><img src= <%=fulladdr %> border=0 width="100" height="100"></td>
					</tr>
					<tr>
						<td align="center">�����ȣ</td>
						<td>&nbsp;<input type="text" name="hm_postcode" id="hm_postcode" value='<%=avo.getHmp_postcode() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">���θ��ּ�</td>
						<td>&nbsp;<input type="text" name="hm_addr" id="hm_addr" value='<%=avo.getHmp_addr() %>' readonly></td>
					</tr>
					<tr>
					<tr>
						<td align="center">����</td>
						<td><%=avo.getHmp_bank() %></td>
					</tr>
					<tr>
						<td align="center">�����ָ�</td>
						<td>&nbsp;<input type="text" name="hm_depositors" id="hm_depositors" value='<%=avo.getHmp_depositors() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">���¹�ȣ</td>
						<td>&nbsp;<input type="text" name="hm_accountnum" id="hm_accountnum" value='<%=avo.getHmp_accountnum() %>' readonly></td>
					</tr>
					<tr>
					<td align="center">�����з�</td>
						<td><%=avo.getHmp_education() %></td>
					</tr>
					<tr>
						<td align="center">�з³���</td>
						<td>&nbsp;<input type="text" name="hm_educontents" id="hm_educontents" value='<%=avo.getHmp_educontents() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">���</td>
						<td><%=avo.getHmp_workexperience() %></td>
					</tr>
					<tr>
						<td align="center">��³���</td>
						<td>&nbsp;<input type="text" name="hm_workcontents" id="hm_workcontents" value='<%=avo.getHmp_workcontents() %>' readonly></td>
					</tr>	
					<tr>
					<td align="center">�μ�</td>
						<td><SELECT NAME = "hm_deptnum">
							<OPTION VALUE="00">�濵��������</OPTION>
							<OPTION VALUE="01">������ȹ����</OPTION>
							<OPTION VALUE="02">�����ú���</OPTION>
							<OPTION VALUE="03">�����������</OPTION>
						</SELECT></td>
					</tr>
					<tr>
					<td align="center">��</td>
						<td><SELECT NAME = "hm_teamnum">
							<OPTION VALUE="04">����濵��</OPTION>
							<OPTION VALUE="05">�繫��</OPTION>
							<OPTION VALUE="06">������</OPTION>
							<OPTION VALUE="07">��ȹ��</OPTION>
							<OPTION VALUE="08">����������</OPTION>
							<OPTION VALUE="09">IT��</OPTION>
							<OPTION VALUE="10">ȫ����</OPTION>
							<OPTION VALUE="11">�����</OPTION>
							<OPTION VALUE="12">���Ż����</OPTION>
							<OPTION VALUE="67">����</OPTION>
						</SELECT></td>
					</tr>
					<tr>
					<td align="center">����</td>
						<td>
							<SELECT NAME = "hm_position">
								<OPTION VALUE="13">�ӿ�</OPTION>
								<OPTION VALUE="14">����</OPTION>
								<OPTION VALUE="15">����</OPTION>
								<OPTION VALUE="16">�븮</OPTION>
								<OPTION VALUE="17">���</OPTION>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td align="center">��å</td>
						   <td>
								<SELECT NAME = "hm_duty">
									<OPTION VALUE="18">����</OPTION>
									<OPTION VALUE="19">������</OPTION>
									<OPTION VALUE="20">��ǥ�̻�</OPTION>
									<OPTION VALUE="67">����</OPTION>
								</SELECT>
						  </td>
					</tr>
					
					<tr>
						<td align="center">������ȣ</td>
						<td>&nbsp;<input type="text" name="hm_extensionnum" id="hm_extensionnum"></td>
					</tr>
					<tr>
						<td align="center">�����</td>
						<td>&nbsp;<input type="text" name="hm_hiredate" id="hm_hiredate"></td>
					</tr>
					<tr>
						<td align="center">�������</td>
						   <td>
								<SELECT NAME = "hm_employmenttype">
									<OPTION VALUE="24">������</OPTION>
									<OPTION VALUE="25">�����</OPTION>
								</SELECT>
						  </td>
					</tr>		
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="hm_workexperience" id="hm_workexperience" value="<%=workexperience %>">
							<input type="hidden" name="hm_education" id="hm_education" value="<%=education %>">
							<input type="hidden" name="hm_bank" id="hm_bank" value="38">
							<input type="hidden" name="hm_picture" id="hm_picture" value="<%=avo.getHmp_picture() %>">
							<input type="hidden" name="hmp_empnum" id="hmp_empnum" value="<%=avo.getHmp_empnum() %>">
							<input type="hidden" name="flag" id="flag">
							<input type="button" value="����" name="accept" id="accept">
							<input type="button" value="�ź�" name="negative" id="negative">
						</td>
					</tr>
		      </table>
		 </form>
	</body>
</html>