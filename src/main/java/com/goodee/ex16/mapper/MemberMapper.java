package com.goodee.ex16.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.goodee.ex16.domain.MemberDTO;

@Mapper
public interface MemberMapper {
	public int insertMember(MemberDTO member);
}
