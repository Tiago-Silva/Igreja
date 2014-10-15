package br.com.igreja.interfaceDao;

import java.util.List;

import br.com.igreja.entidades.Pastor;

public interface InterfaceDaoPastor extends InterfaceDaoBase<Pastor>{

	List<Pastor> getNome(String nome);
	
	List<Pastor> getIgreja(String nomeIgreja);
}
