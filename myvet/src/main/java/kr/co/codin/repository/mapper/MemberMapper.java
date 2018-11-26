package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Member;

public interface MemberMapper {
	void insertMember(Member member);
	int IdCheck(String memberEmail);
	Member selectMemberById(Member member);
}
