package dao;

import java.util.ArrayList;
import java.util.List;

import dto.Team;

public class TeamDAO {
	
	///Connection 파일 만들기 < 어느 한곳에서 만들어서 추출해야하는겨??
	
	
	public int inesertTeam(Team team) {
		int cnt = 0;
		
		//insert 절을 써서 넣기 
		//입력 값이 들어오는 거니 PreparedStatement 를 쓴다 
		
		return cnt;
		
	}
	
	public Team selectTeam(String teamName) {
		Team team = null;
		
		//select 절을 써서 넣기
		//보여지는거기만 하니 그냥 Statement 절만씀
		
		return team;
	}
	
	public List<Team> selectTeamList() {
		List<Team> teamList = new ArrayList<>();
		
		//select 절 써서 넣기
		//보여지는거기만 하니 그냥 Statement 절만씀
		
		return teamList;
	}
	
	
	
}
