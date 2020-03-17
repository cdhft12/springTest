<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java142.todak.human.vo.MemberVO"%>  
 <%@ page import="java142.todak.common.vo.PagingVO"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사원정보</title>
	<%
		Object obj=request.getAttribute("Info");
		MemberVO mvo=(MemberVO)obj;
		String rnum=mvo.getHm_residentnum();
		String str=rnum.substring(0,6)+"-";
		String str2=rnum.substring(6);
		rnum=str+str2;
	
	%>
</head>
	<body>
		<table align="center" width="800" border="1" cellspacing="0">
				<tr align="center" height = "5">
					<td colspan = "3"rowspan="4"></td>
					<td colspan="5" bgcolor="#ffcccc"><b>사&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;보</b></td>
				</tr>
				<tr align="center" height = "5">
					<td rowspan="2">성 명</td>
					<td rowspan="2" colspan="2">
						<%=mvo.getHm_name() %>
					</td>
					<td colspan="2" width="40%" >주민등록번호</td>
				</tr>
				<tr align="center" height = "25">
					<td colspan="2"><%=rnum %></td>
				</tr>
				<tr align="center" height = "5">
					<td>생년월일</td>
					<td colspan="2"><%=mvo.getHm_birth()%></td>
					<td colspan="2" width="40%" >사원번호</td>
				</tr>
				<tr align="center"  height = "5" >
					<td colspan="3">이메일 주소</td>
					<td colspan="3"><%=mvo.getHm_email() %></td>
					<td colspan="3"><%=mvo.getHm_empnum() %></td>
				</tr>
				<tr align="center"  height = "5">
					<td colspan="3"> 직위/직책 </td>
					<td width="15%">직위</td>
					<td width="15%"><%=mvo.getHm_position() %></td>
					<td width="15%">직책</td>
					<td colspan="2"><%=mvo.getHm_duty() %></td>
				</tr>
				<tr align="center"  height = "5">
					<td colspan="3"> 주소 </td>
					<td colspan="5"><%=mvo.getHm_addr() %></td>
				</tr>	
				
		</table>
	</body>
</html>