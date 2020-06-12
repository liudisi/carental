package com.liudisi.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liudisi
 * 登录日志实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class LogInfo implements Serializable {
    /**
     * 自增id
     */
    private Integer id;
    /**
     * 登录名
     */
    private String loginName;
    /**
     * 登录ip
     */
    private String loginIp;
    /**
     * 登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date loginTime;
}
