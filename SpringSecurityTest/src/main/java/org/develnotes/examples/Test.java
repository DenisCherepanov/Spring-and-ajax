package org.develnotes.examples;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Test implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long _id;
    
    @Column(name="DateTimeOp")
    private Date _dateTimeOp;
    @Column(name="Username")
    private String _username;
    @Column(name="Number1")
    private double _number1;
    @Column(name="Operation")
    private int _operation;
    @Column(name="Number2")
    private double _number2;
    @Column(name="Result")
    private String _result;
    
    public Long getId() {
        return _id;
    }

    public void setId(Long id) {
        this._id = id;
    }

    public String getUsername() {
        return _username;
    }

    public void setUsername(String username) {
        this._username = username;
    }
    
    public int getOperation() {
        return _operation;
    }

    public void setOperation(int operation) {
        this._operation = operation;
    }
    
    public double getNumber1() {
        return _number1;
    }

    public void setNumber1(double number1) {
        this._number1 = number1;
    }
    
    public double getNumber2() {
        return _number2;
    }

    public void setNumber2(double number2) {
        this._number2 = number2;
    }
    
    public void setResult(String result) {
        this._result = result;
    }

    public String getResult() {
        return _result;
    }
    
    public Date getDateTimeOp() {
        return _dateTimeOp;
    }

    public void setDateTimeOp(Date dateTime) {
        this._dateTimeOp = dateTime;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (_id != null ? _id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Test)) {
            return false;
        }
        Test other = (Test) object;
        if ((this._id == null && other._id != null) || (this._id != null && !this._id.equals(other._id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Log[ id=" + _id + " ]";
    }
    
}