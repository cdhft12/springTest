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
	%>
	<title>회원가입 승인 목록</title>
	<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".goDetail").click(function(){
				var empnum=$(this).parents("tr").attr("data");
				$("#hmp_empnum").val(empnum);
				
				$("#detailForm").attr({
					"method":"POST",
					
					"action":"/human/approval.td"
				});
				$("#detailForm").submit();
			});
		});
	</script>
	</head>
	<body>
	<div id="apprList">
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="hmp_empnum" id="hmp_empnum">
		</form>
		<table summary="가입 승인 목록">
			<table border="1" align="center">
			
			<thead>	
				<tr>
					<th>등록번호</th>
					<th>성명</th>
					<th>등록일</th>
					<th>경력여부</th>	
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
						<td colspan="5">조회된 정보가 없습니다.</td>
					</tr>
<%					
			}
%>	
			</div>
			</thead>
			</table>
		</table>	
	</body>
	
</html>