package kr.co.codin.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.FileInfo;
import kr.co.codin.repository.domain.SearchTip;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipCommentRecommend;
import kr.co.codin.repository.domain.TipRecommend;
import kr.co.codin.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService{
	
	@Autowired 
	private TipMapper mapper;

	
	@Override
	public List<Tip> tipTopList() {
		return mapper.selectTopTip();
	}


	@Override
	public List<Tip> tipList(SearchTip searchTip) {
		return mapper.selectTip(searchTip);
	}
	

	@Override
	public Tip detailTip(Tip tip) {
		return mapper.selectTipByNo(tip);
	}

	@Override
	public void insertTip(Tip tip) {
		mapper.insertTip(tip);
	}

	@Override
	public Tip updateForm(Tip tip) {
		return mapper.selectTipByNo(tip);
	}

	@Override
	public void updateTip(Tip tip) {
		mapper.updateTip(tip);
	}
	
	@Override
	public void deleteTip(int tipNo) {
		mapper.deleteTip(tipNo);
	}

	@Override
	public void updateViewCnt(int tipNo) {
		mapper.updateViewCnt(tipNo);
	}


	@Override
	public int countTip(SearchTip searchTip) {
		return mapper.countTip(searchTip);
	}

	//댓글


	@Override
	public void insertComment(TipComment tipComment) {
		mapper.insertComment(tipComment);
	}

	@Override
	public List<TipComment> commentList(Tip tip) {
		return mapper.selectComment(tip);
	}

	@Override
	public void deleteComment(TipComment tipComment) {
		mapper.deleteComment(tipComment);
	}


	@Override
	public void updateComment(TipComment tipComment) {
		mapper.updateComment(tipComment);
	}

	@Override
	public int countComment(int tipNo) {
		return mapper.countComment(tipNo);
	}

	@Override
	public void uploadFile(FileInfo fileInfo) {
		mapper.uploadFile(fileInfo);
	}

	@Override
	public void deleteFile(FileInfo fileInfo) {
		mapper.deleteFile(fileInfo);
	}
	


	@Override
	public void intsertBoardNo(int tipNo) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Integer selectRecommend(TipRecommend tipRecommend) {
		System.out.println("serviceImplSelectRecom");
		return mapper.selectRecommend(tipRecommend);
	}
	
	@Override
	public void insertRecommend(TipRecommend tipRecommend) {
		System.out.println("serviceImplRecom");
		mapper.deleteRecommend(tipRecommend);
		int recommend = tipRecommend.getRecommend();
		if(recommend == 1 || recommend == -1) {
			mapper.insertRecommend(tipRecommend);
		}
		
	}
	
	@Override
	public void deleteRecommend(TipRecommend tipRecommend) {
		mapper.deleteRecommend(tipRecommend);
	}
	
	
	//댓글 추천

	@Override
	public Integer sumRecommend(int tipNo) {
		System.out.println("impl");
		System.out.println(mapper.sumRecommend(tipNo));
		return mapper.sumRecommend(tipNo);
	}


	@Override
	public Integer selectCommentRecommend(TipCommentRecommend tipCommentRecommend) {
		
		return mapper.selectCommentRecommend(tipCommentRecommend);
	}
	
	
	
	@Override
	public void insertCommentRecommend(TipCommentRecommend tipCommentRecommend) {
		mapper.deleteCommentRecommend(tipCommentRecommend);
		int recommend = tipCommentRecommend.getRecommend();
		if(recommend == 1 || recommend == -1) {
			mapper.insertCommentRecommend(tipCommentRecommend);
		}
	}


	@Override
	public void deleteCommentRecommend(TipCommentRecommend tipCommentRecommend) {
		mapper.deleteCommentRecommend(tipCommentRecommend);
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	



	

	
	
	
	
	
}
