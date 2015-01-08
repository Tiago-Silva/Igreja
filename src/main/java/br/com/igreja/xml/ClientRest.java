package br.com.igreja.xml;

import org.springframework.web.client.RestTemplate;

import br.com.igreja.entidades.Membro;

public class ClientRest {
	
	private RestTemplate restTemplate = new RestTemplate();
	
	public Membro getMembros(int idmembro) {
		Membro membro = restTemplate.getForObject("http://localhost:8080/ListaMembrosIgrejaSedeJson/" + idmembro, Membro.class);
		
		return membro;
	}
}
