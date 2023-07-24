<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == null}">
	<form name="checkForm" method="post" action="confirmId.jsp">
		<table border="1">
		  <tr> 
		    <td height="39" >${email}이미 사용중인 이메일입니다.</td>
		  </tr>
		  <tr>
		    <td>다른 아이디를 선택하세요.</td>
		  </tr>
		  <tr>
		    <td>
		       <input type="text" size="10" maxlength="12" name="id"> 
		       <input type="submit" value="ID중복확인">
		    </td>
		  </tr>
		</table>
	</form>
</c:if>
<c:if test="${result == null}">
		<table width="300" border="1">
		  <tr> 
		    <td align="center">입력하신 ${email}은 사용하실 수 있는 이메일입니다.</td>
		    <td>
		      <input type="button" value="닫기" onclick="setid()">
		    </td>
		  </tr>
		</table>
</c:if>
</body>
</html>