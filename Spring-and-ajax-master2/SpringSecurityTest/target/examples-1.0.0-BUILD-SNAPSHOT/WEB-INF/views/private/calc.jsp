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
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Report</h3>
        <select id="username">
            <option value="admin" selected="selected">Admin</option>
            <option value="denis">Denis</option>
            <option value="artem">Artem</option>
        </select>
        <input id="showReport" type="button" value="Построить отчет" />
        
        <div id="content"></div>
        
        <script src="<c:url value="/resources/core/jquery-2.2.0.min.js" />"></script>
        <script>
            var data;
            $(document).ready(function () {
                $('#showReport').click(function() { 
                    var username = $('#username').val(),
                        json = {username: username};   
                   
                    $.ajax({
                        type: 'POST',                                     
                        url: 'success',                                
                        data: json,
                        success: function(res) {
                            data = $.parseJSON(res);
                            var innerHtml = getInnerHtml(data);
                            $('#content').html(innerHtml);
                        }
                    });
                    return false;                                                            
                });
            });
            
            function getInnerHtml(data) {
                var dataLen = data.length,
                    text = "<table cellpadding = \"5\" border = \"1\"><tr><td>№</td><td>Дата операции</td><td>Операция</td></tr>",
                    operation;
                
                if(dataLen === 0) {
                    text = text + "<tr><td colspan=\"3\">Данные отсутствуют!<td></tr>";
                }
                
                for(var i = 0; i < dataLen; i++) {
                    switch(data[i]._operation) {
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
                    
                    text = text + "<tr><td>"+i+"</td><td>"+data[i]._dateTimeOp+"</td><td>"+operation+"</td></tr>";
                }
                
                text = text + "</table>";
                return text;
            }
        </script>
    </body>
</html>
