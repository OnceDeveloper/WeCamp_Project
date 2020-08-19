package com.wecamp.mapper;

import com.wecamp.model.Member;

public interface MemberMapper {
	public int emailCheck(String email);
	public int signUp(Member member);
	public int approval_member(Member member);
	public Member login(String email);
	public int update_pwd(Member member);
	public int delete_member(Member member);
}
