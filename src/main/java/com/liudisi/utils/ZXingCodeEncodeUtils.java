package com.liudisi.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.util.EnumMap;

/**
 * @author liudisi
 * 生成二维码
 */
public class ZXingCodeEncodeUtils {

    //二维码颜色
    private static final int BLACK = 0xFF000000;
    //二维码背景颜色
    private static final int WHITE = 0xFFFFFFFF;
    //二维码格式参数
    private static final EnumMap<EncodeHintType, Object> hints =
            new EnumMap<EncodeHintType, Object>(EncodeHintType.class);

    static {
        /**
         * 二维码的纠错级别（排错率），4个级别：L(7%)、M(15%)、Q(25%)、H(30%)（最高H）
         * 纠错信息同样存储在二维码中，纠错级别越高，纠错信息占用的空间越多，那么能存储的有用信息就越少；共4个级别；选M，扫描速度越快
         */
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
        //二维码边界空白大小1,2,3,4（4为默认，最大）
        hints.put(EncodeHintType.MARGIN, 1);
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");//设置放入的字符的编码
    }

    /**
     * 生成二维码保存到D盘
     *
     * @param content
     * @param width
     * @param height
     * @param savePath
     * @param imgType
     */
    public static void createZXingCodeSaveToDisk(String content, int width, int height, String savePath, String imgType) {
        //生成二维码，返回信号信息，不是一个图片，BarcodeFormat为算法
        BitMatrix encode = null;
        try {
            encode = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);
            //得到二维码的宽度
            int encodeWidth = encode.getWidth();
            //得到二维码的高度
            int encodeHeight = encode.getHeight();
            //创建图片，BufferedImage.TYPE_INT_RGB图片类型为彩色
            BufferedImage image = new BufferedImage(encodeWidth, encodeHeight, BufferedImage.TYPE_INT_RGB);
            //把二维码里面的信息写入到图片
            for (int i = 0; i < encodeWidth; i++) {
                for (int j = 0; j < encodeHeight; j++) {
                    image.setRGB(i, j, encode.get(i, j) ? BLACK : WHITE);
                }
            }
            //保存图片到硬盘
            File file = new File(savePath);
            if (!file.exists()) {
                file.createNewFile();
            }
            ImageIO.write(image, imgType, file);
            System.out.println("生成成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成二维码返回图片对象
     *
     * @param content
     * @param width
     * @param height
     */
    public static BufferedImage createZXingCodeNormal(String content, int width, int height) {
        //生成二维码，返回信号信息，不是一个图片，BarcodeFormat为算法
        BitMatrix encode = null;
        try {
            encode = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, width, height, hints);
            //得到二维码的宽度
            int encodeWidth = encode.getWidth();
            //得到二维码的高度
            int encodeHeight = encode.getHeight();
            //创建图片，BufferedImage.TYPE_INT_RGB图片类型为彩色
            BufferedImage image = new BufferedImage(encodeWidth, encodeHeight, BufferedImage.TYPE_INT_RGB);
            //把二维码里面的信息写入到图片
            for (int i = 0; i < encodeWidth; i++) {
                for (int j = 0; j < encodeHeight; j++) {
                    image.setRGB(i, j, encode.get(i, j) ? BLACK : WHITE);
                }
            }
            return image;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 生成一张带Logo的图片并保存到D盘
     *
     * @param content
     * @param width
     * @param height
     * @param imageType
     * @param savePath
     * @param logoStream logo的流对象
     */
    public static void createZXingCodeUseLogoSaveToDisk(String content, int width, int height, String imageType,
                                                        String savePath, InputStream logoStream) {
        try {
            //生成二维码图片
            BufferedImage image = createZXingCodeNormal(content, width, height);
            if (null != image) {
                //判断logoStream是否为空
                if (null != logoStream) {
                    //拿到可以操作当前图片的画笔
                    Graphics2D graphics = image.createGraphics();
                    //得到logo图片的对象
                    BufferedImage logoImage = ImageIO.read(logoStream);
                    //得到logo图片的原始宽高
                    int old_logo_width = logoImage.getWidth();
                    int old_logo_height = logoImage.getHeight();

                    //得到二维码图片的宽高
                    int code_width = image.getWidth();
                    int code_height = image.getHeight();

                    //得出logo在二维码里面能存在的最大值
                    int logo_max_width = code_width / 5;
                    int logo_max_height = code_height / 5;

                    //计算logo的可用宽高
                    int logo_width = logo_max_width < old_logo_width ? logo_max_width : old_logo_width;
                    int logo_height = logo_max_height < old_logo_height ? logo_max_height : old_logo_height;

                    //计算logo开始点的坐标
                    int logo_x = (code_width - logo_width) / 2;
                    int logo_y = (code_height - logo_height) / 2;

                    /**
                     * logoImage logo图片对象
                     * logo_x 开始画的x坐标轴
                     * logo_y 开始画的y坐标轴
                     * logo_width 要画的x轴的长度
                     * logo_height 要画的y轴的长度
                     * arg5 null
                     */
                    graphics.drawImage(logoImage, logo_x, logo_y, logo_width, logo_height, null);

                    //设置logo边框的大小
                    graphics.setStroke(new BasicStroke(2));
                    //设置边框颜色
                    graphics.setColor(Color.GREEN);
                    //画白色边框
                    graphics.drawRoundRect(logo_x, logo_y, logo_width, logo_height, 15, 15);
                    //让画上去的内容生效
                    graphics.dispose();
                    //保存图片到硬盘
                    File file = new File(savePath);
                    if (!file.exists()) {
                        file.createNewFile();
                    }
                    ImageIO.write(image, imageType, file);
                    System.out.println("生成成功");
                }
            } else {
                System.out.println("生成失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成一张带Logo的图片返回图片对象
     *
     * @param content
     * @param width
     * @param height
     * @param logoStream logo的流对象
     */
    public static BufferedImage createZXingCodeUseLogoNormal(String content, int width, int height, InputStream logoStream) {
        try {
            //生成二维码图片
            BufferedImage image = createZXingCodeNormal(content, width, height);
            if (null != image) {
                //判断logoStream是否为空
                if (null != logoStream) {
                    //拿到可以操作当前图片的画笔
                    Graphics2D graphics = image.createGraphics();
                    //得到logo图片的对象
                    BufferedImage logoImage = ImageIO.read(logoStream);
                    //得到logo图片的原始宽高
                    int old_logo_width = logoImage.getWidth();
                    int old_logo_height = logoImage.getHeight();

                    //得到二维码图片的宽高
                    int code_width = image.getWidth();
                    int code_height = image.getHeight();

                    //得出logo在二维码里面能存在的最大值
                    int logo_max_width = code_width / 5;
                    int logo_max_height = code_height / 5;

                    //计算logo的可用宽高
                    int logo_width = logo_max_width < old_logo_width ? logo_max_width : old_logo_width;
                    int logo_height = logo_max_height < old_logo_height ? logo_max_height : old_logo_height;

                    //计算logo开始点的坐标
                    int logo_x = (code_width - logo_width) / 2;
                    int logo_y = (code_height - logo_height) / 2;

                    /**
                     * logoImage logo图片对象
                     * logo_x 开始画的x坐标轴
                     * logo_y 开始画的y坐标轴
                     * logo_width 要画的x轴的长度
                     * logo_height 要画的y轴的长度
                     * arg5 null
                     */
                    graphics.drawImage(logoImage, logo_x, logo_y, logo_width, logo_height, null);

                    //设置logo边框的大小
                    graphics.setStroke(new BasicStroke(2));
                    //设置边框颜色
                    graphics.setColor(Color.WHITE);
                    //画白色边框
                    graphics.drawRoundRect(logo_x, logo_y, logo_width, logo_height, 15, 15);
                    //让画上去的内容生效
                    graphics.dispose();
                    return image;
                }
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("生成失败");
        }
        return null;
    }
}
