package dao;

import java.util.ArrayList;
import java.util.List;

import dto.Player;


///Connection 메소드 만들기
//close 메소드 만들기

/**
 * 메소드마다 공통적으로 들어가야하는것
 * Statement 에 대한 예외처리
 * 값을 받는 반복문(whlie)
 * 
 * **/


public class PlayerDAO {
	public int inesertPlayer(Player player) {
		int cnt = 0;
		
		return cnt;
		
	}
	
	public List<Player> selectPlayerByName(String name) {
		List<Player> playerList = new ArrayList<>();
		
		return playerList;
	}
	
	public Player selectPlayerByNum(Integer num) {
		Player player = null;
		
		return player;
	}
	
	public List<Player> selectPlayerByTeam(String teamName) {
		List<Player> playerList = new ArrayList<>();
		
		
		
		return playerList;
	}
	
	
	
	
	
	
}
