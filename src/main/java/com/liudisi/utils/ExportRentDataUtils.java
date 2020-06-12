package com.liudisi.utils;

import com.liudisi.domain.Customer;
import com.liudisi.domain.Rent;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

/**
 * @author liudisi
 * 导出出租单数据工具类
 */
public class ExportRentDataUtils {

    /**
     * 导出出租单数据
     * @param rent
     * @param customer
     * @param sheetName
     * @param titleName
     * @return
     */
    public static ByteArrayOutputStream exportRentData(Rent rent, Customer customer, String sheetName, String titleName) {
        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建sheet
        HSSFSheet sheet = workbook.createSheet(sheetName);
        //创建样式
        HSSFCellStyle baseStyle = ExportHSSFCellStyleUtils.createBaseStyle(workbook);
        HSSFCellStyle titleStyle = ExportHSSFCellStyleUtils.createTitleStyle(workbook);
        //sheet相关设置
        sheet.setDefaultColumnWidth(30);
        //设置第二列列宽
        sheet.setColumnWidth(1,50*256);
        //合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,3));

        //行索引
        int index = 0;
        //创建第一行
        HSSFRow row1 = sheet.createRow(index);
        HSSFCell row1_cell = row1.createCell(0);
        row1_cell.setCellStyle(titleStyle);
        row1_cell.setCellValue(titleName);

        //创建第二行
        index++;
        HSSFRow row2 = sheet.createRow(index);
        //设置第二行行高
        row2.setHeightInPoints(150);
        HSSFCell row2_Cell1 = row2.createCell(0);
        row2_Cell1.setCellStyle(baseStyle);
        row2_Cell1.setCellValue("出租单号：");

        HSSFCell row2_Cell2 = row2.createCell(1);
        row2_Cell2.setCellStyle(baseStyle);
        row2_Cell2.setCellValue(rent.getRentId());

        HSSFCell row2_Cell3 = row2.createCell(2);
        row2_Cell3.setCellStyle(baseStyle);
        row2_Cell3.setCellValue("二维码：");

        HSSFCell row2_Cell4 = row2.createCell(3);
        row2_Cell4.setCellStyle(baseStyle);
        row2_Cell4.setCellValue("");

        //画图片
        InputStream logoStream = ExportRentDataUtils.class.getClassLoader().getResourceAsStream("logo.jpg");
        BufferedImage image = ZXingCodeEncodeUtils.createZXingCodeUseLogoNormal(rent.getRentId(), 150, 150, logoStream);
        ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
        try {
            ImageIO.write(image,"jpeg",bos1);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //画图的顶级管理器，一个sheet只能获取一个（注意这一点）
        HSSFPatriarch drawingPatriarch = sheet.createDrawingPatriarch();
        /**
         * 参数4 设置图片的平铺程度 最大值255 255代表铺满当前单元格 <255代表铺不满
         * 参数5 列的开始坐标
         * 参数6 行的开始坐标
         * 参数7 列的结束坐标
         * 参数8 行的结束坐标
         */
        HSSFClientAnchor anchor = new HSSFClientAnchor(0,0,0,255,(short)3,1,(short)4,1);
        anchor.setAnchorType(ClientAnchor.AnchorType.DONT_MOVE_AND_RESIZE);
        drawingPatriarch.createPicture(anchor,workbook.addPicture(bos1.toByteArray(),HSSFWorkbook.PICTURE_TYPE_JPEG));

        //创建第三行
        index++;
        HSSFRow row3 = sheet.createRow(index);

        HSSFCell row3_Cell1 = row3.createCell(0);
        row3_Cell1.setCellStyle(baseStyle);
        row3_Cell1.setCellValue("客户姓名：");

        HSSFCell row3_Cell2 = row3.createCell(1);
        row3_Cell2.setCellStyle(baseStyle);
        row3_Cell2.setCellValue(customer.getCustName());

        HSSFCell row3_Cell3 = row3.createCell(2);
        row3_Cell3.setCellStyle(baseStyle);
        row3_Cell3.setCellValue("客户身份证号：");

        HSSFCell row3_Cell4 = row3.createCell(3);
        row3_Cell4.setCellStyle(baseStyle);
        row3_Cell4.setCellValue(rent.getIdentity());

        //创建第四行
        index++;
        HSSFRow row4 = sheet.createRow(index);

        HSSFCell row4_Cell1 = row4.createCell(0);
        row4_Cell1.setCellStyle(baseStyle);
        row4_Cell1.setCellValue("起租时间：");

        HSSFCell row4_Cell2 = row4.createCell(1);
        row4_Cell2.setCellStyle(baseStyle);
        row4_Cell2.setCellValue(rent.getBeginDate().toLocaleString());

        HSSFCell row4_Cell3 = row4.createCell(2);
        row4_Cell3.setCellStyle(baseStyle);
        row4_Cell3.setCellValue("换车时间：");

        HSSFCell row4_Cell4 = row4.createCell(3);
        row4_Cell4.setCellStyle(baseStyle);
        row4_Cell4.setCellValue(rent.getReturnDate().toLocaleString());

        //创建第五行
        index++;
        HSSFRow row5 = sheet.createRow(index);

        HSSFCell row5_Cell1 = row5.createCell(0);
        row5_Cell1.setCellStyle(baseStyle);
        row5_Cell1.setCellValue("车辆编号：");

        HSSFCell row5_Cell2 = row5.createCell(1);
        row5_Cell2.setCellStyle(baseStyle);
        row5_Cell2.setCellValue(rent.getCarNumber());

        HSSFCell row5_Cell3 = row5.createCell(2);
        row5_Cell3.setCellStyle(baseStyle);
        row5_Cell3.setCellValue("出租价格：");

        HSSFCell row5_Cell4 = row5.createCell(3);
        row5_Cell4.setCellStyle(baseStyle);
        row5_Cell4.setCellValue(rent.getPrice());

        //创建第七行
        index=index+2;
        HSSFRow row7 = sheet.createRow(index);

        HSSFCell row7_Cell3 = row7.createCell(2);
        row7_Cell3.setCellStyle(baseStyle);
        row7_Cell3.setCellValue("打印时间：");

        HSSFCell row7_Cell4 = row7.createCell(3);
        row7_Cell4.setCellStyle(baseStyle);
        row7_Cell4.setCellValue(new Date().toLocaleString());

        //创建第八行
        index++;
        HSSFRow row8 = sheet.createRow(index);

        HSSFCell row8_Cell3 = row8.createCell(2);
        row8_Cell3.setCellStyle(baseStyle);
        row8_Cell3.setCellValue("填写人：");

        HSSFCell row8_Cell4 = row8.createCell(3);
        row8_Cell4.setCellStyle(baseStyle);
        row8_Cell4.setCellValue(rent.getOperName());

        //创建第九行
        index++;
        HSSFRow row9 = sheet.createRow(index);

        HSSFCell row9_Cell3 = row9.createCell(2);
        row9_Cell3.setCellStyle(baseStyle);
        row9_Cell3.setCellValue("客户签名：");

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        try {
            workbook.write(bos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bos;
    }
}
