package com.liudisi.utils;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;

/**
 * @author liudisi
 * 导出Excel文档样式工具类
 */
public class ExportHSSFCellStyleUtils {
    /**
     * 创建基础样式
     * 水平和垂直居中
     *
     * @param workbook
     * @return
     */
    public static HSSFCellStyle createBaseStyle(HSSFWorkbook workbook) {
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        //设置水平居中
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        //设置垂直居中
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        return cellStyle;
    }

    /**
     * 创建数据表格头的样式
     *
     * @param workbook
     * @return
     */
    public static HSSFCellStyle createTableTitleStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = createBaseStyle(workbook);
        //设置字体
        HSSFFont font = workbook.createFont();
        font.setBold(true);//加粗
//        font.setItalic(true);//斜体
        font.setFontHeightInPoints((short) 14);//设置字体大小
        font.setColor(HSSFColor.HSSFColorPredefined.RED.getIndex());//设置字体颜色
        font.setFontName("黑体");//设置字体

        style.setFont(font);

        return style;
    }

    /**
     * 创建小标题的样式
     *
     * @param workbook
     * @return
     */
    public static HSSFCellStyle createSubTitleStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = createBaseStyle(workbook);
        //设置字体
        HSSFFont font = workbook.createFont();
        font.setBold(true);//加粗
//        font.setItalic(true);//斜体
        font.setFontHeightInPoints((short) 16);//设置字体大小
        font.setColor(HSSFColor.HSSFColorPredefined.SKY_BLUE.getIndex());//设置字体颜色
        font.setFontName("黑体");//设置字体

        style.setFont(font);

        return style;
    }

    /**
     * 创建标题的样式
     *
     * @param workbook
     * @return
     */
    public static HSSFCellStyle createTitleStyle(HSSFWorkbook workbook) {
        HSSFCellStyle style = createBaseStyle(workbook);
        //设置字体
        HSSFFont font = workbook.createFont();
        font.setBold(true);//加粗
//        font.setItalic(true);//斜体
        font.setFontHeightInPoints((short) 18);//设置字体大小
        font.setColor(HSSFColor.HSSFColorPredefined.BLACK.getIndex());//设置字体颜色
        font.setFontName("华文行楷");//设置字体

        style.setFont(font);

        return style;
    }
}
