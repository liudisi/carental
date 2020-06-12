package com.liudisi.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author liudisi
 * 客户管理实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer implements Serializable {
    /**
     * 身份证号
     */
    private String identity;

    /**
     * 客户姓名
     */
    private String custName;

    /**
     * 性别 0：女，1：男
     */
    private Integer sex;

    /**
     * 地址
     */
    private String address;

    /**
     * 电话
     */
    private String phone;

    /**
     * 职位
     */
    private String career;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
}
