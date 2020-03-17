<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>   
<%@ page import="java142.todak.human.vo.ApptVO"%>      
<%@ page import="java142.todak.common.vo.PagingVO"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<%
		Object obj=request.getAttribute("apptList");
		ArrayList aList = (ArrayList)obj;
		ApptVO apvo=null;
		Object obj2=request.getAttribute("apvo");
		
		ApptVO pageVO=(ApptVO)obj2;
		String key=pageVO.getKeyword();
		String ser=pageVO.getSearch();
		
		int Size=pageVO.getPageSize();
		
		int pageSize = pageVO.getPageSize();
		int groupSize = pageVO.getGroupSize();
		int curPage = pageVO.getCurPage();
		int totalCount = pageVO.getTotalCount();
		
		if(request.getParameter("curPage") != null)
		{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
		
	%>
</head>
<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
		if('<%=key %>' != 'null'){
			$("#keyword").val('<%=key %>');
			$("#search").val('<%=ser %>');
		}
		if('<%=Size %>' > 0){
			$("#pageCtrl").val('<%=Size %>');
		}
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("��ü����� ��ȸ");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		$("#selectData").click(function(){
			if($("#search").val()!="all"){
				if(!chkSubmit($('#keyword'),"�˻��"))return;
			}
			goPage(1);
		});
		
		$("#pageCtrl").change(function(){
			goPage(1);
		});
		
	});

	function goPage(page){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#PageSearch").attr({
			"method":"get",
			"action":"/human/apptAllselect.td"
		});
		$("#PageSearch").submit();
	}
	function chkSubmit(v_item,v_msg){
		if(v_item.val().replace(/\s/g,"")==""){
			alert(v_msg+"Ȯ���� �ּ���.");
			v_item.val("");
			v_item.focus();
			return false;
		}else{
			return true;
		}
	}
	</script>
	<body>
			
				<table border="1" align="center">
					<thead>
						<tr>
							<th>�߷ɹ�ȣ</th>
							<th>�̸�</th>
							<th>�߷���</th>
							<th>�߷ɳ���</th>
							<th>���</th>
						</tr>
<%
					
					if(aList.size()>0)
					{
						for(int i=0;i<aList.size();i++){
							apvo=(ApptVO)aList.get(i);		
					
%>					
						<tr>
							<th><%=apvo.getHpa_tablenum()  %></th>
							<th><%=apvo.getHpa_name()  %></th>
							<th><%=apvo.getHpa_appointmentdate()  %></th>
<%
							if(apvo.getHpa_appointment().equals("����")){							
%>							
							<th>
								<%=apvo.getHpa_appointment() %>&nbsp;&nbsp;
								���� ����/��å<%=apvo.getHpa_bposition() %>/<%=apvo.getHpa_bduty() %><br>
								���� ����/��å<%=apvo.getHpa_aposition() %>/<%=apvo.getHpa_aduty() %>
							</th>							
<%
							}
							if(apvo.getHpa_appointment().equals("�μ��̵�")){
%>			
							<th>
								<%=apvo.getHpa_appointment() %>&nbsp;&nbsp;
								���� �μ�/��<%=apvo.getHpa_bdept() %>/<%=apvo.getHpa_bteam() %><br>
								���� �μ�/��<%=apvo.getHpa_adept() %>/<%=apvo.getHpa_ateam() %>
							</th>	
<%
							}
%>		
							<th><%=apvo.getHpa_contents() %></th>							
						</tr>	
<%
						}
					}
					if(aList.size()==0){
%>					
						<tr>
							<td colspan="5">��ȸ�� ������ �����ϴ�.</td>
						</tr>
<%
					}
%>					
					</thead>
				</table>
			<div id="StatusSearch" name="StatusSearch">
			<form id="PageSearch" name="PageSearch">
				<input type="hidden" id="page" name="page" value="1"/>
			
				<table summary="�˻�">
				<tr>
					<td id="std1">
						<label>�˻�����</label>
						<select id="search" name="search">
							<option value="all">��ü</option>
							<option value="hpa_name">����</option>
							<option value="hpa_empnum">�����ȣ</option>
						</select>
						<input type="text" name="keyword"
							id="keyword" value="�˻�� �Է��ϼ���"/>
						<input type="button" value="�˻�" id="selectData"/>	
					</td>
					<td id="std1">
						<select id="pageCtrl" name="pageCtrl">
							<option value="5">5��</option>
							<option value="10">10��</option>
							<option value="20">20��</option>
							<option value="30">30��</option>
							<option value="50">50��</option>
						</select>
					</td>	
				</tr>
				</table>
			</form>
		</div>
			<jsp:include page="paging.jsp" flush="true">
					<jsp:param name="url" value="/human/apptAllselect.td"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
					<jsp:param name="key" value="<%=key%>"/>
					<jsp:param name="ser" value="<%=ser%>"/>
			</jsp:include>
	</body>
</html>