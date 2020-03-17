<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="java.util.ArrayList" %>     
 <%@ page import="java142.todak.human.vo.MemberVO"%>
 <%@ page import="java142.todak.human.vo.StatusVO"%>  
  <%@ page import="java142.todak.common.vo.PagingVO"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<%	
		Object obj=request.getAttribute("memberList");
		ArrayList aList =(ArrayList) obj;
		
		Object obj2=request.getAttribute("hvo");
		MemberVO pvo=(MemberVO) obj2;
		
		Object obj3=request.getAttribute("svo");
		StatusVO stvo=(StatusVO) obj3;
		
		String tCnt=stvo.getHs_total();
		String cCnt=stvo.getHs_current();
		String rCnt=stvo.getHs_regular();
		String conCnt=stvo.getHs_constract();
		
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
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��� ���</title>
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
				"action":"/human/select.td"
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
	<table>
		<thead>	
				<tr>
					<th>���ο�</th>
					<th>�����ο�</th>
					<th>������</th>
					<th>�����</th>
				</tr>
				<tr>
					<th><%=tCnt %></th>
					<th><%=cCnt %></th>
					<th><%=rCnt %></th>
					<th><%=conCnt %></th>
					
				</tr>
	</table>
	<body>
	<div id="memberList">
		<table summary="��� ��Ȳ ��ȸ">
			<table border="1" align="center">
			
			<thead>	
				<tr>
					<th>�����ȣ</th>
					<th>����</th>
					<th>�μ�</th>
					<th>����</th>
					<th>�������</th>
					<th>�Ի���</th>
					<th>�ڵ���</th>
					<th>������ȣ</th>
					<th>�̸���</th>
					<th>����</th>
					<th>����</th>		
				</tr>
<%

			
	
			if(aList.size()!=0)
			{
				MemberVO mvo=(MemberVO)aList.get(0);
				for(int i=0;i<aList.size();i++){
					mvo=(MemberVO)aList.get(i);
%>
				<tr>
					<th><%=mvo.getHm_empnum() %></th>
					<th><%=mvo.getHm_name() %></th>
					<th><%=mvo.getHm_deptnum() %></th>
					<th><%=mvo.getHm_position() %></th>
					<th><%=mvo.getHm_birth() %></th>
					<th><%=mvo.getHm_hiredate() %></th>
					<th><%=mvo.getHm_hp() %></th>
					<th><%=mvo.getHm_extensionnum() %></th>
					<th><%=mvo.getHm_email() %></th>
					<th><%=mvo.getHm_employmenttype() %></th>
					<th><%=mvo.getHm_deleteyn() %></th>
				</tr>
<%
			
				}
			}
			if(aList.size()==0){
%>									
					<tr><td colspan="5">��ȸ�� ������ �����ϴ�.</td>
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
							<option value="hm_deptnum">�μ���</option>
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
			<jsp:param name="url" value="/human/select.td"/>
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