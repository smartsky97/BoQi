package com.yc.boqi.mapper;

import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Pet;

public interface PetMapper {
	List<Pet> findPetByFamily(Map<String,Object> map);
	Pet findPetByid(int petid);
	int addPet(Pet pet);
	int updatePet(Pet pet);
	int deletePet(int petid);
}
