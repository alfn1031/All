package com.kh.study;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/c")
public class CdeController {

	@GetMapping
	public ResponseEntity<?> c() {
		return ResponseEntity.ok("c");
	}
	
}
