package br.com.igreja.lista;

import java.util.ArrayList;
import java.util.List;

import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.Membro_Situacao;

public class GenericList<T> {
	
	private T t;
	
	public void add(T t) {
		this.t = t;
	}
	
	public T get() {
		return t;
	}
	
	public List<Membro> addWidth(List<? extends Membro> list) {
		List<Membro> now = new ArrayList<>();
		for(Membro member : list) {
			member.setNome("nome:" + member.getNome());
			member.setCpf("cpf:" + member.getCpf());
			member.setRg("rg:" + member.getRg());
			member.setEndereco("endereco:" + member.getEndereco());
			member.setBairro("bairro:" + member.getBairro());
			member.setCidade("cidade:" + member.getCidade());
			member.setTelefone("telefone:" + member.getTelefone());
			member.setCelular("celular:" + member.getCelular());
			now.add(member);
		}
		return now;
	}
}
