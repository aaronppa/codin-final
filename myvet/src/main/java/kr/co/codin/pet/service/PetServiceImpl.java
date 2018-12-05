package kr.co.codin.pet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.mapper.PetMapper;

@Service
public class PetServiceImpl implements PetService {
	
	@Autowired
	PetMapper mapper;

	@Override
	public List<Pet> myPet(int memberNo) {
		return mapper.selectPetByMemberNo(memberNo);
	}

	@Override
	public void addPet(Pet pet) {
		mapper.insertPet(pet);
	}
}
