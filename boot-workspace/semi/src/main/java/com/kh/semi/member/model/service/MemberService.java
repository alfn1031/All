package com.kh.semi.member.model.service;


import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.semi.auth.model.vo.CustomUserDetails;
import com.kh.semi.exception.CustomAuthenticationException;
import com.kh.semi.exception.DuplicateMemberIdException;
import com.kh.semi.exception.FailSignUpException;
import com.kh.semi.member.model.dao.MemberMapper;
import com.kh.semi.member.model.dto.MemberDto;
import com.kh.semi.member.model.dto.UpdatePasswordDto;
import com.kh.semi.member.model.vo.Member;
import com.kh.semi.token.model.dao.TokenMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberMapper memberMapper;
	private final TokenMapper tokenMapper;
	private final PasswordEncoder passwordEncoder;
	
	/*
	 * 현재 메소드는 Transactional을 붙이나 안붙리나 기능상의 차이는 존재하지 않음
	 * 
	 * 확장성 => 미래의 메소드에 한 줄 추가 헸을 때 원자성이 자동으로 보장됨
	 * 
	 * 컨벤션, 유지보수
	 * 
	 * 커넥션, sqlSession 재활용
	 */
	@Transactional
	public void signUp(MemberDto member) {
		// 비밀번호 암호화
		
		// 아이디 중복 감지
		int count = memberMapper.countByMemberId(member.getMemberId());
		
		if(count > 0) {
			throw new DuplicateMemberIdException("이미 존재하는 아이디입니다");
		}
		
		Member memberEntity = Member.builder().memberId(member.getMemberId())
											  .memberPwd(passwordEncoder.encode(member.getMemberPwd()))
											  .memberName(member.getMemberName())
											  .role("ROLE_USER")
											  .build();
		
		// log.info("만들어진 멤버 : {}", memberEntity);
		int result = memberMapper.signUp(memberEntity);
		// 일반적 -> Mapper에서 성공실패 여부를 반환 => 정수값으로 ~
		// result = 0;
		if(1 > result) {
			throw new FailSignUpException("잠시 후 다시 시도해주세요.");
		}
	}
	
	@Transactional
	public void changePassword(CustomUserDetails user, UpdatePasswordDto upd) {
		// 사용자가 입력한 기존 비밀번호, DB에 저장된 기존 비밀번호 암호문
		String memberPwd = upd.getMemberPwd();
		String encodedPwd = user.getPassword();
		/*
		if(!passwordEncoder.matches(memberPwd, encodedPwd)) {
			throw new CustomAuthenticationException("비밀번호가 일치하지 않습니다");
		} 
		*/
		validatedPassword(memberPwd, encodedPwd);
		String newPassword = passwordEncoder.encode(upd.getUpdatePwd());
		memberMapper.changePassword(user.getUsername(), newPassword);
		
	}
	
	@Transactional
	public void deleteByPassword(String password, CustomUserDetails user) {
		validatedPassword(password, user.getPassword());
		memberMapper.deleteByPassword(user.getUsername());	
		tokenMapper.deleteToken(user.getUsername());
	}
	
	private void validatedPassword(String rawPassword, String encodedPassword) {
		if(!passwordEncoder.matches(rawPassword, encodedPassword)) {
			throw new CustomAuthenticationException("비밀번호가 일치하지 않습니다");
		
		}
	}
	
	// 실습 겸 숙제
	// 오늘 한 작업을 그대로 반복
	// 새 프로젝트 만들기 => 새 회원용 테이블 만들기
	// 새 회원가입기능 만들기ㄹ
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
