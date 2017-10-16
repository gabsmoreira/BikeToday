package mvc.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvc.model.Users;
import mvc.model.UsersDAO;

@Controller
public class LoginController {
	
	@RequestMapping("/")
	public String execute() {
		System.out.println("Lógica do MVC");
	return "login";
	}
	
	@RequestMapping("registro")
	public String registro() {
		return "formulario-registro";
	}

	@RequestMapping(value = "efetuaRegistro", method = RequestMethod.POST)
	public String upload(Users users) throws IOException {
		UsersDAO dao = new UsersDAO();
		dao.adiciona(users);
		return "loginForm";
	} 
	
}
