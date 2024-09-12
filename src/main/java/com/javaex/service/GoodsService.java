package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.GoodsDao;
import com.javaex.vo.CartVo;
import com.javaex.vo.GoodsVo;

@Service
public class GoodsService {
	
	@Autowired
	private GoodsDao goodsDao;
	
	
	
	
	public List<GoodsVo> exeGoodsList() {
		
		System.out.println("GoodsService.exeGoodsList");
		
		List<GoodsVo> goodsList = goodsDao.list();
		
		
		return goodsList;
	}
	
	
	
	public GoodsVo exeGetReadOne(int no) {
		
		System.out.println("GoodsService.exeGetReadOne");
		
		GoodsVo goodsVo = goodsDao.read(no);
		
		
		return goodsVo;
	}
	
	
	
	public int exeInsertCart ( CartVo cartVo ) {
		
		System.out.println("GoodsService.exeInsertCart");
		
		int result = goodsDao.insertCart(cartVo);
		
		
		return result;
	}
	
	
	public List<CartVo> exeCartList ( int uno ) {
		
		System.out.println("GoodsService.exeCartList");
		
		List<CartVo> cartVo = goodsDao.cartList(uno);
		
		return cartVo;
	}
	
	
	
	
	
	/*
	
	public String upload ( MultipartFile file ) {
		
		System.out.println("AttachService.upload()");
		//System.out.println(file.getOriginalFilename());
		
		////사진에 있는 기본 정보로 우리가 관리할 정보를 뽑아내야된다 -->db저장
		//파일 저장 폴더
		String saveDir = "C:\\javaStudy\\upload";
		
		
		//오리지널 파일명
		String orgName = file.getOriginalFilename();
		System.out.println("orgName : " + orgName);
		
		
		//확장자
		String exeName;
		///
		orgName.lastIndexOf("."); //.이 파일명의 몇벙쨰에 있는지 알려줘
		System.out.println("orgName.lastIndexOf(.) : " + orgName.lastIndexOf("."));
		orgName.substring(11); //11번쨰 뒷문자열 출력해줘
		System.out.println("orgName.lastIndexOf(.) : " + orgName.substring(11));
		///
		exeName = orgName.substring(orgName.lastIndexOf("."));
		System.out.println("확장자 : " + exeName);
		
		
		//파일 사이즈
		long fileSize = file.getSize();
		System.out.println("파일 사이즈 : " + fileSize);
		
		//저장 파일명(겹치지 않아야한다)             내가 관리할
		String saveName = System.currentTimeMillis() 
						//+ "####" //얘는 뺴도 되지 않을까
						+ UUID.randomUUID().toString() 
						+ exeName;
		System.out.println("savaName : " + saveName);
		
		
		//파일 전체경로 + 파일명
		String filePath = saveDir + "\\" + saveName;
		System.out.println("filePath : " + filePath);
		
		
		//(1)db저장
		//(1-1) 데이터 묶기
		//orgName saveName filePath fileSize
		AttachVo attachVo = new AttachVo(orgName, saveName, filePath, fileSize);
		System.out.println(attachVo);
		  
		
		//(1-2) dao를 통해 db에 저장
		//attachDao.insertFile(attachVo);
		
		////사진을 서버(강남)에 복사해야한다 == 하드디스크에 복사해야된다
		//파일 저장
		try {
			
			byte[] fileData = file.getBytes();
			OutputStream os = new FileOutputStream(filePath);
			BufferedOutputStream bos = new BufferedOutputStream(os);
			
			bos.write(fileData);
			
			bos.close();
			
			
			
		} catch (IOException e) {
			System.out.println(e.toString());
		}
		
		
		
		
		return saveName;
		
		
	}
	
	*/
	
	
	

}
