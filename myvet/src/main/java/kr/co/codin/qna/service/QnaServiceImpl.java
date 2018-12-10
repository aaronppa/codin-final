package kr.co.codin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaCategoryList;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;
import kr.co.codin.repository.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
		
	@Autowired
	QnaMapper mapper;
	
	
	@Override
	public List<Qna> SelectList() {
		// TODO Auto-generated method stub
		return mapper.qnaList();
	}
	@Override
	public void InsertQna(Qna qna) {
		// TODO Auto-generated method stub
		mapper.InsertQna(qna);
		
	}
	@Override
	public Qna selectQnaByNo(int qnaNo) {
		// TODO Auto-generated method stub
		mapper.updateViewCnt(qnaNo);
		System.out.println("ㅠ_ㅠ");
		return mapper.selectQnaByNo(qnaNo);
	}
	
	
	@Override
	public void updateDetail(Qna qna) {
		 mapper.updateQna(qna);
		
	}
	@Override
	public void deleteDetail(Qna qna) {
		// TODO Auto-generated method stub
		mapper.deleteQna(qna);
	}
	@Override
	public void writeComment(QnaComment com) {
		mapper.insertComment(com);
		
	}
	@Override
	public List<QnaComment> selectCombyNo(int qnaNo) {
		// TODO Auto-generated method stub
		return mapper.selectCombyNo(qnaNo);
	}
	@Override
	public List<QnaCategoryList> cateList() {
		// TODO Auto-generated method stub
		return mapper.categoryList();
	}
	@Override
	public void insertRecommend(QnaRecommend QnaRecommend) {
		// TODO Auto-generated method stub
		 mapper.insertRecommend(QnaRecommend);
		
	}
	@Override
	public void deleteComment(QnaComment com) {
		// TODO Auto-generated method stub
		mapper.deleteComment(com);
	}
	
	
	
	
	
	
	
	
	
}
