package kr.co.codin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.domain.VetAuth;
import kr.co.codin.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public void signup(Member member) {
//		System.out.println("service");
		String encPassword = passwordEncoder.encode(member.getPassword());
		member.setPassword(encPassword);
//		System.out.println("암호화된 비밀번호 : " + member.getPassword());
		mapper.insertMember(member);
	}

	@Override
	public int idCheck(String memberEmail) {
		return mapper.IdCheck(memberEmail);
	}

	@Override
	public Member login(Member member) {
		String rawPassword = member.getPassword();
//		System.out.println("입력한 비밀번호 : " + rawPassword);
		String encPassword = mapper.selectPasswordById(member.getMemberEmail()).getPassword();
//		System.out.println("저장된 비밀번호 : " + encPassword);
		
		if (passwordEncoder.matches(rawPassword, encPassword)) {
//			System.out.println("비밀번호 일치");
			member.setPassword(encPassword);
		} else {
			System.out.println("비밀번호 불일치");
		}
		return mapper.selectMemberById(member);
	}

	@Override
	public void uploadVetAuth(VetAuth file) {
		mapper.insertVetAuth(file);
	}

	@Override
	public Member findEmail(Member member) {
		return mapper.selectIdByName(member);
	}

	@Override
	public Member myPage(int memberNo) {
		return mapper.selectMemberByNo(memberNo);
	}

	@Override
	public void nickChange(Member member) {
		mapper.updateNicknameByNo(member);
	}
}
