package kr.co.codin.pet.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Pet;

@Service
public interface PetService {
	/**
	 * 회원의 반려동물 조회에 대한 비즈니스 로직 처리
	 * @param memberNo
	 * @return List<Pet>
	 */
	List<Pet> myPet(int memberNo);
}
