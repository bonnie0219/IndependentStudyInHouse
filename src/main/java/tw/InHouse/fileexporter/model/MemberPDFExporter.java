package tw.InHouse.fileexporter.model;

import java.awt.Color;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import tw.InHouse.member_model.Member;

public class MemberPDFExporter {
       
       private List<Member> listMember;
       
       public MemberPDFExporter(List<Member> listMember) {
    	   this.listMember = listMember;
    	 
       }

       private void writeTableHeader(PdfPTable table) {
    	  
    	   PdfPCell cell = new PdfPCell();
    	   
    	   cell.setBackgroundColor(Color.BLUE);
    	   cell.setPadding(7);
    	   
    	   Font font = FontFactory.getFont(FontFactory.HELVETICA); 
    	   font.setColor(Color.WHITE);
    	   
    	   cell.setPhrase(new Phrase("member_id",font));

           table.addCell(cell);
           
           cell.setPhrase(new Phrase("Member_name",font));
           
           table.addCell(cell);
   
//           cell.setPhrase(new Phrase("Member_gender",font));
//           table.addCell(cell);
           
           cell.setPhrase(new Phrase("Member_email",font));
           table.addCell(cell);
           
           cell.setPhrase(new Phrase("Member_phone",font));
           table.addCell(cell);
           
           cell.setPhrase(new Phrase("Member_address",font));
           table.addCell(cell);
           
           cell.setPhrase(new Phrase("Member_birthday",font));
           table.addCell(cell);
    	   
       }
       
       private void writeTableData(PdfPTable table) {
    	
    	       for(Member member: listMember) {
    	    	   
    		   table.addCell(String.valueOf(member.getMember_id()));
    		   table.addCell(String.valueOf(member.getMember_name()));
//    		   table.addCell(String.valueOf(member.getMember_gender()));
    		   table.addCell(String.valueOf(member.getMember_email()));
    		   table.addCell(String.valueOf(member.getMember_phone()));
    		   table.addCell(String.valueOf(member.getMember_address()));
    		   table.addCell(String.valueOf(member.getMember_birthday()));
    		   
    		 
    		   
    	   }
       }
       
	   public void export(HttpServletResponse response) throws DocumentException, IOException {
		   Document document = new Document(PageSize.A4);
		   
		   PdfWriter.getInstance(document, response.getOutputStream());
		   
		   document.open();
		   
		   Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD); 
    	   font.setColor(Color.BLUE);
		   font.setSize(18);
		   
		   Paragraph title = new Paragraph("List of all members",font);
		   title.setAlignment(Paragraph.ALIGN_CENTER);
		   
		   document.add(title);
		   
		   PdfPTable table = new PdfPTable(6);

           table.setWidthPercentage(100);		   
		   table.setSpacingBefore(15);
           table.setWidths(new float[] {1.5f,3.5f,3.0f,3.0f,1.5f,1.5f});
		   
		   writeTableHeader(table);
		   writeTableData(table);
		   
		   document.add(table);
		   
		   document.close();
		   
       }
}
