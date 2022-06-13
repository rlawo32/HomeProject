<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function(){
		fnInit();
		fnAdd();
		fnList();
	})
	function fnList() {
			
	}
	// 2. 회원추가
	function fnAdd() {
		$('#btnAdd').on('click', function(){
			// 추가할 회원 정보를 JSON으로 만든다.
			// JACKSON이 DTO, MAP 형태로 바꾸어 준다.
			let member = JSON.stringify(
				{
					id: $('#id').val(),
					name: $('#name').val(),
					gender: $(':radio[name="gender"]:checked').val(),
					address: $('#address').val()
				}		
			);
			// ajax 처리
			$.ajax({
				// 요청
				url: '${contextPath}/members',
				type: 'POST',
				data: member,
				contentType: 'application/json',
				// 응답
				dataType: 'json',
				success: function(obj){
					if(obj.res > 0){
						alert('회원이 등록되었습니다.');
						fnInit();
						fnList();
					} else {
						alert('회원이 등록되지 않았습니다.');
					}
				},
				error: function(jqXHR){ // controller의 response로 응답
					if(jqXHR.status == 501){ // 아이디 중복
						alert(jqXHR.responseText);						
					} else if(jqXHR.status == 502){ // 필수 정보 누락 코드
						alert(jqXHR.responseText);
					}
				}
			})
		})
	}
	// 1. 초기화
	function fnInit() {
		$('#btnInit').on('click', function(){
			$('#id').val('').prop('readonly', false);
			$('#name').val('');
			$(':radio[name="gender"]').prop('checked', false);
			$('#address').val('');
		})
		$('#id').val('').prop('readonly', false);
		$('#name').val('');
		$(':radio[name="gender"]').prop('checked', false);
		$('#address').val('');
	}
	
	</script>
</head>
<body>

	<h1>회원관리</h1>
	
	<div>
		아이디 <input type="text" name="id" id="id"><br>
		이름 <input type="text" name="name" id="name"><br>
		성별 <label for="male"><input type="radio" name="gender" value="M" id="male">남</label>
		<label for="female"><input type="radio" name="gender" value="F" id="female">여</label><br>
		주소 <input type="text" name="address" id="address"><br><br>
		<input type="button" value="초기화" id="btnInit">
		<input type="button" value="등록" id="btnAdd">
		<input type="button" value="수정" id="btnChange">
	</div>
	
	<hr>
	
	<table border="1">
		<caption id="paging"></caption>
		<thead>
			<tr>
				<td><input type="checkbox"></td>
				<td>아이디</td>
				<td>이름</td>
				<td>성별</td>
				<td>주소</td>
				<td>단추</td>
			</tr>
		</thead>
		<tbody id="members"></tbody>
		<tfoot>
			<tr>
				<td colspan="6">
					<input type="button" value="선택삭제" id="btnRemove">
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>