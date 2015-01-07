package br.com.igreja;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.igreja.entidades.Caixa;
import br.com.igreja.entidades.Dizimo;
import br.com.igreja.entidades.Igreja;
import br.com.igreja.enuns.TipoCaixa;
import br.com.igreja.enuns.TipoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoCaixa;
import br.com.igreja.interfaceDao.InterfaceDaoDizimo;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoMembro;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;

@Controller
@Transactional
public class CaixaControler {
	
	@Autowired
	private InterfaceDaoCaixa caixaDao;
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	@Autowired
	private InterfaceDaoDizimo dizimoDao;
	@Autowired
	private InterfaceDaoMembro membroDao;
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	
	private String nomeUsuario;
	
	private BigDecimal saldoMesAtual;
	
	private DecimalFormat formatar = new DecimalFormat("R$ #,##0.00");
	
	@RequestMapping("CaixaCadastro")
	public String registro(Map<String, Object> model, Model tipo, Model mesAtual, Model anoAtual, 
						Model totalEntradaMes, Model totalSaidaMes, Model saldoMes, Model igrejas, 
						Map<String, Object> dizimo, Model membros, Model saldoAnterior) {
		
		if(model.get("caixa") == null) {
			model.put("caixa", new Caixa());
		}
		if(dizimo.get("dizimo") == null) {
			dizimo.put("dizimo", new Dizimo());
		}
		nomeUsuario = SecurityContextHolder.getContext().getAuthentication().getName();
		Igreja igrejasId = igrejaDao.get(usuarioDao.getNome(nomeUsuario));
		
		tipo.addAttribute("tipo", TipoCaixa.values());
		mesAtual.addAttribute("caixas", caixaDao.getIgrejaIdMes(igrejasId.getIdigreja()));
		//anoAtual.addAttribute("caixaAno", caixaDao.getIgrejaIdAno(igrejasId.getIdigreja()));
		
		BigDecimal totalEntradaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		BigDecimal totalSaidaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		//BigDecimal saldoEntradaTrintaDias = caixaDao.saldoAtual(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		//BigDecimal saldoSaidaTrintaDias = caixaDao.saldoAtual(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		BigDecimal entradaMesAnterior = caixaDao.entradaMesAnterior(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		BigDecimal saidaMesAnterior = caixaDao.saidaMesAnterior(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		BigDecimal saldo = entradaMesAnterior.subtract(saidaMesAnterior);
		
		saldoAnterior.addAttribute("saldoAnterior", formatar.format(saldo));
		
		
		saldoMesAtual = saldo.add(totalEntradaMesAtual.subtract(totalSaidaMesAtual));
		
		saldoMes.addAttribute("saldoMes", formatar.format(saldoMesAtual));
		totalEntradaMes.addAttribute("totalEntradaMes", formatar.format(totalEntradaMesAtual));
		totalSaidaMes.addAttribute("totalSaidaMes", formatar.format(totalSaidaMesAtual));
		igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
		membros.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
		
		return "caixa/CaixaCadastro";
	}
	@RequestMapping(value = "salvaCaixa", method = RequestMethod.POST)
	public String salvaCaixa(Caixa caixa) {
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		Date date = new Date();
		String mes = dateFormat.format(date);
		DateFormat format = new SimpleDateFormat("yyyy");
		String ano = format.format(date);
		caixa.setMes(mes);
		caixa.setAno(ano);
		System.out.println(ano);
		
		Igreja igrejasId = igrejaDao.get(caixa.getIgreja().getIdigreja());
		
		caixaDao.salvar(caixa);
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			return "redirect:CaixaCadastroCongregacao";
		}else {
			return "redirect:CaixaCadastro";
		}
		
	}
	
	@RequestMapping("CaixaCadastroCongregacao")
	public String registroCongregacao(Map<String, Object> model, Model tipo, Model mesAtual, Model anoAtual, 
			Model totalEntradaMes, Model totalSaidaMes, Model saldoMes, Model igrejas, 
			Map<String, Object> dizimo, Model membros, Model saldoAnterior) {
		
		if(model.get("caixa") == null) {
			model.put("caixa", new Caixa());
		}
		
		nomeUsuario = SecurityContextHolder.getContext().getAuthentication().getName();
		Igreja igrejasId = igrejaDao.get(usuarioDao.getNome(nomeUsuario));
		
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			
			if(dizimo.get("dizimo") == null) {
				dizimo.put("dizimo", new Dizimo());
			}
			
			igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
			
			membros.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
			
			
			mesAtual.addAttribute("caixas", caixaDao.getIgrejaIdMes(igrejasId.getIdigreja()));
			//anoAtual.addAttribute("caixaAno", caixaDao.getIgrejaIdAno(igrejasId.getIdigreja()));
			
			BigDecimal totalEntradaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
			BigDecimal totalSaidaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.SAIDA, igrejasId.getIdigreja());
			
			//BigDecimal saldoEntradaTrintaDias = caixaDao.saldoAtual(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
			//BigDecimal saldoSaidaTrintaDias = caixaDao.saldoAtual(TipoCaixa.SAIDA, igrejasId.getIdigreja());
			
			tipo.addAttribute("tipo", TipoCaixa.values());
			
			BigDecimal entradaMesAnterior = caixaDao.entradaMesAnterior(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
			BigDecimal saidaMesAnterior = caixaDao.saidaMesAnterior(TipoCaixa.SAIDA, igrejasId.getIdigreja());
			
			BigDecimal saldo = entradaMesAnterior.subtract(saidaMesAnterior);
			
			saldoAnterior.addAttribute("saldoAnterior", formatar.format(saldo));
			
			saldoMesAtual = saldo.add(totalEntradaMesAtual.subtract(totalSaidaMesAtual));
			
			totalEntradaMes.addAttribute("totalEntradaMes", formatar.format(totalEntradaMesAtual));
			totalSaidaMes.addAttribute("totalSaidaMes", formatar.format(totalSaidaMesAtual));
			
			saldoMes.addAttribute("saldoMes", formatar.format(saldoMesAtual));
			return "caixa/CaixaCadastro";
		}else {
			tipo.addAttribute("igreja_idigreja", "igreja.idigreja");
			membros.addAttribute("action", "buscaCongregacao");
			igrejas.addAttribute("igrejas", igrejaDao.getTipo(TipoIgreja.CONGREGAÇÃO));
			return "caixa/CaixaCadastroPesquisa";
		}
		
	}
	
	@RequestMapping("buscaCongregacao")
	public String resgistroDeCongregacaoSede(Map<String, Object> model, Model tipo, Model mesAtual, Model anoAtual, 
			Model totalEntradaMes, Model totalSaidaMes, Model saldoMes, Model igrejas, 
			Map<String, Object> dizimo, Model membros, Caixa caixa, Model saldoAnterior) {
		
		if(model.get("caixa") == null) {
			model.put("caixa", new Caixa());
		}
		
		Igreja igrejasId = igrejaDao.get(caixa.getIgreja().getIdigreja());
		
			
		if(dizimo.get("dizimo") == null) {
			dizimo.put("dizimo", new Dizimo());
		}
		
		igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
		
		membros.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
		
		
		mesAtual.addAttribute("caixas", caixaDao.getIgrejaIdMes(igrejasId.getIdigreja()));
		//anoAtual.addAttribute("caixaAno", caixaDao.getIgrejaIdAno(igrejasId.getIdigreja()));
		
		BigDecimal totalEntradaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		BigDecimal totalSaidaMesAtual = caixaDao.TotalEntradaSaidaMesIgrejaId(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		//BigDecimal saldoEntradaTrintaDias = caixaDao.saldoAtual(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		//BigDecimal saldoSaidaTrintaDias = caixaDao.saldoAtual(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		tipo.addAttribute("tipo", TipoCaixa.values());
		

		BigDecimal entradaMesAnterior = caixaDao.entradaMesAnterior(TipoCaixa.ENTRADA, igrejasId.getIdigreja());
		BigDecimal saidaMesAnterior = caixaDao.saidaMesAnterior(TipoCaixa.SAIDA, igrejasId.getIdigreja());
		
		BigDecimal saldo = entradaMesAnterior.subtract(saidaMesAnterior);
		
		saldoAnterior.addAttribute("saldoAnterior", formatar.format(saldo));
		
		saldoMesAtual = saldo.add(totalEntradaMesAtual.subtract(totalSaidaMesAtual));
		
		totalEntradaMes.addAttribute("totalEntradaMes", formatar.format(totalEntradaMesAtual));
		totalSaidaMes.addAttribute("totalSaidaMes", formatar.format(totalSaidaMesAtual));
		
		saldoMes.addAttribute("saldoMes", formatar.format(saldoMesAtual));
		return "caixa/CaixaCadastro";
	}
	
	@RequestMapping("ListaCaixaData")
	public String ListaCaixaData(String data, Model model) {
		
		
		return "caixa/CaixaCadastro";
	}
	
	@RequestMapping(value = "salvaCaixaJson", method = RequestMethod.POST)
	@ResponseBody
	public Caixa salvaCaixaJson(Caixa caixa) {
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		Date date = new Date();
		String mes = dateFormat.format(date);
		DateFormat format = new SimpleDateFormat("yyyy");
		String ano = format.format(date);
		caixa.setMes(mes);
		caixa.setAno(ano);
		System.out.println(ano);
		
		caixaDao.salvar(caixa);
		
		return caixa;
	}
}
