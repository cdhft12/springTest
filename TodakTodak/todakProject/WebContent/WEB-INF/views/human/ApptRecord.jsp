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
		
		String ser=pageVO.getSearch();
		
		int size=pageVO.getPageSize();
		
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
		
			<jsp:include page="paging.jsp" flush="true">
					<jsp:param name="url" value="/human/apptRecord.td"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
					<jsp:param name="ser" value="<%=ser%>"/>
			</jsp:include>
	</body>
</html>