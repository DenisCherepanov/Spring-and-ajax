<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Вход</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
        <link rel="stylesheet"
              href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />        
        <script src="<c:url value="/resources/core/jquery-2.2.2.min.js" />"></script>      
        <script>
            function Func(datas) {
                var data = $.parseJSON(datas);
                if (data.error === "+") {
                    $("#info").text('Ошибка!Деление на ноль невозможно');
                } else {
                    $("#info").text('Ответ ' + data.result);

                }

            }
            $(document).ready(function () {
                var scrnumber1 = $('#number1'),
                        scrnumber2 = $('#number2');
                scrnumber1.keypress(function (event) {
                    if ((event.charCode < 48 || event.charCode > 57) && event.charCode !== 46 && event.charCode !== 45) {
                        return false;
                    }
                }
                );

                scrnumber2.keypress(function (event) {
                    if ((event.charCode < 48 || event.charCode > 57) && event.charCode !== 46 && event.charCode !== 45) {
                        return false;
                    }
                }
                );

                $("#calculate").click(function () {
                    var number1 = scrnumber1.val(),
                            result,
                            number2 = scrnumber2.val(),
                            operation = $('#operations').val(),
                            data = {number1: number1, number2: number2, operation: operation, result: result};
                    $.ajax({
                        url: 'calca',
                        type: 'POST',
                        data: data,
                        success: Func
                    });
                });
            });
        </script> 
    <center><h1>Калькулятор </h1><center/>
    </head>
    <body>       
        <div class="form-horizontal"">
            <div class="login" >
                <div class="form-group">
                    <label class="col-sm-5 control-label" for="input">Введите число 1:</label>
                    <div class="col-sm-7">
                        <input class="form-control" type='text' id="input" name="number1" placeholder="Первое число"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-5 control-label" for="input2">Введите число 2:</label>
                    <div class="col-sm-7">
                        <input class="form-control" type='text' id="input2" name="number2" placeholder="Второе число"/>
                    </div>
                </div>

                <label class="col-sm-5 control-label" for="operations">Операция:</label>
                <select class="col-sm-3 form-control" name="opt" id="operations">
                    <option value="0"> + </option>
                    <option value="1"> - </option>
                    <option value="2"> * </option>
                    <option value="3"> / </option>
                    <option value="4"> % </option>
                    <option value="5"> ^ </option>
                </select>

                <input class="col-sm-offset-5 btn btn-primary" id="calculate" name="submit" type="submit" value="Подсчитать" />
            </div>        
            <a class="btn btn-primary" href="j_spring_security_logout">Выход</a>
            <p>
                <b>
                    <span id="info"></span>
                </b>
            </p>
            <div/>
            <h2><a href="<c:url value="/calc" />">Перейти на страницу Администратора</a></h2>
    </body>
</html>