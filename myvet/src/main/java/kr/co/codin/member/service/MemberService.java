package kr.co.codin.member.service;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;

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
	 * 로그인에 대한 비즈니스 로직 처리
	 * @param member
	 * @return member
	 */
	Member login(Member member);
	
	/**
	 * 수의사 인증 파일 처리에 대한 비즈니스 로직 처리
	 * @param file
	 */
	void uploadVetAuth(VetAuth file);
	
	/**
	 * 이메일 찾기에 대한 비즈니스 로직 처리
	 * @param member
	 * @return member
	 */
	Member findEmail(Member member);
	
	/**
	 * 회원 상세 정보 본인 확인에 대한 비즈니스 로직 처리
	 * @param memberNo
	 * @return member
	 */
	Member myPage(int memberNo);
}
