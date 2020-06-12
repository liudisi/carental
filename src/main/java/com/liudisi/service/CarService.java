package com.liudisi.service;

import com.liudisi.domain.Car;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CarVo;

/**
 * @author liudisi
 * 车辆管理Service
 */
public interface CarService {
    /**
     * 查询所有车辆信息
     * @param carVo
     * @return
     */
    ResultObject findAllCar(CarVo carVo);

    /**
     * 添加车辆
     * @param carVo
     */
    void addCar(CarVo carVo);

    /**
     * 修改车辆信息
     * @param carVo
     */
    void updateCar(CarVo carVo);

    /**
     * 根据车牌号删除车辆信息
     * @param carNumber
     */
    void deleteCarByCarNumber(String carNumber);

    /**
     * 批量删除车辆信息
     * @param carNumbers
     */
    void batchDeleteCar(String[] carNumbers);

    /**
     * 根据车牌号查询车辆信息
     * @param carNumber
     * @return
     */
    Car findCarByCarNumber(String carNumber);
}
