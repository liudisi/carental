package com.liudisi.service;

import com.liudisi.utils.ResultObject;
import com.liudisi.vo.LogInfoVo;

/**
 * @author liudisi
 * 日志管理Service
 */
public interface LogInfoService {

    /**
     * 查看日志信息
     * @param logInfoVo
     * @return
     */
     ResultObject findAllLogInfo(LogInfoVo logInfoVo);

    /**
     * 根据id删除日志信息
     * @param id
     */
    void deleteLogInfoById(Integer id);

    /**
     * 批量删除日志信息
     * @param ids
     */
    void batchDeleteByIds(Integer[] ids);

    /**
     * 添加日志
     * @param logInfoVo
     */
    void addLogInfo(LogInfoVo logInfoVo);
}
