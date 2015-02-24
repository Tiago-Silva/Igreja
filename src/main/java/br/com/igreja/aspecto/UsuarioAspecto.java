package br.com.igreja.aspecto;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;


@Component
@Aspect
public class UsuarioAspecto {
	
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	
	private String nomeUsuario;
	
	/*
	//@Before("execution(* br.com.igreja.CaixaControler.registroCongregacao(..))")
	public void buscaIgrejaDoUsuario(JoinPoint joinPoint) {
		Usuario usuario = usuarioDao.getUsuario(SecurityContextHolder.getContext().getAuthentication().getName());
		Igreja igreja = igrejaDao.get(usuario.getIgrejaIdigreja());
		System.out.println("Setando o valor da igreja pelo usuário");
	}*/
	
	@Around("execution(* br.com.igreja.MembroControler.*(br.com.igreja.entidades.Igreja,..))")
	public Object buscaIgrejaDoUsuarioParaMembro(ProceedingJoinPoint joinPoint) throws Throwable {
		nomeUsuario = SecurityContextHolder.getContext().getAuthentication().getName();
		
		Igreja igrejasId = (Igreja) joinPoint.getArgs()[0];
		igrejasId = igrejaDao.get(usuarioDao.getNome(nomeUsuario));
		
		Object[] resultado = new Object[joinPoint.getArgs().length];
		resultado[0] = igrejasId;
		
		for(int i = 1; i < joinPoint.getArgs().length; i++) {
			resultado[i] = joinPoint.getArgs()[i];
			System.out.println("Spring AOP Around dentro do for");
		}
		
		Object result = joinPoint.proceed(resultado);
		System.out.println("Setando Paremetro de metodo com Spring AOP");
		
		return result;
	}
}
