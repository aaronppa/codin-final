package kr.co.codin.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Member;
import kr.co.codin.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper mapper;

	@Override
	public void signup(Member member) {
//		System.out.println("service");
		mapper.insertMember(member);
	}

	@Override
	public int idCheck(String memberEmail) {
		return mapper.IdCheck(memberEmail);
	}

	@Override
	public Member login(Member member) {
		return mapper.selectMemberById(member);
	}
}
