<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java142.todak.etc.utils.LoginSession"%>


<%
	LoginSession sManager = LoginSession.getInstance();
%>

	<h3> ���� ������ �� : <%= sManager.getUserCount()%> </h3>
	<hr>
<%
	if (sManager.isLogin(session.getId()))
	{
%>
		<%= sManager.getUserID(session.getId()) %> �� �α�����.
		<br>
		<p>
		<a href="/etc/logout.td">�α� �ƿ�</a>
<%
	}
	else
	{
%>
		<script type="text/javascript">
			location.href="../../../index.jsp";
		</script>
<%
	}
%>
