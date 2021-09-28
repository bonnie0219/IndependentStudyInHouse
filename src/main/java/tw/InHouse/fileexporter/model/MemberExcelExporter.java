package tw.InHouse.fileexporter.model;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import org.apache.poi.ss.usermodel.Row;

import tw.InHouse.member_model.Member;



public class MemberExcelExporter {
       private XSSFWorkbook workbook;
       
       private XSSFSheet sheet;
       
       private List<Member> listMember;
       
       public MemberExcelExporter(List<Member> listMember) {
    	   this.listMember = listMember;
    	   workbook = new XSSFWorkbook();
    	   sheet = workbook.createSheet("Member");
       }

       private void writeHeaderRow() {
    	   Row row = sheet.createRow(0);
    	   
    	   CellStyle style = workbook.createCellStyle();
           XSSFFont font = workbook.createFont();
           font.setBold(true);
           font.setFontHeight(16);
           style.setFont(font);
           
    	   Cell cell = row.createCell(0);
    	   cell.setCellValue("Member_id");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(1);
    	   cell.setCellValue("Member_name");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(2);
    	   cell.setCellValue("Member_gender");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(3);
    	   cell.setCellValue("Member_email");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(4);
    	   cell.setCellValue("Member_phone");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(5);
    	   cell.setCellValue("Member_address");
    	   cell.setCellStyle(style);
    	   
    	   cell = row.createCell(6);
    	   cell.setCellValue("Member_birthday");
    	   cell.setCellStyle(style);
    	   
       }
       
       private void writeDataRows() {
    	   int rowCount = 1;

    	   CellStyle style = workbook.createCellStyle();
    	   XSSFFont font = workbook.createFont();
    	   font.setBold(true);
    	   font.setFontHeight(14);
    	   style.setFont(font);
    	   
    	   for(Member member : listMember) {
    		   Row row = sheet.createRow(rowCount++);
    		   
    		   
    		   Cell cell = row.createCell(0);
    		   cell.setCellValue(member.getMember_id());
    		   sheet.autoSizeColumn(0);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(1);
    		   cell.setCellValue(member.getMember_name());
    		   sheet.autoSizeColumn(1);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(2);
    		   cell.setCellValue(member.getMember_gender());
    		   sheet.autoSizeColumn(2);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(3);
    		   cell.setCellValue(member.getMember_email());
    		   sheet.autoSizeColumn(3);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(4);
    		   cell.setCellValue(member.getMember_phone());
    		   sheet.autoSizeColumn(4);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(5);
    		   cell.setCellValue(member.getMember_address());
    		   sheet.autoSizeColumn(5);
    		   cell.setCellStyle(style);
    		   
    		   cell = row.createCell(6);
    		   cell.setCellValue(member.getMember_birthday());
    		   sheet.autoSizeColumn(6);
    		   cell.setCellStyle(style);
    		   
    	   }
       }
       
	   public void export(HttpServletResponse response) throws IOException {
		   writeHeaderRow();
		   writeDataRows();
		   
		   ServletOutputStream outputStream = response.getOutputStream();
		   workbook.write(outputStream);
		   workbook.close();
		   outputStream.close();
       }
}
