package tw.InHouse.fileexporter.cotroller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import tw.InHouse.fileexporter.model.MemberPDFExporter;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;
@Controller
@Transactional
public class ExportToPDF {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/backend/member/exportpdf")
	public void exportToPDF(HttpServletResponse response) throws IOException {
		response.setContentType("application/pdf");
		String headerKey = "Content-Disposition";
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		String fileName = "member_"+ currentDateTime + ".pdf";
		
		String headerValue = "attachment; filename=" + fileName;
		
		response.setHeader(headerKey,headerValue);
		
		List<Member> listMember = memberService.findAll();
		
		MemberPDFExporter pdfExporter = new MemberPDFExporter(listMember);
		pdfExporter.export(response);
		
		
	}
}
