package com.liudisi.controller;

import com.liudisi.domain.Customer;
import com.liudisi.service.CustomerService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author liudisi
 * 客户管理Controller
 */
@RestController
@RequestMapping("cus")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    /**
     * 查询所有客户信息
     *
     * @param customerVo
     * @return
     */
    @RequestMapping("findAllCustomer")
    public ResultObject findAllCustomer(CustomerVo customerVo) {
        return customerService.findAllCustomer(customerVo);
    }

    /**
     * 添加客户
     *
     * @param customerVo
     * @return
     */
    @RequestMapping("addCustomer")
    public Result addCustomer(CustomerVo customerVo) {
        try {
            customerService.addCustomer(customerVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改客户信息
     *
     * @param customerVo
     * @return
     */
    @RequestMapping("updateCustomer")
    public Result updateCustomer(CustomerVo customerVo) {
        try {
            customerService.updateCustomer(customerVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据身份证号删除客户信息
     *
     * @param identity
     * @return
     */
    @RequestMapping("deleteCustomerByIdentity")
    public Result deleteCustomerByIdentity(@RequestParam("identity") String identity) {
        try {
            customerService.deleteCustomerByIdentity(identity);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 批量删除客户信息
     *
     * @param identity
     * @return
     */
    @RequestMapping("batchDeleteCustomer")
    public Result batchDeleteCustomer(@RequestParam("identity") String[] identity) {
        try {
            customerService.batchDeleteCustomer(identity);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

}
