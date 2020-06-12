package com.liudisi.utils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @author liudisi
 * 文件名工具类
 */
public class FileNameUtils {

    public static String PARENT_PATH = "E:/upload/";
    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
    private static Random random = new Random();

    /**
     * 生成文件名使用时间+4位随机数+临时后缀
     *
     * @param fileName 文件名称
     * @param suffix   临时文件后缀
     */
    public static String createFileNameUseTime(String fileName, String suffix) {
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."), fileName.length());
        String time = sdf.format(new Date());
        int num = random.nextInt(9000) + 1000;
        return time + num + fileSuffix + suffix;
    }

    /**
     * 修改文件名
     *
     * @param carImg
     * @param suffix
     * @return
     */
    public static String updateFileName(String carImg, String suffix) {
        try {
            //找到相应的文件对象
            File file = new File(PARENT_PATH, carImg);
            if (file.exists()) {
                file.renameTo(new File(PARENT_PATH, carImg.replace(suffix, "")));
                return carImg.replace(suffix, "");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 删除文件
     *
     * @param carImg
     */
    public static void removeFileByOldPath(String carImg) {
        try {
            //找到相应的文件对象
            File file = new File(PARENT_PATH, carImg);
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
