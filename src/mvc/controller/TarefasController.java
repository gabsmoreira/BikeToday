package mvc.controller;

//import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.model.Tarefa;
import mvc.model.TarefasDAO;


public class TarefasController {

 @RequestMapping("criaTarefa")
  public String form() {
  return "formTarefa";
  }
 @RequestMapping("adicionaTarefa")
  public String adiciona(Tarefa tarefa) {
	 TarefasDAO dao = new TarefasDAO();
	 dao.adicionaDescricao(tarefa);
	 return "adicionada";
 }
 
}
