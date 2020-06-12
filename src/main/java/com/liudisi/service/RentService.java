package com.liudisi.service;

import com.liudisi.domain.Rent;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.RentVo;

/**
 * @author liudisi
 * 出租单管理的Service
 */
public interface RentService {
    /**
     * 初始化汽车出租页面表单数据
     *
     * @param rentVo
     * @return
     */
    ResultObject initRentFrom(RentVo rentVo);

    /**
     * 添加出租单信息
     *
     * @param rentVo
     */
    void addRent(RentVo rentVo);

    /**
     * 查询所有出租单信息
     *
     * @param rentVo
     * @return
     */
    ResultObject findAllRent(RentVo rentVo);

    /**
     * 根据出租单号删除出租单信息
     *
     * @param rentId
     */
    void deleteRentByRentId(String rentId);

    /**
     * 修改出租单信息
     *
     * @param rentVo
     */
    void updateRent(RentVo rentVo);

    /**
     * 根据出租单号检查出租单信息是否存在
     *
     * @param rentId
     * @return
     */
    Rent checkRentIsExist(String rentId);

    /**
     * 根据出租单号导出相关出租单信息
     * @param rentId
     * @return
     */
    Rent findRentByRentId(String rentId);
}
