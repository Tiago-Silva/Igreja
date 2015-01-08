package br.com.igreja.lista;

import java.util.ArrayList;
import java.util.List;

import br.com.igreja.entidades.Membro;

public class TesteLista {
	
	public static void main(String[] args) {
		Membro membro = new Membro();
		
		membro.setNome("Pedro");
		membro.setCpf("08098098");
		membro.setRg("08080980");
		membro.setBairro("Centro");
		membro.setCidade("Bahia");
		membro.setCelular("9779798");
		
		List<Membro> lista = new ArrayList<Membro>();
		
		lista.add(membro);
		
		for(Membro m : lista) {
			System.out.println(m.getNome());
		}
		
		GenericList<Membro> novaLista = new GenericList<>();
		lista = novaLista.addWidth(lista);
		
		for(Membro m : lista) {
			System.out.println(m.getNome());
		}
	}

}
