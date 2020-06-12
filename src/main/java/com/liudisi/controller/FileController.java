package com.liudisi.controller;

import com.liudisi.constast.SystemConstast;
import com.liudisi.utils.FileNameUtils;
import com.liudisi.utils.ResultObject;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author liudisi
 * 文件上传和下载的Controller
 */
@RequestMapping("file")
@Controller
public class FileController {
    /**
     * 文件上传
     *
     * @param upload
     * @return
     */
    @RequestMapping("uploadFile")
    @ResponseBody
    public ResultObject uploadFile(MultipartFile upload) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //得到当前日期作为文件夹的名称
        String dirName = sdf.format(new Date());
        // 构造文件夹对象
        File file = new File(FileNameUtils.PARENT_PATH, dirName);
        //判断当前目录是否存在
        if (!file.exists()) {
            //创建文件夹
            file.mkdirs();
        }
        //获取上传文件的文件名
        String filename = upload.getOriginalFilename();
        String newFileName = FileNameUtils.createFileNameUseTime(filename, SystemConstast.UPLOAD_FILE_TEMP);
        upload.transferTo(new File(file, newFileName));

        Map<String, Object> map = new HashMap<>();
        map.put("src", dirName + "/" + newFileName);
        return new ResultObject(map);
    }

    /**
     * 只显示不下载
     *
     * @param path
     * @param response
     * @return
     */
    @RequestMapping("downloadFile")
    public ResponseEntity<Object> downloadFile(@RequestParam("path") String path, HttpServletResponse response) {
        //使用绝对路径+相对路径去找到文件对象
        File file = new File(FileNameUtils.PARENT_PATH, path);
        if (file.exists()) {
            try {
                //把file转换成字节数组
                byte[] bytes = FileUtils.readFileToByteArray(file);
                HttpHeaders headers = new HttpHeaders();
                //封装响应MIME类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                //创建ResponseEntity对象
                ResponseEntity<Object> entity = new ResponseEntity<>(bytes, headers, HttpStatus.CREATED);
                return entity;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        } else {
            PrintWriter out;
            try {
                out = response.getWriter();
                out.write("文件不存在！");
                out.flush();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
