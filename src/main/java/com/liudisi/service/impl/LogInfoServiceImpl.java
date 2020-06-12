package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.dao.LogInfoDao;
import com.liudisi.domain.LogInfo;
import com.liudisi.service.LogInfoService;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.LogInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liudisi
 * 日志管理Service实现类
 */
@Service
public class LogInfoServiceImpl implements LogInfoService {

    @Autowired
    private LogInfoDao logInfoDao;

    @Override
    public ResultObject findAllLogInfo(LogInfoVo logInfoVo) {
        Page<Object> page = PageHelper.startPage(logInfoVo.getPage(), logInfoVo.getLimit());
        List<LogInfo> allLogInfo = logInfoDao.findAllLogInfo(logInfoVo);
        return new ResultObject(page.getTotal(),allLogInfo);
    }

    @Override
    public void deleteLogInfoById(Integer id) {
        logInfoDao.deleteLogInfoById(id);
    }

    @Override
    public void batchDeleteByIds(Integer[] ids) {
        logInfoDao.batchDeleteLogInfoByIds(ids);
    }

    @Override
    public void addLogInfo(LogInfoVo logInfoVo) {
        logInfoDao.addLogInfo(logInfoVo);
    }
}
