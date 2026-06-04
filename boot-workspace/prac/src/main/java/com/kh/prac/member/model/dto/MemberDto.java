package com.kh.prac.member.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDto {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String role;
	private String status;
}
