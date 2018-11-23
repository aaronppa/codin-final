package kr.co.codin.member.service;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;

@Service
public interface MemberService {
	/**
	 * 회원 가입에 대한 비즈니스 로직
	 * @param member
	 */
	void signup(Member member);
	
	/**
	 * 회원 이메일 중복 체크에 대한 비즈니스 로직
	 * @param memberEmail
	 * @return integer
	 */
	int idCheck(String memberEmail);
}
