<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>  
<%@ page import="java142.todak.human.vo.ApprVO"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<%
		Object obj=request.getAttribute("apprList");
		ArrayList aList=(ArrayList)obj;
		ApprVO avo=null;
		
		Object obj2=request.getAttribute("avo");
		ApprVO pvo=(ApprVO) obj2;
		
		int Size=pvo.getPageSize();		
		
		int pageSize = pvo.getPageSize();
		int groupSize = pvo.getGroupSize();
		int curPage = pvo.getCurPage();
		int totalCount = pvo.getTotalCount();
		
		if(request.getParameter("curPage") != null)
		{
			curPage = Integer.parseInt(request.getParameter("curPage"));
		}
	%>
	<title>ȸ������ ���� ���</title>
	<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			if('<%=Size %>' > 0){
				$("#pageCtrl").val('<%=Size %>');
			}
			$(".goDetail").click(function(){
				var empnum=$(this).parents("tr").attr("data");
				$("#hmp_empnum").val(empnum);
				
				$("#detailForm").attr({
					"method":"POST",
					
					"action":"/human/approval.td"
				});
				$("#detailForm").submit();
			});
			$("#pageCtrl").change(function(){
				goPage(1);
			});
		});
		function goPage(page){
		
			$("#page").val(page);
			$("#PageSearch").attr({
				"method":"get",
				"action":"/human/selectAppr.td"
			});
			$("#PageSearch").submit();
		}
	</script>
	</head>
	<body>
	<div id="apprList">
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="hmp_empnum" id="hmp_empnum">
		</form>
		<table summary="���� ���� ���">
			<table border="1" align="center">
			
			<thead>	
				<tr>
					<th>��Ϲ�ȣ</th>
					<th>����</th>
					<th>�����</th>
					<th>��¿���</th>	
				</tr>
<%

			if(aList.size()>0)
			{
				for(int i=0;i<aList.size();i++){
					avo=(ApprVO)aList.get(i);
%>
				<tr data='<%=avo.getHmp_empnum() %>'>
					
					<td><span class="goDetail"><%=avo.getHmp_empnum() %></span></td>
					<td><%=avo.getHmp_name() %></td>
					<td><%=avo.getHmp_insertdate() %></td>
					<td><%=avo.getHmp_workexperience() %></td>
		
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
			</div>
			</thead>
			</table>
		</table>	
			<div id="StatusSearch" name="StatusSearch">
			<form id="PageSearch" name="PageSearch">
				<input type="hidden" id="page" name="page" value="1"/>
			
				<table summary="�˻�">
				<tr>
					<td id="std1">
						<select id="pageCtrl" name="pageCtrl">
							<option value="5">5��</option>
							<option value="1">10��</option>
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
			<jsp:param name="url" value="/human/selectAppr.td"/>
			<jsp:param name="str" value=""/>
			<jsp:param name="pageSize" value="<%=pageSize%>"/>
			<jsp:param name="groupSize" value="<%=groupSize%>"/>
			<jsp:param name="curPage" value="<%=curPage%>"/>
			<jsp:param name="totalCount" value="<%=totalCount%>"/>
		
		</jsp:include>
	</body>
	
</html>