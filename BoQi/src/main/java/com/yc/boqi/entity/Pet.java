package com.yc.boqi.entity;

import java.io.Serializable;
import java.util.List;

public class Pet implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int petid;
	private String petname;
	private String petpic;
	private String pettype;
	private String engname;
	private String ancehome;
	private int life;
	private double petprice;
	private String character;
	private String petintro;
	private String conserveinfo;
	private String feedinfo;
	private String family;

	public Pet() {
		super();
	}

	public Pet(int petid, String petname, String petpic, String pettype,
			String engname, String ancehome, int life, double petprice,
			String character, String petintro, String conserveinfo,
			String feedinfo, String family) {
		super();
		this.petid = petid;
		this.petname = petname;
		this.petpic = petpic;
		this.pettype = pettype;
		this.engname = engname;
		this.ancehome = ancehome;
		this.life = life;
		this.petprice = petprice;
		this.character = character;
		this.petintro = petintro;
		this.conserveinfo = conserveinfo;
		this.feedinfo = feedinfo;
		this.family = family;
	}

	public int getPetid() {
		return petid;
	}

	public void setPetid(int petid) {
		this.petid = petid;
	}

	public String getPetname() {
		return petname;
	}

	public void setPetname(String petname) {
		this.petname = petname;
	}

	public String getPetpic() {
		return petpic;
	}

	public void setPetpic(String petpic) {
		this.petpic = petpic;
	}

	public String getPettype() {
		return pettype;
	}

	public void setPettype(String pettype) {
		this.pettype = pettype;
	}

	public String getEngname() {
		return engname;
	}

	public void setEngname(String engname) {
		this.engname = engname;
	}

	public String getAncehome() {
		return ancehome;
	}

	public void setAncehome(String ancehome) {
		this.ancehome = ancehome;
	}

	public int getLife() {
		return life;
	}

	public void setLife(int life) {
		this.life = life;
	}

	public double getPetprice() {
		return petprice;
	}

	public void setPetprice(double petprice) {
		this.petprice = petprice;
	}

	public String getCharacter() {
		return character;
	}

	public void setCharacter(String character) {
		this.character = character;
	}

	public String getPetintro() {
		return petintro;
	}

	public void setPetintro(String petintro) {
		this.petintro = petintro;
	}

	public String getConserveinfo() {
		return conserveinfo;
	}

	public void setConserveinfo(String conserveinfo) {
		this.conserveinfo = conserveinfo;
	}

	public String getFeedinfo() {
		return feedinfo;
	}

	public void setFeedinfo(String feedinfo) {
		this.feedinfo = feedinfo;
	}

	public String getFamily() {
		return family;
	}

	public void setFamily(String family) {
		this.family = family;
	}

	@Override
	public String toString() {
		return "Pet [petid=" + petid + ", petname=" + petname + ", petpic="
				+ petpic + ", pettype=" + pettype + ", engname=" + engname
				+ ", ancehome=" + ancehome + ", life=" + life + ", petprice="
				+ petprice + ", character=" + character + ", petintro="
				+ petintro + ", conserveinfo=" + conserveinfo + ", feedinfo="
				+ feedinfo + ", family=" + family + "]";
	}

}
