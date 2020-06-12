package com.liudisi.vo;

import com.liudisi.domain.Check;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author liudisi
 * 检查单实体的增强类
 */
@Data
public class CheckVo extends Check {
    //页数
    private Integer page;

    //每页条数
    private Integer limit;

    //开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    //结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;
}
