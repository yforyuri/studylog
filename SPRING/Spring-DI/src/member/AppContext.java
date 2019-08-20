package member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import member.BoardDao;
import member.ChangePasswordService2;
import member.MemberDao;
import member.MemberRegisterService2;

@Configuration
public class AppContext {
	
	
	@Bean(name = "memberDao1")
	@Qualifier("sys1")
	//@Scope("prototype") // singleton(default) -> prototype
	public MemberDao getMemberDao() {
		return new MemberDao();
	}
	
	@Bean
	public BoardDao boardDao() {
		return new BoardDao();
	}
	

	
	
	
	
	
	@Bean(name = "registService2")
	public MemberRegisterService2 getMemberRegisterService2() {
		

		MemberRegisterService2 service = new MemberRegisterService2();

		return service;
	}
	
	@Bean(name = "changePwService2")
	public ChangePasswordService2 getChangePasswordService2() {

		ChangePasswordService2 service = new ChangePasswordService2();

		return service;
	}
}