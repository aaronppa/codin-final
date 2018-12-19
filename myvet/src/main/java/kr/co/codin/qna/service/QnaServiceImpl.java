package kr.co.codin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaCategoryList;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;
import kr.co.codin.repository.domain.SearchQnA;
import kr.co.codin.repository.mapper.QnaMapper;

@Service
public class QnaServiceImpl implements QnaService{
		
	@Autowired
	QnaMapper mapper;
	
	
	@Override
	public List<Qna> SelectList(SearchQnA qna) {
		// TODO Auto-generated method stub
		return mapper.qnaList(qna);
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
	//	System.out.println("ㅠ_ㅠ");
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
		 mapper.insertRecommendlike(QnaRecommend);
		
	}
	@Override
	public void deleteComment(QnaComment com) {
		// TODO Auto-generated method stub
		mapper.deleteComment(com);
	}
	@Override
	public void updateQnaComment(QnaComment com) {
		// TODO Auto-generated method stub
		mapper.updateQnaComment(com);
	}
	@Override
	public int countTotalContent(SearchQnA QNA) {
		// TODO Auto-generated method stub
		return mapper.qnaListCnt(QNA);
		
	}
	@Override
	public void updateAnswerAndPick(Qna qna, QnaComment com) {
		// TODO Auto-generated method stub
		mapper.updateAnswer(qna);
		mapper.updateCommentPick(com);
	}
	@Override
	public QnaComment selectPickCom(QnaComment com) {
		// TODO Auto-generated method stub
		return mapper.selectPickCom(com);
	}
	@Override
	public String selectPickCom111(int qna) {
		// TODO Auto-generated method stub
		return mapper.selectPickCom111(qna);
	}
	@Override
	public int selectRecommend(QnaRecommend qnaRecommend) {
		// TODO Auto-generated method stub
		try {
			return mapper.selectRecommend(qnaRecommend);
		}catch(Exception e) {
			return 0;
		}
		
	}
	@Override
	public void deleteRecommend(QnaRecommend re) {
		// TODO Auto-generated method stub
		mapper.deleteRecommend(re);
	}
	@Override
	public int sumrecommend(int recommend) {
		// TODO Auto-generated method stub
	//	return mapper.sumrecommend(recommend);
		
		try {	
			return mapper.sumrecommend(recommend);
				
		}catch(Exception e) {
			return 0;
		}
	}
	@Override
	public void uploadFile(FileInfo fileInfo) {
		// TODO
		mapper.uploadFile(fileInfo);
		
	}
	@Override
	public int selectFileId(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		return mapper.selectFileId(fileInfo);
	}
	@Override
	public void updateFileid(FileInfo fileInfo) {
		// TODO Auto-generated method stub
		mapper.updateFileid(fileInfo);
	}
	@Override
	public int selectQnaNo(Qna qna) {
		// TODO Auto-generated method stub
		return mapper.selectQnaNo(qna);
	}
	@Override
	public void updateFileDb(FileInfo fileinfo) {
		// TODO Auto-generated method stub
		mapper.updateFileDb(fileinfo);
	}
	@Override
	public void deleteFileDb(int boardNo) {
		// TODO Auto-generated method stub
		mapper.deleteFileDb(boardNo);
	}
	@Override
	public int forModelAttributeFIleInfo(int fileinfo) {
		// TODO Auto-generated method stub
		return mapper.forModelAttributeFIleInfo(fileinfo);
	}
	@Override
	public FileInfo selectFIle(FileInfo info) {
		// TODO Auto-generated method stub
		return mapper.selectFIle(info);
	}
	@Override
	public int maxFileId() {
		// TODO Auto-generated method stub
		return mapper.maxFileId();
	}
	@Override
	public int selectBoardNo(int no) {
		// TODO Auto-generated method stub
		return mapper.selectBoardNo(no);
	}
	
	
	
	
	
	
	
	
	
}
