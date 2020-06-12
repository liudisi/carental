package com.liudisi.task;

import com.liudisi.constast.SystemConstast;
import com.liudisi.utils.FileNameUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.File;

/**
 * @author liudisi
 * 回收临时文件的任务类
 */
@Component
public class RecoveryTempFileTask {

    /**
     * 回收临时文件任务
     *
     * 每晚12点执行
     */
    @Scheduled(cron = "0 0 0 * * ? ")
    public void recoveryTempFile(){
        File file = new File(FileNameUtils.PARENT_PATH);
        deleteFile(file);
    }

    /**
     * 删除图片
     * @param file
     */
    private void deleteFile(File file) {
        if (null != file){
            File[] listFiles = file.listFiles();
            if(null != listFiles&& listFiles.length>0){
                for (File listFile : listFiles) {
                    if (listFile.isFile()){
                        if (listFile.getName().endsWith(SystemConstast.UPLOAD_FILE_TEMP)){
                            listFile.delete();
                        }
                    }else {
                        //如果是文件夹在递归
                        deleteFile(listFile);
                    }
                }
            }
        }
    }
}
