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

import com.javaex.dao.AdminDao;
import com.javaex.vo.GoodsVo;

@Service
public class AdminService {

	@Autowired
	private AdminDao adminDao;

	// 상품 목록 가져오기
	public List<GoodsVo> getAllGoods() {
		return adminDao.getGoodsList();
	}

	// 상품 추가 로직 (이미지 파일 처리 포함)
	/*
	 * public void addGoodsWithImage(GoodsVo goodsVo, MultipartFile image) { if
	 * (image != null && !image.isEmpty()) { try { // 이미지 파일 처리 String imageName =
	 * image.getOriginalFilename(); goodsVo.setImgName(imageName);
	 * 
	 * // 파일 저장 (실제 업로드 경로 설정) String uploadDir = "C:/javaStudy/upload"; // 실제 파일
	 * 업로드 경로 File uploadFile = new File(uploadDir, imageName);
	 * image.transferTo(uploadFile);
	 * 
	 * // 이미지 크기 저장 (파일 크기 예시) goodsVo.setImgSize(uploadFile.length());
	 * 
	 * // 이미지 경로 저장 (절대 경로 or 상대 경로 선택) Path imgPath = Paths.get(uploadDir,
	 * imageName); goodsVo.setImgPath(imgPath.toString()); // imgPath 저장
	 * 
	 * 
	 * } catch (IOException e) { e.printStackTrace(); throw new
	 * RuntimeException("파일 저장 중 오류 발생"); } }
	 * 
	 * // 상품 정보 저장 adminDao.save(goodsVo); }
	 */
	public void addGoodsWithImage(GoodsVo goodsVo, MultipartFile image) {
	    // 파일 저장 경로
	    String saveDir = "C:\\javaStudy\\upload";

	    // 이미지 파일이 존재하는지 확인
	    if (image != null && !image.isEmpty()) {
	        try {
	            // 오리지날 파일명
	            String orgName = image.getOriginalFilename();

	            // 확장자 추출
	            String exeName = orgName.substring(orgName.lastIndexOf("."));

	            // 파일 사이즈
	            long fileSize = image.getSize();

	            // 저장 파일명 (현재 시간 + UUID로 고유한 파일명 생성)
	            String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exeName;

	            // 파일 전체 경로 + 파일명
	            String filePath = saveDir + "\\" + saveName;

	            // (1) 파일을 실제 경로에 저장
	            byte[] fileData = image.getBytes();
	            OutputStream os = new FileOutputStream(filePath);
	            BufferedOutputStream bos = new BufferedOutputStream(os);
	            bos.write(fileData);
	            bos.close();

	            // 이미지 정보를 GoodsVo에 설정
	            goodsVo.setImgName(saveName);   // 오리지널 파일명
	            goodsVo.setImgSize(fileSize);  // 파일 사이즈
	            goodsVo.setImgPath(filePath);  // 파일 경로

	        } catch (IOException e) {
	            e.printStackTrace();
	            throw new RuntimeException("파일 저장 중 오류 발생");
	        }
	    }

	    // 상품 정보 저장
	    adminDao.save(goodsVo);
	}
}