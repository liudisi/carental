package com.liudisi.service.impl;

import com.liudisi.dao.StatDao;
import com.liudisi.domain.Stat;
import com.liudisi.service.StatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liudisi
 * 统计分析Service接口的实现类
 */
@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatDao statDao;

    @Override
    public List<Stat> findCusAddressStatList() {
        return statDao.findCusAddressStatData();
    }

    @Override
    public List<Stat> findOperNamePricesToYearStatData(String year) {
        return statDao.findOperNamePricesToYearStatData(year);
    }

    @Override
    public List<Double> findCompanyPricesToYearMonthStatData(String year) {
        List<Double> d = statDao.findCompanyPricesToYearMonthStatData(year);
        for (int i = 0; i < d.size(); i++) {
            if (null == d.get(i)) {
                d.set(i, 0.0);
            }
        }
        return d;
    }
}
