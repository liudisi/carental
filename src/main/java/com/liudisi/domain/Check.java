package com.liudisi.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liudisi
 * 检查单实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Check implements Serializable {

    /**
     * 检查单号
     */
    private String checkId;

    /**
     * 检查时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date checkDate;

    /**
     *问题描述
     */
    private String checkDesc;

    /**
     * 存在问题
     */
    private String problem;

    /**
     * 赔付金额
     */
    private Double payMoney;

    /**
     * 填写人
     */
    private String operName;

    /**
     * 出租单号
     */
    private String rentId;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

}
