package com.kh.study;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.study.key.Names;

@Mapper
public interface AbcMapper {

	@Select("SELECT * FROM ABC WHERE name = #{name}")
	Abc a(Names names);

}
