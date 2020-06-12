package com.liudisi.service;

import com.liudisi.domain.Customer;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CustomerVo;

import java.util.List;

/**
 * @author liudisi
 * 客户管理Service
 */
public interface CustomerService {
    /**
     * 查询所有客户信息
     *
     * @param customerVo
     * @return
     */
    ResultObject findAllCustomer(CustomerVo customerVo);

    /**
     * 添加客户
     *
     * @param customerVo
     */
    void addCustomer(CustomerVo customerVo);

    /**
     * 修改客户信心
     *
     * @param customerVo
     */
    void updateCustomer(CustomerVo customerVo);

    /**
     * 根据身份证号删除客户信息
     *
     * @param identity
     */
    void deleteCustomerByIdentity(String identity);

    /**
     * 批量删除客户信息
     *
     * @param identity
     */
    void batchDeleteCustomer(String[] identity);

    /**
     * 根据身份证号检查客户信息是否存在
     *
     * @param identity
     * @return
     */
    Customer checkCustomerIsExist(String identity);

    /**
     * 查询所有客户信息返回集合并导出
     * @param customerVo
     * @return
     */
    List<Customer> findCustomerForList(CustomerVo customerVo);
}
