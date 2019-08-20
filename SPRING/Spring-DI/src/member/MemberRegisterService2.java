package member;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("registService")
public class MemberRegisterService2 {
	
	@Autowired
// 	@Qualifier("sys1") 
	private MemberDao memberDao;
	
//	public void setMemberRegisterService2 getMemberRegisterService2() {}
	
//	public MemberRegisterService2(MemberDao memberDao) {
//		this.memberDao = memberDao;
//	}

	public void regist(RegisterRequest request) throws AlreadyExistingMemberException {
		
		Member member = memberDao.selectByEmail(request.getEmail());
		
		if(member != null) {
			throw new AlreadyExistingMemberException();
		}
		
		Member newMember = new Member(request.getEmail(), request.getPassword(), request.getName(), new Date());
		
		memberDao.insert(newMember);
		
	}

}