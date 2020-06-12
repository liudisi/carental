package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.constast.SystemConstast;
import com.liudisi.dao.CarDao;
import com.liudisi.dao.CheckDao;
import com.liudisi.dao.CustomerDao;
import com.liudisi.dao.RentDao;
import com.liudisi.domain.*;
import com.liudisi.service.CheckService;
import com.liudisi.utils.RandomUtils;
import com.liudisi.utils.ResultObject;
import com.liudisi.utils.WebUtils;
import com.liudisi.vo.CheckVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liudisi
 * 检查单管理Service的实现类
 */
@Service
public class CheckServiceImpl implements CheckService {

    @Autowired
    private CheckDao checkDao;

    @Autowired
    private RentDao rentDao;

    @Autowired
    private CarDao carDao;

    @Autowired
    private CustomerDao customerDao;

    @Override
    public Map<String, Object> initCheckFromDataAndCard(String rentId) {
        Map<String, Object> map = new HashMap<>();
        //根据出租单号获取出租单信息
        Rent rent = rentDao.findRentByRentId(rentId);
        //根据车牌号获取车辆信息
        Car car = carDao.findCarByCarNumber(rent.getCarNumber());
        //根据身份证号获取客户信息
        Customer customer = customerDao.findCustomerByIdentity(rent.getIdentity());
        //组装Check
        Check check = new Check();
        check.setCheckId(RandomUtils.createRandomStringByTime(SystemConstast.CAR_ORDER_JC));
        check.setRentId(rentId);
        check.setCheckDate(new Date());
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        check.setOperName(user.getRealName());
        //封装数据
        map.put("rent", rent);
        map.put("car", car);
        map.put("customer", customer);
        map.put("check", check);
        return map;
    }

    @Override
    public void addCheck(CheckVo checkVo) {
        checkVo.setCreateTime(new Date());
        //添加检查单信息
        checkDao.addCheck(checkVo);
        //更新出租单状态为已归还
        Rent rent = rentDao.findRentByRentId(checkVo.getRentId());
        rent.setRentFlag(SystemConstast.CAR_RENT_FLAG_TRUE);
        rentDao.updateRent(rent);
        //更新车辆出租状态为未出租
        Car car = carDao.findCarByCarNumber(rent.getCarNumber());
        car.setIsRenting(SystemConstast.CAR_RENT_IS_FALSE);
        carDao.updateCar(car);
    }

    @Override
    public ResultObject findAllCheck(CheckVo checkVo) {
        Page<Object> page = PageHelper.startPage(checkVo.getPage(), checkVo.getLimit());
        List<Check> checks = checkDao.findAllCheck(checkVo);
        return new ResultObject(page.getTotal(),checks);
    }

    @Override
    public void updateCheck(CheckVo checkVo) {
        checkDao.updateCheck(checkVo);
    }
}
