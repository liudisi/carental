package com.liudisi.controller;

import com.liudisi.domain.Customer;
import com.liudisi.service.CustomerService;
import com.liudisi.service.RentService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.RentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudisi
 * 出租单管理的Controller
 */
@RestController
@RequestMapping("rent")
public class RentController {

    @Autowired
    private RentService rentService;

    @Autowired
    private CustomerService customerService;

    /***************汽车出租*****************/

    /**
     * 根据身份证号检查客户信息是否存在
     *
     * @param identity
     * @return
     */
    @RequestMapping("checkCustomerIsExist")
    public Result checkCustomerIsExist(String identity) {
        Customer customer = customerService.checkCustomerIsExist(identity);
        if (null != customer) {
            return Result.STATUSCODE_TRUE;
        }
        return Result.STATUSCODE_FALSE;
    }

    /**
     * 初始化汽车出租页面表单数据
     *
     * @param rentVo
     * @return
     */
    @RequestMapping("initRentFrom")
    public ResultObject initRentFrom(RentVo rentVo) {
        return rentService.initRentFrom(rentVo);
    }

    /**
     * 添加出租单信息
     *
     * @param rentVo
     * @return
     */
    @RequestMapping("addRent")
    public Result addRent(RentVo rentVo) {
        try {
            rentService.addRent(rentVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /***************出租单管理*****************/

    /**
     * 查询所有出租单信息
     *
     * @param rentVo
     * @return
     */
    @RequestMapping("findAllRent")
    public ResultObject findAllRent(RentVo rentVo) {
        return rentService.findAllRent(rentVo);
    }

    /**
     * 根据出租单号删除出租单信息
     *
     * @param rentId
     * @return
     */
    @RequestMapping("deleteRentByRentId")
    public Result deleteRentByRentId(@RequestParam("rentId") String rentId) {
        try {
            rentService.deleteRentByRentId(rentId);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 修改出租单信息
     *
     * @param rentVo
     * @return
     */
    @RequestMapping("updateRent")
    public Result updateRent(RentVo rentVo) {
        try {
            rentService.updateRent(rentVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }
}
