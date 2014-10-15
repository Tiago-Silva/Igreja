package br.com.igreja;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.entidades.Pastor;
import br.com.igreja.enuns.Estados;
import br.com.igreja.enuns.TipoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoPastor;

@Controller
@Transactional
public class IgrejaControler {
	
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	@Autowired
	private InterfaceDaoPastor pastorDao;
	
	@RequestMapping("IgrejaCadastro")
	public String registro(Map<String, Object> model, Map<String, Object> modelo, Map<String, Object> tipo, Map<String, Object> estado) {
		
		if(model.get("igreja") == null) {
			model.put("igreja", new Igreja());
		}
		
		modelo.put("pastores", pastorDao.getLista(Pastor.class));
		tipo.put("tipos", TipoIgreja.values());
		estado.put("estados", Estados.values());
		return "igreja/IgrejaCadastro";
	}
	
	@RequestMapping(value = "salvaIgreja", method = RequestMethod.POST)
	public String salva(@Valid Igreja igreja, BindingResult result,
			Map<String, Object> model ,
			Map<String, Object> modelo,
			Map<String, Object> tipo,
			Map<String, Object> estado) {
		
		if(result.hasErrors()) {
			
			model.put("igreja", igreja);
			modelo.put("pastores", pastorDao.getLista(Pastor.class));
			tipo.put("tipos", TipoIgreja.values());
			estado.put("estados", Estados.values());
			return registro(model,modelo,tipo,estado);
		}
		
		igrejaDao.salvar(igreja);
		return "redirect:ListaIgreja";
	}
	
	@RequestMapping("ListaIgreja")
	public String ListaIgreja(Model model) {
		model.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		return "igreja/ListaIgreja";
	}
	
	@RequestMapping("ListaIgrejaTipo")
	public String ListaIgrejaTipo(Model model) {
		model.addAttribute("igrejas", igrejaDao.getTipo(TipoIgreja.CONGREGAÇÃO));
		return "igreja/ListaIgrejaTipo";
	}
	
	@RequestMapping("mostraIgreja")
	public String mostraIgreja(Model modelo, Map<String, Object> model, Igreja igreja, Model tipo, Model estado) {
		
		model.put("igreja", igrejaDao.get(igreja.getIdigreja()));
		modelo.addAttribute("pastores", pastorDao.getLista(Pastor.class));
		tipo.addAttribute("tipos", TipoIgreja.values());
		estado.addAttribute("estados", Estados.values());
		return "igreja/AlteraIgreja";
	}
	
	@RequestMapping(value = "AlteraIgreja", method = RequestMethod.POST)
	public String alteraIgreja(Igreja igreja) {
		
		igrejaDao.alterar(igreja);
		return "redirect:ListaIgreja";
	}
}
