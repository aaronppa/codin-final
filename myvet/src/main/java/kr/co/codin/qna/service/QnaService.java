package kr.co.codin.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaCategoryList;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;
import kr.co.codin.repository.domain.SearchQnA;

@Service
public interface QnaService {
	List<Qna> SelectList(SearchQnA qna);
	void InsertQna(Qna qna);
	Qna selectQnaByNo(int qnaNo);
	void updateDetail(Qna qna);
	void deleteDetail(Qna qna);
	void writeComment(QnaComment com);
	List<QnaComment> selectCombyNo(int qnaNo);
	List<QnaCategoryList> cateList();
	void insertRecommend(QnaRecommend QnaRecommend);
	void deleteComment(QnaComment com);
	void updateQnaComment(QnaComment com);
	int countTotalContent(SearchQnA qna);
	void updateAnswerAndPick(Qna qna,QnaComment com );
	QnaComment selectPickCom(QnaComment com );
	String selectPickCom111(int qna);
	int selectRecommend(QnaRecommend qnaRecommend);
	void deleteRecommend(QnaRecommend re);
	int sumrecommend(int recommend);
}
