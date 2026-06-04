package com.kh.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class ClientProgram {
	
	public static void main(String[] args) {
		/*
		 * 클라이언트 프로그램 작성 절차
		 * 
		 * 1) 요청하고자하는 서버의 IP주소와 Port번호를 지정
		 * 2) 서버에 연결요청 보내기 -> Socket객체생성(IP주소, Port번호)
		 * 3) 소켓에서 서버와 통신할 수 있는 입/출력스트림 get
		 * 4) 보조스트림 달기
		 * 5) 스트림을 통해 데이터를 주고 받기
		 * 6) 자원반납!
		 */
		Scanner sc = new Scanner(System.in);
		
		// 자원반납을 위해 참조변수 선언 및 null로 초기화
		Socket socket = null;
		BufferedReader br = null;
		PrintWriter pw = null;
		
		// 1) 요청하고자하는 서버의 IP주소와 Port번호를 지정
		// 요청하고자하는 IP주소 : 내 PC의 IP주소 == 127.0.0.1
		//									   LoopbackIP == localhost
		// 요청하고자하는 Port번호 : 1234
		String serverIp = "127.0.0.1";
		int portNumber = 1234;
		
		try {
			// 2) 서버에게 연결 요청보네기 ->  Socket객체 생성시 인자를 전달하면 됨
			socket = new Socket(serverIp, portNumber);
			
			// 연결 실패시 null값 반환
			if(socket != null) {
				System.out.println("서버와의 연결에 성공하였습니다");
				
				// 3) 입/출력용 스트림 받아오기
				// 4) 보조스트림 달기
				
				// 입력용
				br = 
				new BufferedReader(new InputStreamReader(socket.getInputStream()));
				// 출력용
				pw = 
				new PrintWriter(socket.getOutputStream());
				
				// 5) 데이터 주고받기
				while(true) {
					// 서버로 출력하기
					System.out.println("종료를 원하신다면 exit을 입력해주세요.");
					System.out.print("보낼 메시지 > ");
					String sendMessage = sc.nextLine();
					if(sendMessage.equals("exit")) {
						break;
					}
					pw.println(sendMessage);
					pw.flush();
					
					// 서버로부터 입력받기
					String message = br.readLine();
					System.out.println("메시지가 도착했습니다 > " + message);
				}
			}
			
		}  catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			pw.close();
			try {
				br.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
	}

}
