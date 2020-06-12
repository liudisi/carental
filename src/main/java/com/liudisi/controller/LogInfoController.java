package com.liudisi.controller;

import com.liudisi.service.LogInfoService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudisi
 * 日志管理Controller
 */
@RestController
@RequestMapping("logInfo")
public class LogInfoController {

    @Autowired
    private LogInfoService logInfoService;

    /**
     * 查看日志信息
     *
     * @param logInfoVo
     * @return
     */
    @RequestMapping("findAllLogInfo")
    public ResultObject findAllLogInfo(LogInfoVo logInfoVo) {
        return logInfoService.findAllLogInfo(logInfoVo);
    }

    /**
     * 根据id删除日志信息
     *
     * @param id
     * @return
     */
    @RequestMapping("deleteLogInfoById")
    public Result deleteLogInfoById(@RequestParam("id") Integer id) {
        try {
            logInfoService.deleteLogInfoById(id);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 批量删除日志信息
     *
     * @param ids
     * @return
     */
    @RequestMapping("batchDeleteByIds")
    public Result batchDeleteByIds(@RequestParam("id") Integer[] ids) {
        try {
            logInfoService.batchDeleteByIds(ids);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            return Result.DELETE_ERROR;
        }
    }
}
