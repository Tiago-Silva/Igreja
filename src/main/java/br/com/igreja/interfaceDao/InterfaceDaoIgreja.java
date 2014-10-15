package br.com.igreja.interfaceDao;

import java.util.List;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.enuns.TipoIgreja;

public interface InterfaceDaoIgreja extends InterfaceDaoBase<Igreja> {
	
	List<Igreja> getNome(String nome);
	
	List<Igreja> getPastor(String nomePastor);
	
	List<Igreja> getCidade(String cidade);
	
	List<Igreja> getTipo(TipoIgreja tipoIgreja);
	
	String getIgrejaNome(int idigreja);
}
