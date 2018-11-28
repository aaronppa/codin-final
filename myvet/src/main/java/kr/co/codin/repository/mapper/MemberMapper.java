package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;

public interface MemberMapper {
	void insertMember(Member member);
	int IdCheck(String memberEmail);
	Member selectMemberById(Member member);
	Member selectPasswordById(String memberEmail);
	void insertVetAuth(VetAuth file);
}
