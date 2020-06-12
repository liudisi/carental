package com.liudisi.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liudisi
 * 车辆管理实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Car implements Serializable {
    /**
     * 车牌号
     */
    private String carNumber;

    /**
     * 车辆型号
     */
    private String carType;

    /**
     * 车辆颜色
     */
    private String color;

    /**
     * 购买价格
     */
    private Double price;

    /**
     * 出租价格
     */
    private Double rentPrice;

    /**
     * 出租押金
     */
    private Double deposit;

    /**
     * 出租状态 0：未出租，1：已出租
     */
    private Integer isRenting;

    /**
     * 车辆描述
     */
    private String description;

    /**
     * 缩略图
     */
    private String carImg;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
}
