package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.constast.SystemConstast;
import com.liudisi.dao.CarDao;
import com.liudisi.domain.Car;
import com.liudisi.service.CarService;
import com.liudisi.utils.FileNameUtils;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CarVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author liudisi
 * 车辆管理Service的实现类
 */
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarDao carDao;

    @Override
    public ResultObject findAllCar(CarVo carVo) {
        Page<Object> page = PageHelper.startPage(carVo.getPage(), carVo.getLimit());
        List<Car> allCars = carDao.findAllCar(carVo);
        return new ResultObject(page.getTotal(), allCars);
    }

    @Override
    public void addCar(CarVo carVo) {
        carVo.setCreateTime(new Date());
        carDao.addCar(carVo);
    }

    @Override
    public void updateCar(CarVo carVo) {
        carDao.updateCar(carVo);
    }

    @Override
    public void deleteCarByCarNumber(String carNumber) {
        Car car = carDao.findCarByCarNumber(carNumber);
        //如果不是默认图片，删除图片文件
        if (!car.getCarImg().equals(SystemConstast.DEFAULT_CAR_IMG)) {
            FileNameUtils.removeFileByOldPath(car.getCarImg());
        }
        carDao.deleteCarByCarNumber(carNumber);
    }

    @Override
    public void batchDeleteCar(String[] carNumbers) {
        List<Car> cars = carDao.batchFindCarByCarNumber(carNumbers);
        //批量删除图片文件
        for (Car car : cars) {
            //如果不是默认图片，删除图片文件
            if (!car.getCarImg().equals(SystemConstast.DEFAULT_CAR_IMG)) {
                FileNameUtils.removeFileByOldPath(car.getCarImg());
            }
        }
        carDao.batchDeleteCar(carNumbers);
    }

    @Override
    public Car findCarByCarNumber(String carNumber) {
        return carDao.findCarByCarNumber(carNumber);
    }
}
