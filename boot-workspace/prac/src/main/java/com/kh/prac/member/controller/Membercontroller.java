package com.kh.prac.member.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.prac.member.model.dto.MemberDto;
import com.kh.prac.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/memberz")
@RequiredArgsConstructor
public class Membercontroller {

	private final MemberService memberService;
	
	public ResponseEntity<Void> signUp(@RequestBody MemberDto member) {
		memberService.signUp(member);
		return null;
	}
	
}
