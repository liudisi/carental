package com.liudisi.utils;

import com.liudisi.domain.Customer;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author liudisi
 * 导出客户数据工具类
 */
public class ExportCustomerDataUtils {

    /**
     * 导出客户数据
     *
     * @param customers
     * @param sheetName
     * @return
     */
    public static ByteArrayOutputStream exportCustomerData(List<Customer> customers, String sheetName, String titleName) {
        //1.组装Excel文档
        //1.1创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //1.2创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyleUtils.createBaseStyle(workbook);
        HSSFCellStyle subTitleStyle = ExportHSSFCellStyleUtils.createSubTitleStyle(workbook);
        HSSFCellStyle tableTitleStyle = ExportHSSFCellStyleUtils.createTableTitleStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyleUtils.createTitleStyle(workbook);
        //1.3在工作簿里面创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //1.4设置sheet相关属性
        sheet.setDefaultColumnWidth(25);
        //1.5合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
        sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, 6));
        //1.6创建第一行
        //1.6.1行号索引
        int index = 0;
        HSSFRow row1 = sheet.createRow(index);
        //1.6.2在第一行创建一个单元格
        HSSFCell row1_Cell = row1.createCell(0);
        //1.6.3设置第一行样式
        row1_Cell.setCellStyle(titleStyle);
        //1.6.4设置单元格内容
        row1_Cell.setCellValue(titleName);

        //1.7创建第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        //1.7.1在第二行创建一个单元格
        HSSFCell row2_Cell = row2.createCell(0);
        //1.7.2设置第二行样式
        row2_Cell.setCellStyle(subTitleStyle);
        //1.7.3设置单元格内容
        row2_Cell.setCellValue("总条数：" + customers.size() + "条，导出时间：" + new Date().toLocaleString());

        //1.8创建第三行
        index++;
        HSSFRow row3 = sheet.createRow(index);
        String[] titles = {"身份证号", "客户姓名", "性别", "客户地址", "客户电话", "客户职位", "录入时间"};
        for (int i = 0; i < titles.length; i++) {
            //1.8.1 创建单元格
            HSSFCell row3_cell = row3.createCell(i);
            //1.8.2 设置单元格内容
            row3_cell.setCellValue(titles[i]);
            //1.8.3 设置第三行样式
            row3_cell.setCellStyle(tableTitleStyle);
        }

        //1.9创建第四行到最后
        for (int i = 0; i < customers.size(); i++) {
            index++;
            //1.9.1 获取Customer对象
            Customer customer = customers.get(i);
            //1.9.2 根据索引创建行
            HSSFRow rowX = sheet.createRow(index);
            //1.9.3 创建单元格并设置值和样式
            HSSFCell cell1 = rowX.createCell(0);
            cell1.setCellStyle(baseStyle);
            cell1.setCellValue(customer.getIdentity());

            HSSFCell cell2 = rowX.createCell(1);
            cell2.setCellStyle(baseStyle);
            cell2.setCellValue(customer.getCustName());

            HSSFCell cell3 = rowX.createCell(2);
            cell3.setCellStyle(baseStyle);
            cell3.setCellValue(customer.getSex() == 1 ? "男" : "女");

            HSSFCell cell4 = rowX.createCell(3);
            cell4.setCellStyle(baseStyle);
            cell4.setCellValue(customer.getAddress());

            HSSFCell cell5 = rowX.createCell(4);
            cell5.setCellStyle(baseStyle);
            cell5.setCellValue(customer.getPhone());

            HSSFCell cell6 = rowX.createCell(5);
            cell6.setCellStyle(baseStyle);
            cell6.setCellValue(customer.getCareer());

            HSSFCell cell7 = rowX.createCell(6);
            cell7.setCellStyle(baseStyle);
            cell7.setCellValue(customer.getCreateTime().toLocaleString());
        }
        ByteArrayOutputStream bos = new ByteArrayOutputStream();//它是一个内存流
        try {
            //把workbook里面的数据写到outputStream中
            workbook.write(bos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bos;
    }
}
