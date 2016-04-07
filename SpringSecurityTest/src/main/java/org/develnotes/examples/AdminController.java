package org.develnotes.examples;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;


@Controller
public class AdminController {
    private static EntityManagerFactory manager;
    public AdminController() {
        manager = Persistence.createEntityManagerFactory("org.develnotes_examples_war_1.0.0-BUILD-SNAPSHOTPU");
    }
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home() {
		return "private/admin";
	}   
        @RequestMapping(value = "/calc", method = RequestMethod.GET)
	public String calc() {
		return "private/calc";
	}  
       @RequestMapping(value = "/success", method = RequestMethod.POST)
    public @ResponseBody String Success(String username) {
       EntityManager managers = manager.createEntityManager();
      List<Test> test = managers.createQuery("from Test where username = :username", Test.class).setParameter("username", username).getResultList();        
        String json = new Gson().toJson(test);
      return json;
    }
        @RequestMapping(value = "/calca", method = RequestMethod.POST)
    public @ResponseBody String Calculator(Double number1, Double number2, int operation,String error ) throws JsonProcessingException {
        Model model = new Model();
        Operation oper = model.calc(number1, number2, operation,error);
        
        
        ObjectMapper mapper = new ObjectMapper();
        String results = mapper.writeValueAsString(oper);
        Integer a=operation;
        UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String Username = user.getUsername();
        EntityManager em = manager.createEntityManager();
        Date date = new Date();
        em.getTransaction().begin();
        Test test = new Test();
        test.setUsername(Username);
        test.setOperation(operation);
        test.setDateTimeOp(date);
        test.setResult(Double.toString(oper.getResult()));
        test.setNumber1(number1);
        test.setNumber2(number2);
       em.persist(test);
        em.getTransaction().commit();
        em.clear();
        return results;
    } 
}
