package kr.co.codin.repository.mapper;

import kr.co.codin.repository.domain.Gallery;
import kr.co.codin.repository.domain.GalleryComment;
import kr.co.codin.repository.domain.Qna;
import kr.co.codin.repository.domain.QnaComment;
import kr.co.codin.repository.domain.Report;
import kr.co.codin.repository.domain.Tip;
import kr.co.codin.repository.domain.TipComment;

public interface ReportMapper {
	Gallery selectByReportGallery(int galleryNo);
	Tip selectByReportTip(int tipNo);
	Qna selectByReportQna(int qnaNo);

	GalleryComment selectByReportGalleryComment(int commentNo);
	TipComment selectByReportTipComment(int commentNo);
	QnaComment selectByReportQnaComment(int commentNo);
	
	void insertReport(Report report);
}
