/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.develnotes.examples;

/**
 *
 * @author Денис
 */
public class Model {

    public Operation calc(Double number1, Double number2, int operation, String error) {
        double res = 0;
        Operation object = new Operation();
        object.setNumber1(number1);
        object.setNumber2(number2);
        object.setOperation(operation);
        object.setError(error);
        object.setResult(res);
        try {
            Type type = Type.values()[operation];
            switch (type) {
                case PLUS:
                    res = number1 + number2;
                    break;
                case MINUS:
                    res = number1 - number2;
                    break;
                case MUL:
                    res = number1 * number2;
                    break;
                case DIV:
                    if (number2 == 0.0) {
                        error = "+";
                        break;
                    } else {
                        error = "Данные верны";
                        res = number1 / number2;
                        break;
                    }
                case POW:
                    res = Math.pow(number1, number2);
                    break;
                case PROCENT:
                    res = number1 * number2 / 100;
                    break;
            }

            object.setError(error);
            object.setResult(res);
        } catch (Exception e) {
            
        }
        return object;
    }
}
