package grape.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import grape.domain.Coltors;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class OutputExcel {

	public static String OutExcel(HttpServletRequest request, HttpServletResponse response, List<Coltors> list) throws Exception {

		String message = "fail";
		String dir = request.getSession().getServletContext().getRealPath("/output");
		File fileLocation = new File(dir);
		if (!fileLocation.exists()) {
			boolean isCreated = fileLocation.mkdir();
			if (!isCreated) {
			}
		}
		String webUrl = request.getSession().getServletContext().getRealPath("/output");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd mm-ss");
		String createExcelname = df.format(new Date()) + "OutputExcel.xls";
		String outputFile = webUrl + File.separator + createExcelname;
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "coltors");
		HSSFRow row1 = sheet.createRow(0);
		HSSFCell cell0 = row1.createCell(0, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell1 = row1.createCell(1, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell2 = row1.createCell(2, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell3 = row1.createCell(3, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell4 = row1.createCell(4, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell5 = row1.createCell(5, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell6 = row1.createCell(6, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell7 = row1.createCell(7, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell8 = row1.createCell(8, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell9 = row1.createCell(9, HSSFCell.CELL_TYPE_STRING);
		HSSFCell cell10 = row1.createCell(10, HSSFCell.CELL_TYPE_STRING);
		
		cell0.setCellValue("id");
		cell1.setCellValue("coltorName");
		cell2.setCellValue("coltorType");
		cell3.setCellValue("sysNumber");
		cell4.setCellValue("code");
		cell5.setCellValue("installtionName");
		cell6.setCellValue("installtionCode");
		cell7.setCellValue("testobjName");
		cell8.setCellValue("serialPort");
		cell9.setCellValue("tableAdrr");
		cell10.setCellValue("status");

		response.setContentType("text/html;charset=UTF-8");

		for (int j = 0; j < list.size(); j++) {
			
			Coltors coltors = new Coltors();
			coltors = list.get(j);
			
			HSSFRow row = sheet.createRow(j + 1);
			HSSFCell c0 = row.createCell(0, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c1 = row.createCell(1, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c2 = row.createCell(2, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c3 = row.createCell(3, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c4 = row.createCell(4, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c5 = row.createCell(5, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c6 = row.createCell(6, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c7 = row.createCell(7, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c8 = row.createCell(8, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c9 = row.createCell(9, HSSFCell.CELL_TYPE_STRING);
			HSSFCell c10= row.createCell(10, HSSFCell.CELL_TYPE_STRING);

		}
		FileOutputStream fOut = new FileOutputStream(outputFile);
		workbook.write(fOut);
		fOut.flush();
		fOut.close();
		File f = new File(outputFile);
		if (f.exists() && f.isFile()) {
			try {
				FileInputStream fis = new FileInputStream(f);
				URLEncoder.encode(f.getName(), "utf-8");
				byte[] b = new byte[fis.available()];
				fis.read(b);
				response.setCharacterEncoding("utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=" + createExcelname + "");
				ServletOutputStream out = response.getOutputStream();
				out.write(b);
				out.flush();
				out.close();
				if (fis != null) {
					fis.close();
				}
				f.delete();
				message = "success";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return message;
	}

}
