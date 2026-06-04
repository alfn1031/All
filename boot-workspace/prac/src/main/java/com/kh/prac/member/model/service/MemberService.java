package com.kh.prac.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.prac.exception.DuplicateMemberIdException;
import com.kh.prac.member.model.dao.MemberMapper;
import com.kh.prac.member.model.dto.MemberDto;

@Service
public class MemberService {
	
	private MemberMapper memberMapper;

	public void signUp(MemberDto member) {
		
		int count = memberMapper.countByMemberId(member.getMemberId());
		
		if(count > 0) {
			throw new DuplicateMemberIdException("이미 존재합니다");
		}
		
	}

}
