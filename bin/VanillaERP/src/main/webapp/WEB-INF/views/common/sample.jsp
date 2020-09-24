<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vanilla ERP - 샘플페이지</title>
<!-- 헤더 -->
<c:import url="/header"></c:import>

</head>
<body>
<!-- 탑/레프트 -->
<c:import url="/topLeft">
<%-- 현재 페이지 해당 메뉴번호 지정 --%>
	<c:param name="menuNo" value="4"></c:param>
</c:import>
<!-- 구현내용 -->
<div class="title_wrap">
	<div class="title_table">
		<div class="title_txt">현재 페이지의 타이틀</div>
	</div>
</div>
<div class="contents_area">
	<!-- 내용은 여기에 구현하세요. -->
	<div class="tbl1">
	<select class="select">
		<option>분류 선택</option>
		<option>공지</option>
		<option>질문</option>
		<option>정보</option>
		<option>잡담</option>
	</select> 
	<input type="text" class="search"><input type="button" class="searchBtn">
	<input type="button" value="글쓰기" class="writeBtn">
		<table class="board">
			<colgroup>
				<col width="6%" />
				<col width="*" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<tr class="gong">
					<td>[공지]</td>
					<td>자유게시판 공지</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr class="gong">
					<td>[공지]</td>
					<td>자유게시판 공지</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[질문]</td>
					<td>자유게시판 질문</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[잡담]</td>
					<td>자유게시판 잡담</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[잡담]</td>
					<td>자유게시판 잡담</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[잡담]</td>
					<td>자유게시판 잡담</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[정보]</td>
					<td>자유게시판 정보<div class="file"></div></td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
				<tr>
					<td>[잡담]</td>
					<td>자유게시판 잡담</td>
					<td>관리자</td>
					<td>200623</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>
		<div class="paging">
			<div class="pagingD" id="first"></div>
			<div class="pagingD" id="before"></div>
			<div class="pagingD"><b>1</b></div>
			<div class="pagingD">2</div>
			<div class="pagingD">3</div>
			<div class="pagingD">4</div>
			<div class="pagingD">5</div>
			<div class="pagingD" id="next"></div>
			<div class="pagingD" id="last"></div>
		</div>
	</div>
</div>
<!-- 구현끝 -->
<!-- 바텀 -->
<c:import url="/bottom"></c:import>
</body>
</html>