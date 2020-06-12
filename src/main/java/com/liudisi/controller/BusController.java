package com.liudisi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author liudisi
 * 负责系统业务跳转Controller
 */
@RequestMapping("bus")
@Controller
public class BusController {

    /**
     * 跳转到客户管理页面
     *
     * @return
     */
    @RequestMapping("toCustomerManager")
    public String toCustomerManager() {
        return "business/customer/customerManager";
    }

    /**
     * 跳转到车辆管理页面
     *
     * @return
     */
    @RequestMapping("toCarManager")
    public String toCarManager() {
        return "business/car/carManager";
    }

    /**
     * 跳转到汽车出租页面
     *
     * @return
     */
    @RequestMapping("toCarRentalManager")
    public String toCarRentalManager() {
        return "business/rent/carRentalManager";
    }

    /**
     * 跳转到出租单管理页面
     *
     * @return
     */
    @RequestMapping("toRentManager")
    public String toRentManager() {
        return "business/rent/rentManager";
    }

    /**
     * 跳转到汽车入库页面
     *
     * @return
     */
    @RequestMapping("toCarStorageManager")
    public String toCarStorageManager() {
        return "business/check/carStorageManager";
    }

    /**
     * 跳转到检查单管理页面
     *
     * @return
     */
    @RequestMapping("toCheckManager")
    public String toCheckManager() {
        return "business/check/checkManager";
    }
}
