package com.kh.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.study.key.Names;

@RestController
@RequestMapping("/a")
public class AbcController {
	
	@Autowired
	private AbcService service;
	
	@GetMapping
	public ResponseEntity<?> a(Names names){
		System.out.println(names);
		Abc abc = service.a(names);
		return ResponseEntity.ok(abc);
	}
}
