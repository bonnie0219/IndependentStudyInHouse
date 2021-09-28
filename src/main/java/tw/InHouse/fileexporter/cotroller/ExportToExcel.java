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

import tw.InHouse.member_model.MemberService;
import tw.InHouse.fileexporter.model.MemberExcelExporter;
import tw.InHouse.member_model.Member;

@Controller
@Transactional
public class ExportToExcel {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/backend/member/exportexcel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		String headerKey = "Content-Disposition";
		
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());
		String fileName = "member_"+ currentDateTime + ".xlsx";
		
		String headerValue = "attachment; filename=" + fileName;
		
		response.setHeader(headerKey,headerValue);
		
		List<Member> listMember = memberService.findAll();
		
		MemberExcelExporter excelExporter = new MemberExcelExporter(listMember);
		excelExporter.export(response);
		
		
	}
}
