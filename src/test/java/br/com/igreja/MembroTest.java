package br.com.igreja;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.igreja.entidades.Membro;
import br.com.igreja.interfaceDao.InterfaceDaoMembro;

public class MembroTest {
	
	@Autowired
	InterfaceDaoMembro membroDao;
	
	@Test
	public void ListaTodosMembros() {
		
		int a = 1;
		List<Membro> membros = membroDao.getIdmembro(a);
		System.out.println(membros);
	}
}
