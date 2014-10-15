package br.com.igreja.interfaceDao;

import java.util.List;

import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.Funcao;

public interface InterfaceDaoMembro extends InterfaceDaoBase<Membro> {
	
	List<Membro> getNome(String nome);
	
	List<Membro> getIgreja(int idigreja);
	
	public Membro getMembro(int idmembro);
	
	List<Membro> getFuncao(Funcao funcao, int idigreja);
	
	List<Membro> getIdmembro(int id);
	
	List<Membro> getIgrejaJson(int idigreja);
	
	List<Membro> getIgrejaSedeJson(int idigreja);

}
