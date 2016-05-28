package com.yc.boqi.entity;

import java.io.Serializable;

public class Pet implements Serializable{
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
	
	
	
	
	public Pet() {
		super();
	}
	public Pet(int petid, String petname, String petpic, String pettype,
			String engname, String ancehome, int life, double petprice,
			String character, String petintro, String conserveinfo,
			String feedinfo) {
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Pet [petid=" + petid + ", petname=" + petname + ", petpic="
				+ petpic + ", pettype=" + pettype + ", engname=" + engname
				+ ", ancehome=" + ancehome + ", life=" + life + ", petprice="
				+ petprice + ", character=" + character + ", petintro="
				+ petintro + ", conserveinfo=" + conserveinfo + ", feedinfo="
				+ feedinfo + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((ancehome == null) ? 0 : ancehome.hashCode());
		result = prime * result
				+ ((character == null) ? 0 : character.hashCode());
		result = prime * result
				+ ((conserveinfo == null) ? 0 : conserveinfo.hashCode());
		result = prime * result + ((engname == null) ? 0 : engname.hashCode());
		result = prime * result
				+ ((feedinfo == null) ? 0 : feedinfo.hashCode());
		result = prime * result + life;
		result = prime * result + petid;
		result = prime * result
				+ ((petintro == null) ? 0 : petintro.hashCode());
		result = prime * result + ((petname == null) ? 0 : petname.hashCode());
		result = prime * result + ((petpic == null) ? 0 : petpic.hashCode());
		long temp;
		temp = Double.doubleToLongBits(petprice);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((pettype == null) ? 0 : pettype.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pet other = (Pet) obj;
		if (ancehome == null) {
			if (other.ancehome != null)
				return false;
		} else if (!ancehome.equals(other.ancehome))
			return false;
		if (character == null) {
			if (other.character != null)
				return false;
		} else if (!character.equals(other.character))
			return false;
		if (conserveinfo == null) {
			if (other.conserveinfo != null)
				return false;
		} else if (!conserveinfo.equals(other.conserveinfo))
			return false;
		if (engname == null) {
			if (other.engname != null)
				return false;
		} else if (!engname.equals(other.engname))
			return false;
		if (feedinfo == null) {
			if (other.feedinfo != null)
				return false;
		} else if (!feedinfo.equals(other.feedinfo))
			return false;
		if (life != other.life)
			return false;
		if (petid != other.petid)
			return false;
		if (petintro == null) {
			if (other.petintro != null)
				return false;
		} else if (!petintro.equals(other.petintro))
			return false;
		if (petname == null) {
			if (other.petname != null)
				return false;
		} else if (!petname.equals(other.petname))
			return false;
		if (petpic == null) {
			if (other.petpic != null)
				return false;
		} else if (!petpic.equals(other.petpic))
			return false;
		if (Double.doubleToLongBits(petprice) != Double
				.doubleToLongBits(other.petprice))
			return false;
		if (pettype == null) {
			if (other.pettype != null)
				return false;
		} else if (!pettype.equals(other.pettype))
			return false;
		return true;
	}
	
	
	
	
}
