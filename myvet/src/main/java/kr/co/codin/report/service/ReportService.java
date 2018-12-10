package kr.co.codin.report.service;

import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;

public interface ReportService {
	Tip detailReportTip(int tipNo);
	Gallery detailReportGallery(int galleryNo);
	Qna detailReportQna(int qnaNo);
	
	TipComment detailReportTipComment(int commentNo);
	GalleryComment detailReportGalleryComment(int commentNo);
	QnaComment detailReportQnaComment(int commentNo);
	
	void insertReport(Report report);
	
}
