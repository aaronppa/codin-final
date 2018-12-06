package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Pet;
import kr.co.codin.repository.domain.helper.HosBookingResult;

public interface PetMapper {
	List<Pet> selectPetByMemberNo(int memberNo);
	Pet selectPetInfo(int petNo);
	List<HosBookingResult> selectPetBooking(int petNo);
	void insertPet(Pet pet);
}
