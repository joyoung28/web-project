<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function bidding() {
		
		//alert("p_end_date = ${pInfo.p_end_date}, date = ${date}");
		
		if ("${pInfo.p_end_date }" < "${date}") {
			alert("경매가 종료된 상품입니다.");
			return;
		}
		
		frm.action = "../product/priceInput.do";
		frm.submit();
	}
	
	function history() {
		frm.action = "../product/priceHistory.do";
		frm.submit();
	}
	
	function list_view() {
		frm.action = "../product/myBidding.do";
		frm.submit();
	}
	
</script>
</head>

<body>

	<h3>상품 상세설명 화면</h3>
	<form action="" name="frm">
		<input type="hidden" name="id" value="${pInfo.id }">
		<input type="hidden" name="gubun" value="${gubun}">
		<input type="hidden" name="p_num" value="${pInfo.p_num }">
		<input type="hidden" name="p_name" value="${pInfo.p_name }">
		<input type="hidden" name="p_class_name1" value="${pInfo.p_class_name1 }">
		<input type="hidden" name="p_class_name2" value="${pInfo.p_class_name2 }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="p_image" value="${pInfo.p_image }">
		<table>
			<tr>
				<td align="center"><img alt="${pInfo.p_name }" src="../../fileSave/${pInfo.p_image }"></td>
				<td>
					<tr>상품 번호 : ${pInfo.p_name }</tr>
						<li>대분류 : ${pInfo.p_class_name1 }</li>
						<li>소분류 : ${pInfo.p_class_name2 }</li>
						<li>사용여부 : ${pInfo.p_used }</li>
						<li>경매시작일 : ${pInfo.p_start_date }</li>
						<li>경매종료일 : ${pInfo.p_end_date }</li>
						<li>경매결과 : ${pInfo.p_auct_desc }</li>
						<li>가격 : ${pInfo.p_price }원</li>
					</tr>
					<input type="submit" onclick="bidding()"   value="Bidding참여">&nbsp;
					<input type="submit" onclick="history()"   value="가격 History">&nbsp;
					<input type="submit" onclick="list_view()" value="목록보기">
					<!-- <input type="submit" onclick="history.go(-1)" value="돌아가기"> -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>