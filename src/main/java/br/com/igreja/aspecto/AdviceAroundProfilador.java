package br.com.igreja.aspecto;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AdviceAroundProfilador {
	
	private List<Long> tempos = new ArrayList<Long>();

	public List<Long> getTempos() {
		return tempos;
	}
	//@Around("execution(* br.com.igreja.Dao.CaixaDao.*(..))")
	public Object profilar(ProceedingJoinPoint joinPoint) throws Throwable {
		
		long momentoInicial = System.currentTimeMillis();
		Object resultado = joinPoint.proceed();
		long tempo = System.currentTimeMillis() - momentoInicial;
		tempos.add(tempo);
		System.out.println("Tempo para executar = " + tempo + "ms");
		
		return resultado;
	}
	
	public Object profilarMembro(ProceedingJoinPoint joinPoint) throws Throwable {
		
		long momentoInicial = System.currentTimeMillis();
		Object resultado = joinPoint.proceed();
		long tempo = System.currentTimeMillis() - momentoInicial;
		tempos.add(tempo);
		System.out.println("Tempo para executar = " + tempo + "ms");
		
		return resultado;
	}
	@Before("execution(* br.com.igreja.Dao.MembroDao.*(..))")
	public void logBefore(JoinPoint joinPoint) {
 
		System.out.println("logBefore() is running!");
		System.out.println("Metodo executa : " + joinPoint.getSignature().getName());
		System.out.println("Usuario que está executando o Metodo: " + SecurityContextHolder.getContext().getAuthentication().getName());
		System.out.println("******");
	}
	
	//@Before("execution(* br.com.igreja.HomeController.home(..))")
	public void setUsuario(JoinPoint joinPoint) {
	}
	
	public void logAfter(JoinPoint joinPoint) {
 
		System.out.println("logAfter() is running!");
		System.out.println("hijacked : " + joinPoint.getSignature().getName());
		System.out.println("******");
 
	}
	public void depoisDeAtualizar() {
		System.out.println("Depois de Atualizar");
	}
}
