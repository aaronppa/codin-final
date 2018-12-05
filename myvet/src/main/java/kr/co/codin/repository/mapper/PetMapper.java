package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Pet;

public interface PetMapper {
	List<Pet> selectPetByMemberNo(int memberNo);
	void insertPet(Pet pet);
}
