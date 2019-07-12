package member;

public class LoginInfo {

	private String id;
	private String name;
	private String photo;
	private String nickname;
	private int grade;
	private String pNum;

	public LoginInfo(String id, String name, String photo, String nickname, int grade, String pNum) {
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.nickname = nickname;
		this.grade = grade;
		this.pNum = pNum;
	}

	public LoginInfo(String id) {
		this.id = id;
		this.name = "summer";
		this.photo = "noimg";
		this.nickname = "summer";
		this.grade = 1;
		this.pNum = "010-2222-1111ß";
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhoto() {
		return photo;
	}

	public String getNickname() {
		return nickname;
	}

	public int getGrade() {
		return grade;
	}

	public String getpNum() {
		return pNum;
	}

}
