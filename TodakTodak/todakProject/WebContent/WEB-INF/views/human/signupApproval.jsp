<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java142.todak.human.vo.ApprVO"%>            
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	Object obj=request.getAttribute("approvalMember");
	ApprVO avo=(ApprVO)obj;
	String fulladdr="../../upload/";
	fulladdr=fulladdr+avo.getHmp_picture();
	String education=avo.getHmp_education();
	String workexperience=avo.getHmp_workexperience();
	switch(education){
		case "고졸":
			education="28";
			break;
		case "초대졸":
			education="29";
			break;
		case "대졸":
			education="30";
			break;
		case "석사":
			education="31";
			break;
		case "박사":
			education="32";
			break;
	}
	if(workexperience.equals("경력직")){
		workexperience="65";
	}
	if(workexperience.equals("신입")){
		workexperience="66";
	}
%>
<title>가입승인</title>
<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

		<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
				
		<script type="text/javascript">
	$(document).ready(function(){
		$("#accept").click(function(){
			$("#flag").val("Y");
			$("#approvalMember").attr("action","/human/apprResult.td").submit();
			
		});
		$("#negative").click(function(){
			$("#flag").val("N");
			$("#approvalMember").attr("action","/human/apprResult.td").submit();
			
		});
		 $("#hm_hiredate").datepicker({
	    	 dateFormat: 'yymmdd'
	    	,showMonthAfterYear:true             
	        ,yearSuffix: "년" 
	       	,changeYear: true //콤보박스에서 년 선택 가능
	        ,changeMonth: true //콤보박스에서 월 선택 가능       
	        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
	        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
	        ,dayNamesMin: ['일','월','화','수','목','금','토']
	        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	    });
	});
	</script>
</head>
<body>
	<form name="approvalMember"
		  id="approvalMember"
		  method="POST">
		      <table border="1" align="center">
		      		<tr>
		      			<td colspan="2" align="center">
		      				사원정보
		      			</td>
		      		</tr>
		      		<tr>
						<td align="center">성명</td>
						<td>&nbsp;<input type="text" name="hm_name" id="hm_name" value='<%=avo.getHmp_name() %>' readonly></td>
					</tr>
		      		
					<tr>
						<td align="center">아이디</td>
						<td>&nbsp;<input type="text" name="hm_id" id="hm_id" value='<%=avo.getHmp_id() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">아이디</td>
						<td>&nbsp;<input type="text" name="hm_pw" id="hm_pw" value='<%=avo.getHmp_pw() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">생년월일</td>
						<td>&nbsp;<input type="text" name="hm_birth" id="hm_birth" value='<%=avo.getHmp_birth() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">주민등록번호</td>
						<td>&nbsp;<input type="text" name="hm_residentnum" id="hm_residentnum" value='<%=avo.getHmp_residentnum() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">핸드폰번호</td>
						<td>&nbsp;<input type="text" name="hm_hp" id="hm_hp" value='<%=avo.getHmp_hpnum() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">이메일</td>
						<td>&nbsp;<input type="text" name="hm_email" id="hm_email" value='<%=avo.getHmp_email() %>' readonly></td>
					</tr>	
					<tr>
						<td align="center">사진</td>
						<td><img src= <%=fulladdr %> border=0 width="100" height="100"></td>
					</tr>
					<tr>
						<td align="center">우편번호</td>
						<td>&nbsp;<input type="text" name="hm_postcode" id="hm_postcode" value='<%=avo.getHmp_postcode() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">도로명주소</td>
						<td>&nbsp;<input type="text" name="hm_addr" id="hm_addr" value='<%=avo.getHmp_addr() %>' readonly></td>
					</tr>
					<tr>
					<tr>
						<td align="center">은행</td>
						<td><%=avo.getHmp_bank() %></td>
					</tr>
					<tr>
						<td align="center">예금주명</td>
						<td>&nbsp;<input type="text" name="hm_depositors" id="hm_depositors" value='<%=avo.getHmp_depositors() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">계좌번호</td>
						<td>&nbsp;<input type="text" name="hm_accountnum" id="hm_accountnum" value='<%=avo.getHmp_accountnum() %>' readonly></td>
					</tr>
					<tr>
					<td align="center">최종학력</td>
						<td><%=avo.getHmp_education() %></td>
					</tr>
					<tr>
						<td align="center">학력내용</td>
						<td>&nbsp;<input type="text" name="hm_educontents" id="hm_educontents" value='<%=avo.getHmp_educontents() %>' readonly></td>
					</tr>
					<tr>
						<td align="center">경력</td>
						<td><%=avo.getHmp_workexperience() %></td>
					</tr>
					<tr>
						<td align="center">경력내용</td>
						<td>&nbsp;<input type="text" name="hm_workcontents" id="hm_workcontents" value='<%=avo.getHmp_workcontents() %>' readonly></td>
					</tr>	
					<tr>
					<td align="center">부서</td>
						<td><SELECT NAME = "hm_deptnum">
							<OPTION VALUE="00">경영지원본부</OPTION>
							<OPTION VALUE="01">전략기획본부</OPTION>
							<OPTION VALUE="02">마케팅본부</OPTION>
							<OPTION VALUE="03">나눔사업본부</OPTION>
						</SELECT></td>
					</tr>
					<tr>
					<td align="center">팀</td>
						<td><SELECT NAME = "hm_teamnum">
							<OPTION VALUE="04">인재경영팀</OPTION>
							<OPTION VALUE="05">재무팀</OPTION>
							<OPTION VALUE="06">관리팀</OPTION>
							<OPTION VALUE="07">기획팀</OPTION>
							<OPTION VALUE="08">소통협력팀</OPTION>
							<OPTION VALUE="09">IT팀</OPTION>
							<OPTION VALUE="10">홍보팀</OPTION>
							<OPTION VALUE="11">배분팀</OPTION>
							<OPTION VALUE="12">혁신사업팀</OPTION>
							<OPTION VALUE="67">없음</OPTION>
						</SELECT></td>
					</tr>
					<tr>
					<td align="center">직위</td>
						<td>
							<SELECT NAME = "hm_position">
								<OPTION VALUE="13">임원</OPTION>
								<OPTION VALUE="14">부장</OPTION>
								<OPTION VALUE="15">과장</OPTION>
								<OPTION VALUE="16">대리</OPTION>
								<OPTION VALUE="17">사원</OPTION>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td align="center">직책</td>
						   <td>
								<SELECT NAME = "hm_duty">
									<OPTION VALUE="18">팀장</OPTION>
									<OPTION VALUE="19">본부장</OPTION>
									<OPTION VALUE="20">대표이사</OPTION>
									<OPTION VALUE="67">없음</OPTION>
								</SELECT>
						  </td>
					</tr>
					
					<tr>
						<td align="center">내선번호</td>
						<td>&nbsp;<input type="text" name="hm_extensionnum" id="hm_extensionnum"></td>
					</tr>
					<tr>
						<td align="center">고용일</td>
						<td>&nbsp;<input type="text" name="hm_hiredate" id="hm_hiredate"></td>
					</tr>
					<tr>
						<td align="center">고용형태</td>
						   <td>
								<SELECT NAME = "hm_employmenttype">
									<OPTION VALUE="24">정규직</OPTION>
									<OPTION VALUE="25">계약직</OPTION>
								</SELECT>
						  </td>
					</tr>		
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="hm_workexperience" id="hm_workexperience" value="<%=workexperience %>">
							<input type="hidden" name="hm_education" id="hm_education" value="<%=education %>">
							<input type="hidden" name="hm_bank" id="hm_bank" value="38">
							<input type="hidden" name="hm_picture" id="hm_picture" value="<%=avo.getHmp_picture() %>">
							<input type="hidden" name="hmp_empnum" id="hmp_empnum" value="<%=avo.getHmp_empnum() %>">
							<input type="hidden" name="flag" id="flag">
							<input type="button" value="수락" name="accept" id="accept">
							<input type="button" value="거부" name="negative" id="negative">
						</td>
					</tr>
		      </table>
		 </form>
	</body>
</html>