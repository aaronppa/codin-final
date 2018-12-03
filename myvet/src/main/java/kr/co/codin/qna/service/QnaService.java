package kr.co.codin.qna.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;

@Service
public interface QnaService {
	List<Qna> SelectList();
	void InsertQna(Qna qna);
	Qna selectQnaByNo(int qnaNo);
	void updateDetail(Qna qna);
	void deleteDetail(Qna qna);
	void writeComment(QnaComment com);
	List<QnaComment> selectCombyNo(int qnaNo);
}
