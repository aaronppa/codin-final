package kr.co.codin.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Pet {
	private int petNo;
	private int memberNo;
	private String petName;
	private long petRegNo;
	private String species;
	private String breed;
	private String size;
	private String petGender;
	private int petAge;
	private int weight;
	private String remark;
	private String petOriName;
	private String petSysName;
	private String petFilePath;
	private int petFileSize;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date petFileRegDate;

	
	public int getPetNo() {
		return petNo;
	}

	public void setPetNo(int petNo) {
		this.petNo = petNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public long getPetRegNo() {
		return petRegNo;
	}

	public void setPetRegNo(long petRegNo) {
		this.petRegNo = petRegNo;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPetOriName() {
		return petOriName;
	}

	public void setPetOriName(String petOriName) {
		this.petOriName = petOriName;
	}

	public String getPetSysName() {
		return petSysName;
	}

	public void setPetSysName(String petSysName) {
		this.petSysName = petSysName;
	}

	public String getPetFilePath() {
		return petFilePath;
	}

	public void setPetFilePath(String petFilePath) {
		this.petFilePath = petFilePath;
	}

	public int getPetFileSize() {
		return petFileSize;
	}

	public void setPetFileSize(int petFileSize) {
		this.petFileSize = petFileSize;
	}

	public Date getPetFileRegDate() {
		return petFileRegDate;
	}

	public void setPetFileRegDate(Date petFileRegDate) {
		this.petFileRegDate = petFileRegDate;
	}



	@Override
	public String toString() {
		return "Pet [petNo=" + petNo + ", memberNo=" + memberNo + ", petName=" + petName + ", petRegNo=" + petRegNo
				+ ", species=" + species + ", breed=" + breed + ", size=" + size + ", petGender=" + petGender
				+ ", petAge=" + petAge + ", weight=" + weight + ", remark=" + remark + ", petOriName=" + petOriName
				+ ", petSysName=" + petSysName + ", petFilePath=" + petFilePath + ", petFileSize=" + petFileSize
				+ ", petFileRegDate=" + petFileRegDate + "]";
	}
	
}
