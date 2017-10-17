package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "login";
	} 
	
	@RequestMapping(value = "efetuaLogin", method = RequestMethod.POST)
	public String efetuaLogin(Users users,HttpSession session) throws IOException {
		UsersDAO dao = new UsersDAO();
			if (dao.existeUsuario(users)) {
			session.setAttribute("usuarioLogado", users.getUsername());
			return "index";
		}
		else {
			return "login";
		}
		
	}
	
	@RequestMapping("logout")
	 public String logout(HttpSession session) {
	 session.invalidate();
	 return "login";
	 }
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String execute1() {
		return "register";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String execute2() {
		return "login";
	}
	
	@RequestMapping(value = "getImage", method = RequestMethod.GET)
	 public void showImage(@RequestParam("login") String login, HttpServletResponse
	response,HttpServletRequest request)
	 throws ServletException, IOException{
	 UsersDAO dao = new UsersDAO();
	 response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	 response.getOutputStream().write(dao.buscaFoto(login));
	 response.getOutputStream().close();
	 }
	
}
