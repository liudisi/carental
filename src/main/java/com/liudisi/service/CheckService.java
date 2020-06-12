package com.liudisi.service;

import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CheckVo;

import java.util.Map;

/**
 * @author liudisi
 * 检查单管理的Service
 */
public interface CheckService {
    /**
     * 初始化检查单表单和面板数据
     *
     * @param rentId
     * @return
     */
    Map<String, Object> initCheckFromDataAndCard(String rentId);

    /**
     * 添加检查单
     *
     * @param checkVo
     */
    void addCheck(CheckVo checkVo);

    /**
     * 查询所有检查单信息
     * @param checkVo
     * @return
     */
    ResultObject findAllCheck(CheckVo checkVo);

    /**
     * 修改检查单信息
     * @param checkVo
     */
    void updateCheck(CheckVo checkVo);
}
