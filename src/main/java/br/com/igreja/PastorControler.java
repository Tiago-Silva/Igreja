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

import br.com.igreja.entidades.Pastor;
import br.com.igreja.enuns.EstadoCivil;
import br.com.igreja.enuns.Estados;
import br.com.igreja.enuns.OrgaoRg;
import br.com.igreja.interfaceDao.InterfaceDaoPastor;

@Controller
@Transactional
public class PastorControler {
	
	@Autowired
	private InterfaceDaoPastor pastorDao;
	
	@RequestMapping("PastorCadastro")
	public String registro(Map<String, Object> model, Model estado, Model civil, Model orgaoRg) {
		
		if(model.get("pastor") == null) {
			model.put("pastor", new Pastor());
		}
		civil.addAttribute("civil", EstadoCivil.values());
		estado.addAttribute("estados", Estados.values());
		orgaoRg.addAttribute("orgaoRg", OrgaoRg.values());
		return "pastor/PastorCadastro";
	}
	@RequestMapping(value = "salvaPastor", method = RequestMethod.POST)
	public String salva(@Valid Pastor pastor, BindingResult result, Map<String, Object> model, Model estado, Model civil, Model orgaoRg) {
		
		if(result.hasErrors()) {
			model.put("pastor", pastor);
			civil.addAttribute("civil", EstadoCivil.values());
			estado.addAttribute("estados", Estados.values());
			orgaoRg.addAttribute("orgaoRg", OrgaoRg.values());
			return registro(model, estado, civil, orgaoRg);
		}
		
		pastorDao.salvar(pastor);
		return "redirect:ListaPastor";
	}
	@RequestMapping("ListaPastor")
	public String ListPastor(Model model) {
		
		model.addAttribute("pastores", pastorDao.getLista(Pastor.class));
		return "pastor/ListaPastor";
	}
	@RequestMapping("mostraPastor")
	public String mostraPastor(Map<String, Object> model, Pastor pastor, Model estado, Model civil) {
		
		model.put("pastor", pastorDao.get(pastor.getIdpastor()));
		estado.addAttribute("estados", Estados.values());
		civil.addAttribute("civil", EstadoCivil.values());
		return "pastor/AlteraPastor";
	}
	@RequestMapping(value = "AlteraPastor", method = RequestMethod.POST)
	public String alteraPastor(Pastor pastor) {
		
		pastorDao.alterar(pastor);
		return "redirect:ListaPastor";
	}
}
