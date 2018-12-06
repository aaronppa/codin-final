package kr.co.codin.pet.service;

import java.util.List;
import java.util.Map;

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
	
	/**
	 * 회원의 반려동물 등록에 대한 비즈니스 로직 처리
	 * @param pet
	 */
	void addPet(Pet pet);
	
	/**
	 * 반려동물의 상세 정보 조회
	 * @param petNo
	 * @return
	 */
	Map<String, Object> detailPet(int petNo);
}
