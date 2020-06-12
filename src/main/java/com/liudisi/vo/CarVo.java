package com.liudisi.vo;

import com.liudisi.domain.Car;
import lombok.Data;

/**
 * @author liudisi
 * 车辆管理实体的增强类
 */
@Data
public class CarVo extends Car {
    //页数
    private Integer page;

    //每页条数
    private Integer limit;
}
