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


@Controller
public class AdminController {
   // public EntityManagerFactory emFactory=Persistence.createEntityManagerFactory("org.develnotes_examples_war_1.0.0-BUILD-SNAPSHOTPU");
    
	
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
      // EntityManager manager = emFactory.createEntityManager();
     //  List<NewEntity> logs = manager.createQuery("from NewEntity where username = :username", NewEntity.class).setParameter("username", username).getResultList();        
      //  String json = new Gson().toJson(logs);
      // return json;
       return "";
    }
        @RequestMapping(value = "/calca", method = RequestMethod.POST)
    public @ResponseBody String Calculator(Double number1, Double number2, int operation,String error ) throws JsonProcessingException {
        Model model = new Model();
        Operation oper = model.calc(number1, number2, operation,error);
        ObjectMapper mapper = new ObjectMapper();
        String results = mapper.writeValueAsString(oper);
        return results;
    } 
}
