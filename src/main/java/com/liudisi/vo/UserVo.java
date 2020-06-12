package com.liudisi.vo;

import com.liudisi.domain.User;
import lombok.Data;

/**
 * @author liudisi
 * 用户实体的增强类
 */
@Data
public class UserVo extends User {
    //页数
    private Integer page;
    //每页条数
    private Integer limit;

    //验证码
    private String verifyCode;
}
