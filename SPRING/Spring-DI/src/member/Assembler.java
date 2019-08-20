package member;

//객체를 생성하고 보관하고 관리하는 기능
public class Assembler {
	 
	//보관객체 
	private MemberDao memberDao;
	private MemberRegisterService registService;
	private ChangePasswordService pwService;
	
	
	public Assembler() {
		//객체생성, 주입 
		memberDao = new MemberDao();
		registService = new MemberRegisterService(memberDao);
		pwService = new ChangePasswordService(memberDao);
	
	}

	public MemberDao getMemberDao() {
		return memberDao;
	}

	public MemberRegisterService getRegisterService() {
		return registService;
	}

	public ChangePasswordService getPwService() {
		return pwService;
	}	
	
}
