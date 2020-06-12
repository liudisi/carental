package com.liudisi.vo;

import com.liudisi.domain.Customer;
import lombok.Data;

/**
 * @author liudisi
 * 客户管理实体类的增强类
 */
@Data
public class CustomerVo extends Customer {

    //页数
    private Integer page;

    //每页条数
    private Integer limit;
}
