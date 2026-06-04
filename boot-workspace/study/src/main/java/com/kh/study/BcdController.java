package com.kh.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.study.key.Ahchas;

@RestController
@RequestMapping("/b")
public class BcdController {

	@Autowired
	private BcdService service;
	
	@GetMapping
	public ResponseEntity<?> b(Ahchas ahchas) {
		System.out.println(ahchas);
		Bcd bcd = service.b(ahchas);
		return ResponseEntity.ok("b");
	}
}
