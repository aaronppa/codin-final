package kr.co.codin.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;
import kr.co.codin.repository.mapper.ReportMapper;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportMapper mapper;

	
	@Override
	public Gallery detailReportGallery(int galleryNo) {
		return mapper.selectByReportGallery(galleryNo);
	}


	@Override
	public Tip detailReportTip(int tipNo) {
		return mapper.selectByReportTip(tipNo);
	}


	@Override
	public Qna detailReportQna(int qnaNo) {
		return mapper.selectByReportQna(qnaNo);
	}

	@Override
	public GalleryComment detailReportGalleryComment(int commentNo) {
		return mapper.selectByReportGalleryComment(commentNo);
	}

	@Override
	public TipComment detailReportTipComment(int commentNo) {
		return mapper.selectByReportTipComment(commentNo);
	}

	@Override
	public QnaComment detailReportQnaComment(int commentNo) {
		return mapper.selectByReportQnaComment(commentNo);
	}

	@Override
	public void insertReport(Report report) {
		mapper.insertReport(report);
	}
	
}
