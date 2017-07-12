package myproj.animal.dto;

import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;

import org.springframework.web.multipart.MultipartFile;

public class AnimalVO {
	private String  animal_num;
	private String  animal_type;
	private String  animal_breed;
	private String  animal_name;
	private String  animal_gender;
	private String  animal_color;
	private String  animal_birth;
	private String  animal_firstdate;
	private String  animal_memo;
	private String  animal_keycheck;
	private String  animal_duedate;
	private String  cus_tel;
	private String  animalfile_name;
	private String  animalhidden;
	
	MultipartFile file2;
	
	public MultipartFile getFile2() {
		return file2;
	}
	
	public void setFile2(MultipartFile file2) {
		System.out.println("file2.getOriginalFilename() : "+file2.getOriginalFilename());
		System.out.println("animalhidden : "+animalhidden);
		if(!(file2.getOriginalFilename().equals(animalhidden) )) { 
			System.out.println("동물");
		this.animalfile_name = file2.getOriginalFilename()+"_"+System.currentTimeMillis();
		
		File f = new File("C:/Users/user/git/dodamrepo/Dodam/WebContent/imageupload/"+animalfile_name);
		
		try{
			file2.transferTo(f);
			
		} catch (IllegalStateException e) {				
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		}else{
			
		}
	}
	public String getAnimal_num() {
		return animal_num;
	}
	public void setAnimal_num(String animal_num) {
		this.animal_num = animal_num;
	}
	public String getAnimal_type() {
		return animal_type;
	}
	public void setAnimal_type(String animal_type) {
		this.animal_type = animal_type;
	}
	public String getAnimal_breed() {
		return animal_breed;
	}
	public void setAnimal_breed(String animal_breed) {
		this.animal_breed = animal_breed;
	}
	public String getAnimal_name() {
		return animal_name;
	}
	public void setAnimal_name(String animal_name) {
		this.animal_name = animal_name;
	}
	public String getAnimal_gender() {
		return animal_gender;
	}
	public void setAnimal_gender(String animal_gender) {
		this.animal_gender = animal_gender;
	}
	public String getAnimal_color() {
		return animal_color;
	}
	public void setAnimal_color(String animal_color) {
		this.animal_color = animal_color;
	}
	public String getAnimal_birth() {
		return animal_birth;
	}
	public void setAnimal_birth(String animal_birth) {
		this.animal_birth = animal_birth;
	}
	public String getAnimal_firstdate() {
		return animal_firstdate;
	}
	public void setAnimal_firstdate(String animal_firstdate) {
		this.animal_firstdate = animal_firstdate;
	}
	public String getAnimal_memo() {
		return animal_memo;
	}
	public void setAnimal_memo(String animal_memo) {
		this.animal_memo = animal_memo;
	}
	public String getAnimal_keycheck() {
		return animal_keycheck;
	}
	public void setAnimal_keycheck(String animal_keycheck) {
		this.animal_keycheck = animal_keycheck;
	}
	public String getAnimal_duedate() {
		return animal_duedate;
	}
	public void setAnimal_duedate(String animal_duedate) {
		this.animal_duedate = animal_duedate;
	}
	public String getCus_tel() {
		return cus_tel;
	}
	public void setCus_tel(String cus_tel) {
		this.cus_tel = cus_tel;
	}
	public String getAnimalfile_name() {
		return animalfile_name;
	}
	public void setAnimalfile_name(String animalfile_name) {
		this.animalfile_name = animalfile_name;
	}

	public String getAnimalhidden() {
		return animalhidden;
	}

	public void setAnimalhidden(String animalhidden) {
		this.animalhidden = animalhidden;
	}


	
	
	
}
