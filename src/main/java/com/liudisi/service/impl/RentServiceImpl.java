package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.constast.SystemConstast;
import com.liudisi.dao.CarDao;
import com.liudisi.dao.RentDao;
import com.liudisi.domain.Car;
import com.liudisi.domain.Rent;
import com.liudisi.domain.User;
import com.liudisi.service.RentService;
import com.liudisi.utils.RandomUtils;
import com.liudisi.utils.ResultObject;
import com.liudisi.utils.WebUtils;
import com.liudisi.vo.RentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author liudisi
 * 出租单管理Service的实现类
 */
@Service
public class RentServiceImpl implements RentService {
    @Autowired
    private RentDao rentDao;

    @Autowired
    private CarDao carDao;

    @Override
    public ResultObject initRentFrom(RentVo rentVo) {
        //设置出租单号
        rentVo.setRentId(RandomUtils.createRandomStringByTime(SystemConstast.CAR_ORDER_CZ));
        //设置起租时间
        rentVo.setBeginDate(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        //设置填写人
        rentVo.setOperName(user.getRealName());
        return new ResultObject(rentVo);
    }

    @Override
    public void addRent(RentVo rentVo) {
        rentVo.setCreateTime(new Date());
        rentVo.setRentFlag(SystemConstast.CAR_RENT_FLAG_FALSE);
        rentDao.addRent(rentVo);
        //更改车辆出租状态
        Car car = new Car();
        car.setCarNumber(rentVo.getCarNumber());
        car.setIsRenting(SystemConstast.CAR_RENT_IS_TRUE);
        carDao.updateCar(car);
    }

    @Override
    public ResultObject findAllRent(RentVo rentVo) {
        Page<Object> page = PageHelper.startPage(rentVo.getPage(), rentVo.getLimit());
        List<Rent> allRent = rentDao.findAllRent(rentVo);
        return new ResultObject(page.getTotal(), allRent);
    }

    @Override
    public void deleteRentByRentId(String rentId) {
        //更改车辆出租状态
        Rent rent = rentDao.findRentByRentId(rentId);
        Car car = carDao.findCarByCarNumber(rent.getCarNumber());
        car.setIsRenting(SystemConstast.CAR_RENT_IS_FALSE);
        carDao.updateCar(car);
        //根据出租单号删除出租单信息
        rentDao.deleteRentByRentId(rentId);
    }

    @Override
    public void updateRent(RentVo rentVo) {
        rentDao.updateRent(rentVo);
    }

    @Override
    public Rent checkRentIsExist(String rentId) {
        return rentDao.findRentByRentId(rentId);
    }

    @Override
    public Rent findRentByRentId(String rentId) {
        return rentDao.findRentByRentId(rentId);
    }
}
