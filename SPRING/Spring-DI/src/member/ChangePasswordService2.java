package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("changePasswordService")
public class ChangePasswordService2 {
	
	@Autowired
	// @Qualifier("sys1") 
	private MemberDao memberDao;
	
//	public void setMemberDao(MemberDao memberDao) {
//		this.memberDao = memberDao;
//	}
	
//	public ChangePasswordService(MemberDao dao) {
//		memberDao = dao;
//	}
	
	public void changePassword(
			String email, 
			String oldPassword, 
			String newPassword) throws MemberNotFoundException, IdPasswordNotMatchingException {
		
		Member member = memberDao.selectByEmail(email);
		
		if(member == null) {
			throw new MemberNotFoundException();
		}
		member.changePassword(oldPassword, newPassword);
		
		memberDao.update(member);
	}
	

}