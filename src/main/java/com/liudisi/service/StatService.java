package com.liudisi.service;

import com.liudisi.domain.Stat;

import java.util.List;

/**
 * @author liudisi
 * 统计分析Service
 */
public interface StatService {

    /**
     * 查询客户地区的数据
     * @return
     */
    List<Stat> findCusAddressStatList();

    /**
     * 查询年度业务员销售总额的数据
     * @return
     */
    List<Stat> findOperNamePricesToYearStatData(String year);

    /**
     * 查询公司年度月份销售总额的数据
     * @param year
     * @return
     */
    List<Double> findCompanyPricesToYearMonthStatData(String year);
}
