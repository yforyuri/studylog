package member;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class MainForSpring3 {

	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AppContext.class);
		
		MemberDao dao1 = ctx.getBean("memberDao", MemberDao.class);
		MemberDao dao2 = ctx.getBean("memberDao", MemberDao.class);
		
		System.out.println("dao1 == dao2 : " + (dao1 == dao2));
		
	}

}