package kr.co.codin.member.service;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;

@Service
public interface MemberService {
	/**
	 * 회원 가입에 대한 비즈니스 로직 처리
	 * @param member
	 */
	void signup(Member member);
	
	/**
	 * 회원 이메일 중복 체크에 대한 비즈니스 로직 처리
	 * @param memberEmail
	 * @return integer
	 */
	int idCheck(String memberEmail);
	
	/**
	 * 회원 가입에 대한 비즈니스 로직 처리
	 * @param member
	 * @return member
	 */
	Member login(Member member);
}
