package dto;

public class Player {
	Integer num; //int 쓰지말것 - 데이터 주고 받을때 null 의 호환성 때문에 (int 에는 null 이 없기때문)
	String name;
	Integer backnum;
	Integer teamnum;
	String teamname;
	
	public Player() {}
	public Player(Integer num, String name, Integer backnum, Integer teamnum) {
		this.num = num;
		this.name = name;
		this.backnum = backnum;
		this.teamnum = teamnum;
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getBacknum() {
		return backnum;
	}
	public void setBacknum(Integer backnum) {
		this.backnum = backnum;
	}
	public Integer getTeamnum() {
		return teamnum;
	}
	public void setTeamnum(Integer teamnum) {
		this.teamnum = teamnum;
	}
	@Override
	public String toString() {
		return String.format("선수번호 : %d, 선수명 : %s, 등번호 : %d, 소속팀 : %s ",
				num, name, backnum, teamname);
	}
}
