package com.liudisi.controller;

import com.liudisi.domain.Rent;
import com.liudisi.service.CheckService;
import com.liudisi.service.RentService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CheckVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author liudisi
 * 检查单管理的Controller
 */
@RestController
@RequestMapping("check")
public class CheckController {

    @Autowired
    private CheckService checkService;

    @Autowired
    private RentService rentService;

    /***************汽车入库*****************/

    /**
     * 根据出租单号检查出租单信息是否存在
     *
     * @param rentId
     * @return
     */
    @RequestMapping("checkRentIsExist")
    public Rent checkRentIsExist(@RequestParam("rentId") String rentId) {
        return rentService.checkRentIsExist(rentId);
    }

    /**
     * 初始化检查单表单和面板数据
     *
     * @param rentId
     * @return
     */
    @RequestMapping("initCheckFromDataAndCard")
    public Map<String, Object> initCheckFromDataAndCard(@RequestParam("rentId") String rentId) {
        return checkService.initCheckFromDataAndCard(rentId);
    }

    /**
     * 添加检查单
     * @param checkVo
     * @return
     */
    @RequestMapping("addCheck")
    public Result addCheck(CheckVo checkVo) {
        try {
            checkService.addCheck(checkVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            return Result.ADD_ERROR;
        }
    }

    /***************检查单管理*****************/

    /**
     * 查询所有检查单信息
     * @param checkVo
     * @return
     */
    @RequestMapping("findAllCheck")
    public ResultObject findAllCheck(CheckVo checkVo){
        return checkService.findAllCheck(checkVo);
    }

    /**
     * 修改检查单信息
     * @param checkVo
     * @return
     */
    @RequestMapping("updateCheck")
    public Result updateCheck(CheckVo checkVo){
        try {
            checkService.updateCheck(checkVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            return Result.UPDATE_ERROR;
        }
    }
}
