package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GoodsVo;

@Repository
public class AdminDao {

    @Autowired
    private SqlSession sqlSession;

    // 모든 상품 가져오기
    public List<GoodsVo> getGoodsList() {
        return sqlSession.selectList("admin.getGoodsList");
    }

    // 상품 ID로 특정 상품 가져오기
    public GoodsVo findById(int no) {
        return sqlSession.selectOne("admin.findById", no);
    }

    // 상품 저장
    public void save(GoodsVo goodsVo) {
        sqlSession.insert("admin.save", goodsVo);
    }

    // 상품 수정
    public void update(GoodsVo goodsVo) {
        sqlSession.update("admin.update", goodsVo);
    }

    // 상품 삭제
    public void delete(int no) {
        sqlSession.delete("admin.delete", no);
    }
    
    
}