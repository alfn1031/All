package com.kh.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.study.key.Ahchas;

@Service
public class BcdService {

	@Autowired
	private BcdMapper mapper;
		
	public Bcd b(Ahchas achas) {
		Bcd bcd = mapper.b(achas);
		return bcd;
	}
	
}
