package br.com.igreja;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.BatismoEspirito;
import br.com.igreja.enuns.EstadoCivil;
import br.com.igreja.enuns.Estados;
import br.com.igreja.enuns.Funcao;
import br.com.igreja.enuns.Membro_Situacao;
import br.com.igreja.enuns.OrgaoRg;
import br.com.igreja.enuns.Sexo;
import br.com.igreja.enuns.TipoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoMembro;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;
import br.com.igreja.relatorio.ConnectionFactory;
import br.com.igreja.relatorio.GeradorRelatorio;

@Controller
@Transactional
public class MembroControler {
	
	@Autowired
	private InterfaceDaoMembro membroDao;
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	@Autowired
	private ServletContext servletContext;
	
	private String nomeUsuario;
	
	@RequestMapping("MembroCadastro")
	public String registro(Igreja igrejasId, Map<String, Object> model, Model modelo, Model sexo, 
			Model estado, Model estadoCivil, Model funcao, Model batismoEspirito, Model orgaoRg, Model situacao) {
		
		if(model.get("membro") == null) {
			model.put("membro", new Membro());
		}
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			modelo.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
			
		} else {
			modelo.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		}
		
		sexo.addAttribute("sexo", Sexo.values());
		estado.addAttribute("estados", Estados.values());
		estadoCivil.addAttribute("estadoCivil", EstadoCivil.values());
		funcao.addAttribute("funcoes", Funcao.values());
		batismoEspirito.addAttribute("batismoEspirito", BatismoEspirito.values());
		orgaoRg.addAttribute("orgaoRg", OrgaoRg.values());
		situacao.addAttribute("situacao", Membro_Situacao.values());
		return "membro/MembroCadastro";
	}
	
	@RequestMapping(value = "salvaMembro", method = RequestMethod.POST)
	public String salvaMembro(Igreja igrejasId, @Valid Membro membro, BindingResult result, @RequestParam(value = "imagem", required =  false) MultipartFile imagem,
			Map<String, Object> model, Model modelo, Model sexo, 
			Model estado, Model estadoCivil, Model funcao, Model batismoEspirito, Model orgaoRg, Model situacao) {
		
		if (!imagem.isEmpty()) {
            try {
                membro.setFoto(imagem.getBytes());
            } catch (Exception e) {
                return "You failed to upload " + membro.getNome() + " => " + e.getMessage();
            }
        } 
		
		if(result.hasErrors()) {
			
			if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
				modelo.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
				
			} else {
				modelo.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
			}
			sexo.addAttribute("sexo", Sexo.values());
			estado.addAttribute("estados", Estados.values());
			estadoCivil.addAttribute("estadoCivil", EstadoCivil.values());
			funcao.addAttribute("funcoes", Funcao.values());
			batismoEspirito.addAttribute("batismoEspirito", BatismoEspirito.values());
			orgaoRg.addAttribute("orgaoRg", OrgaoRg.values());
			situacao.addAttribute("situacao", Membro_Situacao.values());
			return registro(igrejasId, model, modelo, sexo, estado, estadoCivil, funcao, batismoEspirito, orgaoRg, situacao);
		}
		
		membroDao.salvar(membro);
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			return "redirect:ListaMembroCongregacao";
			
		} else {
			return "redirect:ListaTodosMembros";
		}
	}
	
	@RequestMapping("ListaTodosMembros")
	public String ListaTodosOsMembros(Model model) {
		
		model.addAttribute("membros", membroDao.getLista(Membro.class));
		return "membro/ListaMembro";
	}
	
	@RequestMapping(value = "ListaTodosMembrosJson/{idmembro}", method = RequestMethod.GET, produces =  "application/json")
	@ResponseBody
	public List<Membro> getMembro(@PathVariable("idmembro") int idmembro) {
		
		List<Membro> membros = membroDao.getIdmembro(idmembro);
		return membros;
	}
	
	@RequestMapping(value = "ListaMembrosIgrejaJson/{idigreja}", method = RequestMethod.GET, produces =  "application/json")
	@ResponseBody
	public List<Membro> getMembroPorIgreja(@PathVariable("idigreja") int idigreja) {
		List<Membro> membros = membroDao.getIgrejaJson(idigreja);
		return membros;
	}
	
	@RequestMapping(value = "ListaMembrosIgrejaSedeJson/{idigreja}", method = RequestMethod.GET, produces =  "application/json")
	@ResponseBody
	public List<Membro> getMembroSedeJson(@PathVariable("idigreja") int idigreja) {
		
		List<Membro> membros = membroDao.getIgrejaSedeJson(idigreja);
		return membros;
	}
	
	@RequestMapping("ListaMembroSede")
	public String ListaMembroSede(Igreja igrejasId, Model model, Model igrejaNome) {
		
		igrejaNome.addAttribute("igrejaNome", igrejasId.getNome());
		model.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
		return "membro/ListaMembro";
	}
	
	@RequestMapping("ListaMembroCongregacao")
	public String ListaMembroCongregacao(Igreja igrejasId, Model model, Model action, Map<String, Object> membro, Model idigreja, Model igrejaNome) {
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			igrejaNome.addAttribute("igrejaNome", igrejasId.getNome());
			model.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
			return "membro/ListaMembro";
		} else {
			
			if(membro.get("membro") == null) {
				membro.put("caixa", new Membro());
			}
			idigreja.addAttribute("igreja_idigreja", "igrejaBean.idigreja");
			model.addAttribute("igrejas", igrejaDao.getTipo(TipoIgreja.CONGREGAÇÃO));
			action.addAttribute("action", "BuscaMembroCongregacao");
			return "caixa/CaixaCadastroPesquisa";
		}
	}
	
	@RequestMapping("BuscaMembroCongregacao")
	public String BuscaMembroCongregacao(Model listaMembro, Membro membro, Model igrejaNome) {
		
		igrejaNome.addAttribute("igrejaNome", igrejaDao.getIgrejaNome(membro.getIgrejaBean().getIdigreja()));
		listaMembro.addAttribute("membros", membroDao.getIgreja(membro.getIgrejaBean().getIdigreja()));
		return "membro/ListaMembro";
	}
	
	@RequestMapping("ListaObreirosSede")
	public String ListaPresbiteroSede(Igreja igrejasId, Model model, String funcao) {
		
		model.addAttribute("membros", membroDao.getFuncao(Funcao.valueOf(funcao), igrejasId.getIdigreja()));
		return "membro/ListaMembro";
	}
	
	@RequestMapping("ListaObreiros")
	public String ListaPresbiterosCongregacao(Igreja igrejasId, Model model, Map<String, Object> membro, Model action, String funcao, Model funcoes, Model idigreja) {
		
		if(membro.get("membro") == null) {
			membro.put("caixa", new Membro());
		}
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			model.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
			action.addAttribute("action", "BuscaObreirosCongregacao");
			funcoes.addAttribute("funcoes", Funcao.values());
			idigreja.addAttribute("igreja_idigreja", "igrejaBean.idigreja");
			return "caixa/CaixaCadastroPesquisa";
		} else {
			
			
			model.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
			action.addAttribute("action", "BuscaObreirosCongregacao");
			funcoes.addAttribute("funcoes", Funcao.values());
			idigreja.addAttribute("igreja_idigreja", "igrejaBean.idigreja");
			return "caixa/CaixaCadastroPesquisa";
		}
	}
	
	@RequestMapping("BuscaObreirosCongregacao")
	public String BuscaPresbiteroCongregacao(Model listaMembro, Membro membro) {
		listaMembro.addAttribute("membros", membroDao.getFuncao(membro.getFuncao(), membro.getIgrejaBean().getIdigreja()));
		return "membro/ListaMembro";
	}
	
	@RequestMapping("mostraMembro")
	public String mostraMembro(Model modelo, Map<String, Object> model, Membro membro, Model sexo, 
			Model estado, Model estadoCivil, Model funcao, Model batismoEspirito, Model orgaoRg, Model situacao) {
		Membro membros = membroDao.getMembro(membro.getIdmembro());
		
		/*try {
			FileOutputStream fos = new FileOutputStream("/home/tiago/workspace/workspace/Igreja/src/main/webapp/resources/img/aluno/output.jpg");
			try {
				fos.write(membros.getFoto());
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(membros.getFoto() != null) {
			ImageIcon image = new ImageIcon(membros.getFoto());
			
		}*/
		
		/*try {
			ServletOutputStream out = response.getOutputStream();
			foto.addAttribute("foto", ImageIO.write(membros.getFoto(), "jpg", response.getOutputStream()));
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		model.put("membro", membroDao.get(membros.getIdmembro()));
		modelo.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		sexo.addAttribute("sexo", Sexo.values());
		estado.addAttribute("estados", Estados.values());
		estadoCivil.addAttribute("estadoCivil", EstadoCivil.values());
		funcao.addAttribute("funcoes", Funcao.values());
		batismoEspirito.addAttribute("batismoEspirito", BatismoEspirito.values());
		orgaoRg.addAttribute("orgaoRg", OrgaoRg.values());
		situacao.addAttribute("situacao", Membro_Situacao.values());
		
		return "membro/AlteraMembro";
	}
	
	@RequestMapping("fotoMembro")
	public void exibiImagem(HttpServletResponse response, Membro membro) {
		Membro membros = membroDao.getMembro(membro.getIdmembro());
		
		if (membros.getFoto() != null) {
			try {
				response.getOutputStream().write(membros.getFoto());
				response.getOutputStream();
				response.getOutputStream().flush();
				response.getOutputStream().close();
				response.setStatus(200);
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "AlteraMembro", method = RequestMethod.POST)
	public String alteraMembro(Membro membro, @RequestParam(value = "imagem", required =  false) MultipartFile imagem) {
		
		if (!imagem.isEmpty()) {
            try {
                membro.setFoto(imagem.getBytes());
            } catch (Exception e) {
                return "You failed to upload " + membro.getNome() + " => " + e.getMessage();
            }
        } 
		
		membroDao.alterar(membro);
		return "redirect:ListaMembroSede";
	}
	
	@RequestMapping(value = "RemoveMembro", method = RequestMethod.POST)
	public void remove(Membro membro, HttpServletResponse response) {
		membroDao.excluir(membro);
		response.setStatus(200);
	}
	
	@RequestMapping("cartaoMembro")
	public void cartaoMembro(Membro membro, HttpServletResponse response) throws IOException {
		
		try {
			String nome = servletContext.getRealPath("/resources/ireport/membro/CartaoMembro.jasper");
			Map<String, Object> parametros = new HashMap<String, Object>();
			Connection connection = new ConnectionFactory().getConnection();
			
			parametros.put("Paidigreja", membro.getIgrejaBean().getIdigreja());
			
			GeradorRelatorio gerador = new GeradorRelatorio(nome, parametros, connection);
			//Aqui gera o PDF.
			gerador.geraPDFParaOutputStream(response.getOutputStream());
		
			
			connection.close();
		} catch (SQLException e) {
			
		}
		
	}
	
	@RequestMapping("pesquisaCartaoMembro")
	public String buscaIgrejaCartaMembro(Igreja igrejasId, Map<String, Object> membro, Model igrejas, Model action, Model idigreja) {
		
		if (membro.get("membro") == null) {
			membro.put("caixa", new Membro());
		}
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
		} else {
			igrejas.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		}
		
		action.addAttribute("action", "cartaoMembro");
		idigreja.addAttribute("idigreja", "igrejaBean.idigreja");
		return "dizimo/RelatorioDizimo";
	}
	
	@RequestMapping("pesquisaCartaoMembroPorNome")
	public String pesquisaCartaoMembroPorNome(Igreja igrejasId, Map<String, Object> membro, Model igrejas, Model action, Model idigreja, Model membros) {
		if (membro.get("membro") == null) {
			membro.put("caixa", new Membro());
		}
		
		if(igrejasId.getTipoIgreja() == TipoIgreja.CONGREGAÇÃO) {
			igrejas.addAttribute("igrejas", igrejaDao.getNome(igrejasId.getNome()));
			membros.addAttribute("membros", membroDao.getIgreja(igrejasId.getIdigreja()));
		} else {
			igrejas.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
			membros.addAttribute("membros", membroDao.getLista(Membro.class));
		}
		
		action.addAttribute("action", "cartaoMembroPorNome");
		idigreja.addAttribute("idigreja", "igrejaBean.idigreja");
		return "dizimo/RelatorioDizimo";
	}
	
	@RequestMapping("cartaoMembroPorNome")
	public void geracartaoMembroPorNome(Membro membro, HttpServletResponse response) throws IOException {
		
		try {
			String nome = servletContext.getRealPath("/resources/ireport/membro/CartaoMembroNome.jasper");
			Map<String, Object> parametros = new HashMap<String, Object>();
			Connection connection = new ConnectionFactory().getConnection();
			
			parametros.put("Paidigreja", membro.getIgrejaBean().getIdigreja());
			parametros.put("Paidmembro", membro.getIdmembro());
			
			GeradorRelatorio gerador = new GeradorRelatorio(nome, parametros, connection);
			//Aqui gera o PDF.
			gerador.geraPDFParaOutputStream(response.getOutputStream());
		
			
			connection.close();
		} catch (SQLException e) {
			
		}
		
	}
	
}
