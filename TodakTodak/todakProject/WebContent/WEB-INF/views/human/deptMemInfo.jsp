<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>     
<%@ page import="java142.todak.human.vo.MemberVO"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	Object obj=request.getAttribute("memberList");
	ArrayList aList=(ArrayList)obj;
	Object obj2=request.getAttribute("mvo");
	MemberVO pvo=(MemberVO) obj2;
	
	String key=pvo.getKeyword();
	String ser=pvo.getSearch();
	
	int Size=pvo.getPageSize();
	System.out.println(">>>>>>>>>>>>>>>"+key);
	System.out.println("<<<<<<<<<<<<<<<"+ser);
	
	
	int pageSize = pvo.getPageSize();
	int groupSize = pvo.getGroupSize();
	int curPage = pvo.getCurPage();
	int totalCount = pvo.getTotalCount();
	
	if(request.getParameter("curPage") != null)
	{
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
%>
<title>�μ� �������</title>
	<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".goDetail").click(function(){
		
				var empnum=$(this).parents("tr").attr("data");
				alert("�о�� ����"+empnum);
				console.log("�о�� ����"+empnum);
				$("#hm_empnum").val(empnum);
				window.open("","pop","width=980, height=680");
				$("#detailForm").attr({
					"method":"get",
					"target":"pop",
					"action":"/human/reference.td"
				});
				$("#detailForm").submit();
		});
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
			var str1=$("#search").val();
			var str2=$("#keyword").val();
			alert("����"+str1);
			alert("����"+str2);
			$("#page").val(page);
			$("#PageSearch").attr({
				"method":"get",
				"action":"/human/deptReference.td"
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

</head>
	<body>
		<form name="detailForm" id="detailForm">
			<input type="hidden" name="hm_empnum" id="hm_empnum">
		</form>
	<div id="memberList">
		<table summary="��� ��Ȳ ��ȸ">
			<table border="1" align="center">
			
			<thead>	
				<tr>
					<th>�����ȣ</th>
					<th>����</th>
					<th>�μ�</th>
					<th>����</th>
					<th>��å</th>
					<th>�������</th>
					<th>�Ի���</th>
					<th>�ڵ���</th>
					<th>������ȣ</th>
					<th>�̸���</th>
					<th>����</th>	
				</tr>
<%

			if(aList.size()!=0)
			{
				MemberVO mvo=null;
				for(int i=0;i<aList.size();i++){
					mvo=(MemberVO)aList.get(i);
%>
				<tr data='<%=mvo.getHm_empnum() %>'>
					
					<td><%=mvo.getHm_empnum() %></td>
					<td><span class="goDetail"><%=mvo.getHm_name() %></span></td>
					<td><%=mvo.getHm_deptnum() %></td>
					<td><%=mvo.getHm_position() %></td>
					<td><%=mvo.getHm_duty() %></td>
					<td><%=mvo.getHm_birth() %></td>
					<td><%=mvo.getHm_hiredate() %></td>
					<td><%=mvo.getHm_hp() %></td>
					<td><%=mvo.getHm_extensionnum() %></td>
					<td><%=mvo.getHm_email() %></td>
					<td><%=mvo.getHm_employmenttype() %></td>
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
							<option value="hm_name">����</option>
							<option value="hm_position">����</option>
							<option value="hm_deleteYN">���� ����</option>
							<option value="hm_employmenttype">���� ����</option>
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
			<jsp:param name="url" value="/human/deptReference.td"/>
			<jsp:param name="str" value=""/>
			<jsp:param name="pageSize" value="<%=pageSize%>"/>
			<jsp:param name="groupSize" value="<%=groupSize%>"/>
			<jsp:param name="curPage" value="<%=curPage%>"/>
			<jsp:param name="totalCount" value="<%=totalCount%>"/>
			<jsp:param name="key" value="<%=key%>"/>
			<jsp:param name="ser" value="<%=ser%>"/>
		</jsp:include>
		
	</div>
	</body>
	
</html>