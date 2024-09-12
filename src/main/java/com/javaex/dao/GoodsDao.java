package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.CartVo;
import com.javaex.vo.GoodsVo;

@Repository
public class GoodsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GoodsVo> list () {
		
		System.out.println("GoodsDao.list");
		
		List<GoodsVo> goodsList = sqlSession.selectList("goods.selectList");
		
		
		return goodsList;
	}
	
	
	public GoodsVo read ( int no ) {
		
		System.out.println("GoodsDao.read");
		
		GoodsVo goodsVo = sqlSession.selectOne("goods.selectRead", no);
		
		return goodsVo;
	}
	
	
	
	public int insertCart( CartVo cartVo ) {
		
		System.out.println("GoodsDao.insertCart");
		
		System.out.println("cartVo : " + cartVo);
		
		int result = sqlSession.insert("goods.insertCart", cartVo);
		
		
		return result;
	}
	
	
	
	public List<CartVo> cartList (int uno) {
		
		System.out.println("GoodsDao.cartList");
		
		List<CartVo> cartVo = sqlSession.selectList("goods.selectCartList", uno);
		
		return cartVo;
	}
	
	
	
	
	
	
	
	
	
	
	/*
	
	public void insertFile( AttachVo attachVo ) {
		
		System.out.println("AttachDao.insertFile()");
		
		int count = sqlSession.insert("attach.insert", attachVo);	
		
		
		
	}
	
	*/
	
	
	
	
	

}
