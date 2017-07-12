package myproj.customer.dto;

import java.io.File;
import java.io.IOException;
import java.util.StringTokenizer;

import org.springframework.web.multipart.MultipartFile;

public class CustomerVO {
	
	private String cus_tel;
	private String cus_name;
	private String cus_addr;
	private String cus_firstdate;
	private String cus_memo;
	private String cus_hospital;
	private String cusfile_name;
	private String cushidden;

	MultipartFile file; //file 변수명과 view에서의 파일 name이 같아야함 (name='file')
	
	
	//file getter & setter 생성자 생성
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file){
		//파일 업로드 코딩
		
		if(!(file.getOriginalFilename().equals(cushidden) )) { 
			System.out.println("고객");
			this.cusfile_name = file.getOriginalFilename()+"_"+System.currentTimeMillis();
			
			File f = new File("C:/Users/user/git/dodamrepo/Dodam/WebContent/imageupload/"+cusfile_name); 
			
			//파일을 저장할 경로를 설정
			
			try {
				file.transferTo(f);
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}else if(file.getOriginalFilename().equals(cushidden) ){
			
		}
	}
	
	
	//getter & setter 생성자 생성
	
	public String getCus_tel() {
		return cus_tel;
	}
	public void setCus_tel(String cus_tel) {
		this.cus_tel = cus_tel;
	}
	public String getCus_name() {
		return cus_name;
	}
	public void setCus_name(String cus_name) {
		this.cus_name = cus_name;
	}
	public String getCus_addr() {
		return cus_addr;
	}
	public void setCus_addr(String cus_addr) {
		this.cus_addr = cus_addr;
	}
	public String getCus_firstdate() {
		return cus_firstdate;
	}
	public void setCus_firstdate(String cus_firstdate) {
		this.cus_firstdate = cus_firstdate;
	}
	public String getCus_memo() {
		return cus_memo;
	}
	public void setCus_memo(String cus_memo) {
		this.cus_memo = cus_memo;
	}
	public String getCus_hospital() {
		return cus_hospital;
	}
	public void setCus_hospital(String cus_hospital) {
		this.cus_hospital = cus_hospital;
	}
	public String getCusfile_name() {
		return cusfile_name;
	}

	public void setCusfile_name(String cusfile_name) {
		System.out.println("");
			this.cusfile_name = cusfile_name;
	}

	public String getCushidden() {
		return cushidden;
	}

	public void setCushidden(String cushidden) {
		this.cushidden = cushidden;
	}
	
	

}
