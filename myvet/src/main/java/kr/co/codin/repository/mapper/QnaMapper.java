package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaCategoryList;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.QnaRecommend;
import kr.co.codin.repository.domain.SearchQnA;

public interface QnaMapper {
	List<Qna> qnaList(SearchQnA QNA);
	void InsertQna(Qna qna);
	Qna selectQnaByNo(int qnaNo);
	void updateViewCnt(int qnaNo);
	void updateQna(Qna qna);
	void deleteQna(Qna qna);
	void insertComment(QnaComment Qc);
	List<QnaComment> selectCombyNo(int qnaNo);
	List<QnaCategoryList> categoryList();
	void insertRecommendlike(QnaRecommend QnaRecommend);
	void deleteComment(QnaComment qc);
	void updateQnaComment(QnaComment qc);
	int qnaListCnt(SearchQnA QNA);
	void updateAnswer(Qna qna);
	void updateCommentPick(QnaComment Qc);
	QnaComment selectPickCom(QnaComment Qc);
	String selectPickCom111(int qna);
	int selectRecommend(QnaRecommend QnaRecommend);
	void deleteRecommend(QnaRecommend re);
	int sumrecommend(int recommend);
	void uploadFile(FileInfo fileInfo);
	int selectFileId(FileInfo fileInfo);
	void updateFileid(FileInfo fileInfo);
	int selectQnaNo(Qna qna);
	void updateFileDb(FileInfo fileinfo);
	void deleteFileDb(int boardNo);
	int forModelAttributeFIleInfo(int fileinfo);
	FileInfo selectFIle(FileInfo info);
}
