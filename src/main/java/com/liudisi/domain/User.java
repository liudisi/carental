package com.liudisi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author liudisi
 * 用户实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {
    /**
     * 用户id 自增
     */
    private Integer userId;

    /**
     * 登录名
     */
    private String loginName;

    /**
     * 身份证号
     */
    private String identity;

    /**
     * 姓名
     */
    private String realName;

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
     * 密码
     */
    private String pwd;

    /**
     * 职位
     */
    private String position;

    /**
     * 类型 1：超级管理员，2：系统用户
     */
    private Integer type;

    /**
     * 是否可用 0：不可用，1：可用
     */
    private Integer available;
}
