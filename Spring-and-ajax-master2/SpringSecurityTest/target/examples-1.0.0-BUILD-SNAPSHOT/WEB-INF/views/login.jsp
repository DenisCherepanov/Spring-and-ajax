<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false"%>
<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<title>Вход</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
</head>

<body onload='document.f.j_username.focus();'>

	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>
		<div class="logincontainer">

			<div class="login">
				<table>
					<tr>
						<td>Имя <input type='text' name='j_username'>
						</td>
					</tr>
					<tr>
						<td>Пароль <input type='password' name='j_password' />
						</td>
					</tr>
				</table>
				<br /> <input class="btn btn-primary" name="submit" type="submit"
					value="Вход" /> <br />
			</div>
			<c:if test="${not empty error}">
				<div class="alert alert-danger" style="width: 285px; margin: 0px auto;" role="alert">
					${error}</div>
			</c:if>
		</div>
	</form>
</body>
</html>