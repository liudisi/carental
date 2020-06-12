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
 * 出租单实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rent implements Serializable {

    /**
     * 出租单号
     */
    private String rentId;

    /**
     * 出租价格
     */
    private Double price;

    /**
     * 起租时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date beginDate;

    /**
     * 归还时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date returnDate;

    /**
     * 出租单状态 0：未归还，1：已归还
     */
    private Integer rentFlag;

    /**
     * 身份证号
     */
    private String identity;

    /**
     * 车牌号
     */
    private String carNumber;

    /**
     * 填写人
     */
    private String operName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;
}
