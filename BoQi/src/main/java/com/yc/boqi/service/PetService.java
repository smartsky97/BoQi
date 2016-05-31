package com.yc.boqi.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import com.yc.boqi.entity.Pet;

public interface PetService {
	List<Pet> findPetByFamily(int page,int rows,String family);
	Pet findPetByid(int petid);
	int addPet(Pet pet,File[] pictrues,String[] pictruesFileName,String[] pictruesContentType);
	int updatePet(Pet pet,File[] pictrues,String[] pictruesFileName,String[] pictruesContentType);
	int deletePet(String petid);
}
