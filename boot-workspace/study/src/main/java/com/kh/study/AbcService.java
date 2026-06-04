package com.kh.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.study.key.Names;

@Service
public class AbcService {
	
	@Autowired
	private AbcMapper mapper;

	public Abc a(Names names) {
		Abc abc = mapper.a(names);
		return abc;
	}

}
