
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java142.todak.human.vo.MemberVO"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
		Object obj=request.getAttribute("mvo");
		MemberVO mvo=(MemberVO)obj;
		String bposition=mvo.getHm_position();
		String bduty=mvo.getHm_duty();
		String bdept=mvo.getHm_deptnum();
		String bteam=mvo.getHm_teamnum();
		switch(bposition){
		case "�ӿ�":
			bposition="13";
			break;
		case "����":
			bposition="14";
			break;
		case "����":
			bposition="15";
			break;
		case "�븮":
			bposition="16";
			break;
		case "���":
			bposition="17";
			break;
	}
		switch(bduty){
		case "����":
			bduty="18";
			break;
		case "������":
			bduty="19";
			break;
		case "��ǥ�̻�":
			bduty="20";
			break;
		case "����":
			bduty="73";
			break;
	}
		switch(bdept){
		case "�濵��������":
			bdept="00";
			break;
		case "������ȹ����":
			bdept="01";
			break;
		case "�����ú���":
			bdept="02";
			break;
		case "�����������":
			bdept="03";
			break;
	}
		switch(bteam){
		case "����濵��":
			bteam="04";
			break;
		case "�繫��":
			bteam="05";
			break;
		case "������":
			bteam="06";
			break;
		case "��ȹ��":
			bteam="07";
			break;
		case "����������":
			bteam="08";
			break;
		case "IT��":
			bteam="09";
			break;
		case "ȫ����":
			bteam="10";
			break;
		case "�����":
			bteam="11";
			break;
		case "���Ż����":
			bteam="12";
			break;
		case "����":
			bteam="73";
			break;
	}
		
%>
	<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
		
	<script type="text/javascript">

	$(function(){
		$(".promotion").hide();
		$(".deptTransfer").hide();
		$(".notes").hide();
		
		$("#accept").click(function(){	
 			$("#apptMember")
 			.attr("action","/human/updateAppt.td")
            .submit();
		});
		$("#hpa_appointment").change(function(){
		
			if($("#hpa_appointment").val()=="68"){
				
				$(".promotion").show();
				$(".notes").show();
			}else{
				$(".promotion").hide();
			}
			if($("#hpa_appointment").val()=="69"){
				
				$(".deptTransfer").show();
				$(".notes").show();
			}else{
				$(".deptTransfer").hide();
			}
			if($("#hpa_appointment").val()=="67"){
				$(".promotion").hide();
				$(".deptTransfer").hide();
				$(".notes").hide();
			}
			if($("#hpa_appointment").val()=="74"){
				$(".promotion").hide();
				$(".deptTransfer").hide();
				$(".notes").show();
			}
		});
	    $("#hpa_appointmentdate").datepicker({
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
		<form   name="apptMember"
		  			id="apptMember"
		 		    method="POST">
			<div>
				<table border="0">
					<tr><th><h4>�λ�߷�</h4></th></tr>
				</table>
			</div>
			<div style="height: 200px; width: 735px; border:1px solid black;">		
			
					<tr>
						<td align="center">�߷ɱ���
							<SELECT name = "hpa_appointment" id="hpa_appointment">
							<OPTION VALUE="67">== ����  ==</OPTION>
							<OPTION VALUE="68">����</OPTION>
						    <OPTION VALUE="69">�μ��̵�</OPTION>
						    <OPTION VALUE="74">���</OPTION>
							</SELECT>
						</td>
						<td>
							 �߷�����<input type="text" name="hpa_appointmentdate" id="hpa_appointmentdate" size="12" />
						</td>
						<div class="promotion">
						<table border="0">
						
					</tr>
					
						
								<tr>	
									<td>
										�������� : <%=mvo.getHm_position() %>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
											�߷����� :
											<SELECT name = "hpa_aposition" id="hpa_aposition">
												<OPTION VALUE="67">== ����  ==</OPTION>
												<OPTION VALUE="13">�ӿ�</OPTION>
												<OPTION VALUE="14">����</OPTION>
												<OPTION VALUE="15">����</OPTION>
												<OPTION VALUE="16">�븮</OPTION>
												<OPTION VALUE="17">���</OPTION>
											</SELECT>
									</td>
								</tr>
								<tr>	
									<td>
										������å : <%=mvo.getHm_duty() %>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
											�߷���å :
											<SELECT name = "hpa_aduty" id="hpa_aduty">
												<OPTION VALUE="67">==����==</OPTION>
												<OPTION VALUE="18">����</OPTION>
												<OPTION VALUE="19">������</OPTION>
												<OPTION VALUE="20">��ǥ�̻�</OPTION>
												<OPTION VALUE="73">����</OPTION>
											</SELECT>
									</td>
								</tr>
							    
						</table>	
					</div>		
						<div class="deptTransfer">
							<table border="0">
								<tr>	
									<td>
										����μ� : <%=mvo.getHm_deptnum() %>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										�߷ɺμ� :
											<SELECT name = "hpa_adept" id="hpa_adept">
												<OPTION VALUE="67">== ����  ==</OPTION>
												<OPTION VALUE="00">�濵��������</OPTION>
												<OPTION VALUE="01">������ȹ����</OPTION>
												<OPTION VALUE="02">�����ú���</OPTION>
												<OPTION VALUE="03">�����������</OPTION>
											</SELECT>
									</td>
								</tr>
								<tr>	
									<td>
										������ : <%=mvo.getHm_teamnum() %>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
											�߷��� :
											<SELECT name = "hpa_ateam" id="hpa_ateam">
												<OPTION VALUE="67">== ����  ==</OPTION>
												<OPTION VALUE="04">����濵��</OPTION>
												<OPTION VALUE="05">�繫��</OPTION>
												<OPTION VALUE="06">������</OPTION>
												<OPTION VALUE="07">��ȹ��</OPTION>
												<OPTION VALUE="08">����������</OPTION>
												<OPTION VALUE="09">IT��</OPTION>
												<OPTION VALUE="10">ȫ����</OPTION>
												<OPTION VALUE="11">�����</OPTION>
												<OPTION VALUE="12">���Ż����</OPTION>
												<OPTION VALUE="73">����</OPTION>
											</SELECT>
									</td>
								</tr>
							</table>		
						</div>
						<div class="notes">
							 <tr>	
									<td>
										���:
									</td>
									<td>
										<textarea rows="5" cols="50" name="hpa_contents" id="hpa_contents"></textarea>
									</td>
								</tr>	
						</div>
				</div>		
		
		
		 		    <input type="hidden" name="hpa_empnum" id="hpa_empnum" value="<%=mvo.getHm_empnum() %>"/>
		 		    <input type="hidden" name="hpa_name" id="hpa_name" value="<%=mvo.getHm_name() %>"/>
		 		    <input type="hidden" name="hpa_bposition" id="hpa_bposition" value="<%=bposition%>"/>
		 		    <input type="hidden" name="hpa_bduty" id="hpa_bduty" value="<%=bduty%>"/>
		 		    <input type="hidden" name="hpa_bdept" id="hpa_bdept" value="<%=bdept%>"/>
		 		    <input type="hidden" name="hpa_bteam" id="hpa_bteam" value="<%=bteam %>"/>
		   </form>
			<div>
				
			</div>
			<div>
				<table border="1">
						<colgroup>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
								<col width="120px"/>
						</colgroup>
						<thead>
								<tr>
									<th>�����ȣ</th>
									<th>����</th>
									<th>����</th>
									<th>��å</th>
									<th>�μ�</th>
									<th>��</th>
								</tr>
						</thead>
						<tbody>
								<tr>
									<td align="center"><%=mvo.getHm_empnum() %></td>
									<td align="center"><%=mvo.getHm_name() %></td>
									<td align="center"><%=mvo.getHm_position() %></td>
									<td align="center"><%=mvo.getHm_duty() %></td>
									<td align="center"><%=mvo.getHm_deptnum() %></td>
									<td align="center"><%=mvo.getHm_teamnum() %></td>
									<input type="button" value="�߷ɵ��" name="accept" id="accept">
								</tr>
						</tbody>
				</table>	
			</div>
	</body>
</html>