package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;

public interface MemberMapper {
	/**
	 * 회원가입
	 * @param member
	 */
	void insertMember(Member member);
	
	/**
	 * 이메일 중복 확인
	 * @param memberEmail
	 * @return 데이터베이스에 있는 이메일 갯수
	 */
	int IdCheck(String memberEmail);
	
	/**
	 * 로그인
	 * @param member
	 * @return member
	 */
	Member selectMemberById(Member member);
	
	/**
	 * 로그인할 때 암호화되어 저장된 비밀번호 가져올 수 있게 하는 로직
	 * @param memberEmail
	 * @return member
	 */
	Member selectPasswordById(String memberEmail);
	
	/**
	 * 수의사 인증 파일 업로드
	 * @param file
	 */
	void insertVetAuth(VetAuth file);
	
	/**
	 * 이메일 찾기
	 * @param member
	 * @return member
	 */
	Member selectIdByName(Member member);
	
	/**
	 * 회원 번호로 회원 조회 : 회원이 자신의 상세 페이지 들어갈 때
	 * @param memberNo
	 * @return member
	 */
	Member selectMemberByNo(int memberNo);
	
	/**
	 * 닉네임 수정
	 * @param member
	 */
	void updateNicknameByNo(Member member);
}
