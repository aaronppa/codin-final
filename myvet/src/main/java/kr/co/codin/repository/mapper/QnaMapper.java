package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaCategoryList;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;

public interface QnaMapper {
	List<Qna> qnaList();
	void InsertQna(Qna qna);
	Qna selectQnaByNo(int qnaNo);
	void updateViewCnt(int qnaNo);
	void updateQna(Qna qna);
	void deleteQna(Qna qna);
	void insertComment(QnaComment Qc);
	List<QnaComment> selectCombyNo(int qnaNo);
	List<QnaCategoryList> categoryList();
	void insertRecommend(QnaRecommend QnaRecommend);
	void deleteComment(QnaComment qc);
}
