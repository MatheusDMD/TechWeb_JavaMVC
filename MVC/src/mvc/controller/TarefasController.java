package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.model.Tarefa;
import mvc.model.TarefaDAO;
import javax.validation.Valid;



@Controller
public class TarefasController {

    @RequestMapping("/")
    public String execute() {
        System.out.println("Lógica do MVC");
        return "info";
    }
    
    @RequestMapping("criaTarefa")
    public String form() {
        return "formTarefa";
    }
/*    @RequestMapping("adicionaTarefa")
    public String adiciona(Tarefa tarefa) {
    	TarefaDAO dao = new TarefaDAO();
    	dao.adiciona(tarefa);
        return "adicionada";
    }
  */  
    @RequestMapping("listaTarefas")
    public String lista(Model model) {
        TarefaDAO dao = new TarefaDAO();
        model.addAttribute("tarefas", dao.getLista());
        return "lista";
    }
    
    @RequestMapping("removeTarefa")
    public String remove(Tarefa tarefa) {
        TarefaDAO dao = new TarefaDAO();
        dao.remove(tarefa);
        return "redirect:listaTarefas";
    }
    
    @RequestMapping("adicionaTarefa")
    public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
    	TarefaDAO dao = new TarefaDAO();
    	dao.adiciona(tarefa);
        return "redirect:listaTarefas";
        }
    
    @RequestMapping("alteraEstado")
    public String alteraEstado( Tarefa tarefa, BindingResult result) {
    	TarefaDAO dao = new TarefaDAO();
    	dao.alteraEstado(tarefa);
        return "redirect:listaTarefas";
        }
    
    @RequestMapping("sort")
    public String sort(String by) {
    	TarefaDAO dao = new TarefaDAO();
    	dao.sort(by);
        return "redirect:listaTarefas";
        }
    
}