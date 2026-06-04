package com.kh.study;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.study.key.Ahchas;

@Mapper
public interface BcdMapper {
	
	@Select("SELECT * FROM BCD WHERE ahcha = #{ahcha}")
	Bcd b(Ahchas ahchas);
	
}
