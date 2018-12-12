package kr.co.codin.repository.mapper;

import java.util.List;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.Page;
import kr.co.codin.repository.domain.Search;
import kr.co.codin.repository.domain.SearchTip;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipCommentRecommend;
import kr.co.codin.repository.domain.TipRecommend;

public interface TipMapper {

	List<Tip> selectTip(SearchTip searchTip);
	Tip selectTipByNo(int tipNo);
	void insertTip(Tip tip);
	void updateTip(Tip tip);
	void deleteTip(int tipNo);
	void updateViewCnt(int tipNo);
	int countTip(SearchTip searchTip);
	
	//댓글
	void insertComment(TipComment tipComment);
	List<TipComment> selectComment(Tip tip);
	void deleteComment(TipComment tipComment);
	void updateComment(TipComment tipComment);
	int countComment(int tipNo);
	//추천
	Integer selectRecommend(TipRecommend tipRecommend);
	int insertRecommend(TipRecommend tipRecommend);
	void deleteRecommend(TipRecommend tipRecommend);
	Integer sumRecommend(int tipNo);
	
	//댓글 추천
	Integer selectCommentRecommend(TipCommentRecommend tipCommentRecommend);
	void deleteRecommend(TipCommentRecommend tipCommentRecommend);
	void deleteCommentRecommend(TipCommentRecommend tipCommentRecommend);
	void insertCommentRecommend(TipCommentRecommend tipCommentRecommend);
	
	//파일
	void uploadFile(FileInfo fileInfo);
	void deleteFile(FileInfo fileInfo);
	void updateFile(FileInfo fileInfo);
}
