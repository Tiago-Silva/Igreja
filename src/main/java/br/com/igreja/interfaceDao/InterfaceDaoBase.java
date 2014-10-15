package br.com.igreja.interfaceDao;

import java.util.List;

public interface InterfaceDaoBase<T> {
	
	void salvar(T objeto);
	List<T> getLista(Class<T> classe);
	void excluir(T objeto);
	void alterar(T objeto);
	public T get(int id);
}
