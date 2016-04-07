<%-- 
    Document   : calc
    Created on : 19.03.2016, 23:25:10
    Author     : Денис
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
        <link rel="stylesheet"
              href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />       
        <title>Журнал событий</title>
    </head>
    <body>
        <h3>Журнал событий</h3>
        <div class="form-group">
            <select id="username">
                <option value="admin" selected="selected">Admin</option>
                <option value="denis">Denis</option>
                <option value="artem">Artem</option>
            </select>
            <input class="btn btn-info btn-xs" type="submit" id="show" value="Построить отчёт"> 

            <div class="tableLog" id="content"></div>
            <p>           
                <a class="btn btn-primary" href="j_spring_security_logout">Выход</a>
            </p>
        </div>
        <script src="<c:url value="/resources/core/jquery-2.2.0.min.js" />"></script>
        <script>
            var data;
            $(document).ready(function () {
                $('#show').click(function () {
                    var username = $('#username').val(),
                            json = {username: username};

                    $.ajax({
                        type: 'POST',
                        url: 'success',
                        data: json,
                        success: function (res) {
                            data = $.parseJSON(res);
                            var innerHtml = getInnerHtml(data);
                            $('#content').html('<table cellpadding = \"5\" border = \"1\" class=\"table table-striped\">' + innerHtml);
                        }
                    });
                    return false;
                });
            });

            function getInnerHtml(data) {
                var dataLen = data.length,
                        text = "<tr><th>№</th><th>Дата операции</th><th>Число1</th><th>Операция</th><th>Число2</th><th>Результат</th></th>",
                        operation;

                if (dataLen === 0) {
                    text = text + "<tr><td colspan=\"3\">Данные отсутствуют!<td></tr>";
                }

                for (var i = 0; i < dataLen; i++) {
                    switch (data[i]._operation) {
                        case 0:
                            operation = "+";
                            break;
                        case 1:
                            operation = "-";
                            break;
                        case 2:
                            operation = "*";
                            break;
                        case 3:
                            operation = "/";
                            break;
                        case 4:
                            operation = "pow";
                            break;
                        case 5:
                            operation = "percent";
                            break;
                    }
                    text = text + "<tr><td>" + i + "</td><td>" + data[i]._dateTimeOp + "</td><td>" + data[i]._number1 + "</td><td>" + operation + "</td><td>" + data[i]._number2 + "</td><td>" + data[i]._result + "</td></tr>" + "</td></tr>";
                }

                text = text + "</table>";
                return text;
            }
        </script>
    </body>
</html>
