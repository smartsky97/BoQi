package com.yc.boqi.service;

import java.util.List;

import com.yc.boqi.entity.Pet;

public interface IPetDao {
	public int addPet(Pet pet);
	public int delPet(Pet pet);
	public int updatePet(Pet pet);
	public Pet find(String petName);
	public Pet find(int petId);
	public List<Pet> find(Integer pageNo, Integer pageSize);
	public int total();
	public int delBk(String petids);
}
