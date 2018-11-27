package kr.co.codin.tip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.domain.TipRecommend;
import kr.co.codin.repository.mapper.TipMapper;

@Service
public class TipServiceImpl implements TipService{
	
	@Autowired 
	private TipMapper mapper;

	@Override
	public List<Tip> tipList() {
		return mapper.selectTip();
	}
	
	@Override
	public Tip detailTip(int tipNo) {
		return mapper.selectTipByNo(tipNo);
	}

	@Override
	public void insertTip(Tip tip) {
		mapper.insertTip(tip);
	}

	@Override
	public Tip updateForm(int tipNo) {
		return mapper.selectTipByNo(tipNo);
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
	public int countTip() {
		return mapper.countTip();
	}

	//댓글


	@Override
	public void insertComment(TipComment tipComment) {
		mapper.insertComment(tipComment);
	}

	@Override
	public List<TipComment> commentList(int tipNo) {
		return mapper.selectComment(tipNo);
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

	//추천
	@Override
	public void insertRecommend(TipRecommend tipRecommend) {
		mapper.insertRecommend(tipRecommend);
	}
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	



	

	
	
	
	
	
}
