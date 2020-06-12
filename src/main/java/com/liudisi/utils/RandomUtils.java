package com.liudisi.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @author liudisi
 * 生成随机数的工具类
 */
public class RandomUtils {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
    private static Random random = new Random();
    /**
     * 根据时间+五位随机数生成字符串
     * @param prefix
     * @return
     */
    public static String createRandomStringByTime(String prefix){
        return prefix+"_"+sdf.format(new Date())+"_"+(random.nextInt(90000)+10000);
    }
}
