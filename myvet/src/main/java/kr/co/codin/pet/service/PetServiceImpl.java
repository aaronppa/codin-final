package kr.co.codin.pet.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public Map<String, Object> detailPet(int petNo) {
		Map<String, Object> result = new HashMap<>();
		result.put("pet", mapper.selectPetInfo(petNo));
		result.put("booking", mapper.selectPetBooking(petNo));
		
		return result;
	}
}
