package br.com.igreja;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

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
import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.TipoCaixa;
import br.com.igreja.enuns.TipoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoCaixa;
import br.com.igreja.interfaceDao.InterfaceDaoDizimo;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoMembro;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;
import br.com.igreja.relatorio.ConnectionFactory;
import br.com.igreja.relatorio.GeradorRelatorio;

@Controller
@Transactional
public class DizimoControler {
	
	@Autowired
	private InterfaceDaoDizimo dizimoDao;
	@Autowired
	private InterfaceDaoMembro membroDao;
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private InterfaceDaoCaixa caixaDao;
	
	private String nomeUsuario;
	
	@RequestMapping("DizimoCadastro")
	public String registro(Map<String, Object> model, Model membro) {
		
		if(model.get("dizimo") == null) {
			model.put("dizimo", new Dizimo());
		}
		
		nomeUsuario = SecurityContextHolder.getContext().getAuthentication().getName();
		Igreja igrejasId = igrejaDao.get(usuarioDao.getNome(nomeUsuario));
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			membro.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
		} else {
			membro.addAttribute("membros", membroDao.getLista(Membro.class));
		}
		
		return "dizimo/DizimoCadastro";
	}
	@RequestMapping(value = "salvaDizimo", method = RequestMethod.POST)
	public String salvaDizimo(Dizimo dizimo) {
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		Date date = new Date();
		String mes = dateFormat.format(date);
		DateFormat format = new SimpleDateFormat("yyyy");
		String ano = format.format(date);
		dizimo.setMes(mes);
		dizimo.setAno(ano);
		DateFormat dateMA = new SimpleDateFormat("dd/MM/yyyy");
		String dataCaixa = dateMA.format(date);
		
		Membro membros = membroDao.getMembro(dizimo.getMembroBean().getIdmembro());
		
		Igreja igrejasId = igrejaDao.get(membros.getIgrejaBean().getIdigreja());
		
		Caixa caixa = new Caixa();
		caixa.setIgreja(igrejasId);
		caixa.setValor(dizimo.getValor());
		caixa.setDescricacao("DIZIMO");
		caixa.setTipo(TipoCaixa.ENTRADA);
		caixa.setData(dataCaixa);
		caixa.setMes(mes);
		caixa.setAno(ano);
		
		dizimoDao.salvar(dizimo);
		caixaDao.salvar(caixa);
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			return "redirect:CaixaCadastroCongregacao";
		} else {
			return "redirect:CaixaCadastro";
		}
		
	}
	@RequestMapping("geraRelatorioDizmo")
	public String buscaIgrejaEMesParaRelatorio(Map<String, Object> caixa, Model igrejas, Model action, Model idigreja) {
		
		if (caixa.get("caixa") == null) {
			caixa.put("caixa", new Caixa());
		}
		
		nomeUsuario = SecurityContextHolder.getContext().getAuthentication().getName();
		Igreja igrejasId = igrejaDao.get(usuarioDao.getNome(nomeUsuario));
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
		} else {
			igrejas.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		}
		
		action.addAttribute("action", "relatorioDizimo");
		idigreja.addAttribute("idigreja", "igreja.idigreja");
		return "dizimo/RelatorioDizimo";
	}
	
	@RequestMapping("relatorioDizimo")
	public void gerar(Caixa caixa, HttpServletResponse response) throws IOException {
		
		try {
			String nome = servletContext.getRealPath("/resources/ireport/dizimo/Dizimo.jasper");
			Map<String, Object> parametros = new HashMap<String, Object>();
			Connection connection = new ConnectionFactory().getConnection();
			
			parametros.put("data", caixa.getMes());
			parametros.put("idigreja", caixa.getIgreja().getIdigreja());
			
			GeradorRelatorio gerador = new GeradorRelatorio(nome, parametros, connection);
			//Aqui gera o PDF.
			gerador.geraPDFParaOutputStream(response.getOutputStream());
		
			
			connection.close();
		} catch (SQLException e) {
			
		}
	}
	
	@RequestMapping(value = "salvaDizimoJson", method = RequestMethod.POST)
	@ResponseBody
	public Caixa salvaDizimoJson(Dizimo dizimo) throws ParseException {
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date date = sdf.parse(dizimo.getData());
		
		String mes = dateFormat.format(date);
		
		DateFormat format = new SimpleDateFormat("yyyy");
		String ano = format.format(date);
		
		dizimo.setMes(mes);
		dizimo.setAno(ano);
		
		String dataCaixa = sdf.format(date);
		
		Membro membros = membroDao.getMembro(dizimo.getMembroBean().getIdmembro());
		
		Igreja igrejasId = igrejaDao.get(membros.getIgrejaBean().getIdigreja());
		
		Caixa caixa = new Caixa();
		caixa.setIgreja(igrejasId);
		caixa.setValor(dizimo.getValor());
		caixa.setDescricacao("DIZIMO");
		caixa.setTipo(TipoCaixa.ENTRADA);
		caixa.setData(dataCaixa);
		caixa.setMes(mes);
		caixa.setAno(ano);
		
		dizimoDao.salvar(dizimo);
		caixaDao.salvar(caixa);
		return caixa;
	}
}
