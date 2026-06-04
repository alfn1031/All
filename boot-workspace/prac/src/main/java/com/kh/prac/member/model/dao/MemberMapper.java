package com.kh.prac.member.model.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.prac.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	@Insert("INSERT INTO PRAC_MEMBER VALUES(#{memberId}, #{memberPwd}, #{memberName}, #{role}, #{status})")
	int signUp(Member member);	
	
	@Select("SELECT COUNT(*) FROM PRAC_MEMBER WHERE MEMBER_ID = #{memberId}")
	int countByMemberId(String memberId);
	
}
