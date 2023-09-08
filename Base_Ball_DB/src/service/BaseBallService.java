package service;

import java.util.Scanner;

public class BaseBallService {
	//팀등록
	public void regTeam() {
		System.out.println("[팀 등록]");
		System.out.println("팀 명 :");
		String teamName = sc.nextLine();
		System.out.println("팀 명 :");
		String local = sc.nextLine();
		
	}
	
	
	
	//팀조회
	//팀목록조회
	
	//선수 등록
	
	public void regPlayer() {
		System.out.println("[선수 등록]");
		System.out.println("선수 명 :");
		String playerName = sc.nextLine();
		System.out.println("등 번호 :");
		Integer backNum = Integer.parseInt(sc.nextLine());
		System.out.println("팀 선택>>");
		//1: SSG 랜더스
		//2: 키움 히어로즈
		//3: LG 트윈스
		//4: KT 위즈
	}
	
	//특정 선수조회 (이름으로)
	//특정 선수조회 (등 번호로)
	//특정 선수조회 (번호로)
	//특정팀 선수목록 조회
	
	Scanner sc = new Scanner(System.in);
	public int menu() {
		System.out.println("[야구 팀 / 선수 등록 / 조회]");
		System.out.println("1.팀 등록");
		System.out.println("2.특정팀 조회");
		System.out.println("3.팀 목록 조회");
		System.out.println("===========");
		System.out.println("4.선수등록");
		System.out.println("5.특정 선수조회 (이름으로)");
		System.out.println("6.특정 선수조회 (등 번호로)");
		System.out.println("7.특정 선수조회 (번호로)");
		System.out.println("8.특정팀 선수목록 조회");
		System.out.println("선택 >>");
		return Integer.parseInt(sc.nextLine());
	}
	
	
	
}
