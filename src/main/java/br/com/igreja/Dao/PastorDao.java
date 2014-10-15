package br.com.igreja.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import br.com.igreja.entidades.Pastor;
import br.com.igreja.interfaceDao.InterfaceDaoPastor;

@Repository
public class PastorDao extends GenericJPADao<Pastor> implements InterfaceDaoPastor {

	@Override
	public List<Pastor> getNome(String nome) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Pastor> getIgreja(String nomeIgreja) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<Pastor> getClazz() {
		return Pastor.class;
	}

}
