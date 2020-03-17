<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	�����ؾ� �� ����
	***********************************/
	String	url = null;
	String	str = null;
	String keyword=null;
	String search=null;
	String ctrl=null;
	String startday=null;
	String endday=null;
	String empnum = null;
	url = request.getParameter("url");
	str = request.getParameter("str");
	keyword=request.getParameter("key");
	search=request.getParameter("ser");
	ctrl=request.getParameter("pageSize");
	startday=request.getParameter("sdate");
	endday=request.getParameter("edate");
	
	
	
	if(str != null)
	{
		str = str + "&";
	}
%>

<%
	/**********************************
	������ �׺���̼� ���� ����
	***********************************/
	// ���������� ������ �Խù��� ��
	int pageSize = 0;
	
	// �׷��� ũ��
	int groupSize = 0;
	
	// ��ü �Խù��� ����
	int totalCount = 0;
	
	//���� ������
	int curPage = 0;
	
	// ��ü �������� ����
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null)
	{
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	
	if(request.getParameter("groupSize") != null)
	{
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
	}
	
	if(request.getParameter("curPage") != null)
	{
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
	
	if(request.getParameter("totalCount") != null)
	{
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
	}
	
	// ��ü�Խù����� ������ũ�⸦ ������ ��ü ������ ������ �����.
	// �Ҽ����� ���� ������ ������ ������ �Ѱ���.

	pageCount = (int)Math.ceil(totalCount / (pageSize+0.0));
	
	// ����׷� ����
	int curGroup = (curPage-1) / groupSize;
	int linkPage = curGroup * groupSize;
%>
<p align="right">
<%
	// ù��° �׷��� �ƴѰ��
	if(curGroup > 0) {
%>
	<a href="<%=url%>?<%=str%>curPage=1&key=<%=keyword %>&ser=<%=search%>&pageCtrl=<%=ctrl%>&startday=<%=startday%>&endday=<%=endday%>">����</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>&key=<%=keyword %>&ser=<%=search%>&pageCtrl=<%=ctrl%>&startday=<%=startday%>&endday=<%=endday%>">��</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
<%
	}
	
	// ���� ��ũ�� ���� ������Ŵ
	linkPage++;
	
	int loopCount = groupSize;
	// �׷���������� ������ ��ũ����.
	while((loopCount > 0) && (linkPage <= pageCount))
	{
		if(linkPage == curPage)
		{
%>
	<%=linkPage%>
<%
		}
		else
		{
%>
	[<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>&key=<%=keyword %>&ser=<%=search%>&pageCtrl=<%=ctrl%>&startday=<%=startday%>&endday=<%=endday%>"><%=linkPage%></a>]&nbsp;
<%
		}
		
		linkPage++;
		loopCount--;
	}
	
	// �����׷��� �ִ� ���
	if(linkPage <= pageCount)
	{
%>
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>&key=<%=keyword %>&ser=<%=search%>&pageCtrl=<%=ctrl%>&startday=<%=startday%>&endday=<%=endday%>">��</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>&key=<%=keyword %>&ser=<%=search%>&pageCtrl=<%=ctrl%>&startday=<%=startday%>&endday=<%=endday%>">����</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>