package br.com.igreja.aspecto;

public class Profilador {
	
	private long tempoInicial;
	private long tempoFinal;
	
	public void iniciarMedicao() {
		tempoInicial = System.currentTimeMillis();
	}
	
	public void finalizarMedicao() {
		tempoFinal = System.currentTimeMillis();
	}
	
	public long tempoExecucao() {
		return tempoFinal - tempoInicial;
	}
}
