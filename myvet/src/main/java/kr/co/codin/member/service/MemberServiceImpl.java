package kr.co.codin.member.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

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
		Member m = mapper.selectPasswordById(member.getMemberEmail());
		
		// 아이디에 해당하는 멤버가 존재하지 않는 경우
		if (m == null) {
			return null;
		}

		// 데이터베이스 회원의 패스워드
		String encPassword = m.getPassword();
		
		// 로그인 성공 : 입력된 패스워드와 암호화된 패스워드가 같은 경우
		if (passwordEncoder.matches(rawPassword, encPassword)) {
			return m;
		} 
		
		// 비밀번호가 안맞는 경우
		return null;
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

	@Override
	public Member updateMemberInfo(Member member) {
		mapper.updateMember(member);
		return mapper.selectMemberByNo(member.getMemberNo());
	}

	@Override
	public int updatePassword(Member member) {
		
		if (passwordEncoder.matches(member.getPassword(), mapper.selectMemberByNo(member.getMemberNo()).getPassword()) == false)
			return -1;
		
		System.out.println(member);
		
		member.setPassword(passwordEncoder.encode(member.getNewPassword()));
		return mapper.updatePassword(member);
	}
	
	@Override
	public int updateCareer(Member member) {
		return mapper.updateCareer(member);
	}
}
