package myproj.jinryo.dto;

import org.springframework.web.multipart.MultipartFile;

public class JinryoImageVO {

	private String jr_img_num;
	private String jryo_num;
	private String [] jr_img_name;
	private String [] jr_img_fake_name;
	private int jrImgCnt;
	
	
	private MultipartFile [] jinryoImages;
	
	public MultipartFile[] getJinryoImages() {
		return jinryoImages;
	}
	public void setJinryoImages(MultipartFile[] jinryoImages) {
		
		int imgCnt = jinryoImages.length;
		String [] names = new String [imgCnt];
		String [] fakeNames = new String [imgCnt];
		for(int i=0; i <names.length; i++){
			
			names[i]=jinryoImages[i].getOriginalFilename();
			fakeNames[i]=jinryoImages[i].getOriginalFilename()+"_"+System.currentTimeMillis();
		}
		setJr_img_name(names);
		setJr_img_fake_name(fakeNames);
		this.jinryoImages = jinryoImages;
		setJrImgCnt(imgCnt);
	}
	
	
	public int getJrImgCnt() {
		return jrImgCnt;
	}
	private void setJrImgCnt(int jrImgCnt) {
		this.jrImgCnt = jrImgCnt;
	}
	public String getJr_img_num() {
		return jr_img_num;
	}
	public void setJr_img_num(String jr_img_num) {
		this.jr_img_num = jr_img_num;
	}
	public String getJryo_num() {
		return jryo_num;
	}
	public void setJryo_num(String jryo_num) {
		this.jryo_num = jryo_num;
	}
	public String[] getJr_img_name() {
		return jr_img_name;
	}
	private void setJr_img_name(String[] jr_img_name) {
		this.jr_img_name = jr_img_name;
	}
	public String[] getJr_img_fake_name() {
		return jr_img_fake_name;
	}
	private void setJr_img_fake_name(String[] jr_img_fake_name) {
		this.jr_img_fake_name = jr_img_fake_name;
	}
}
