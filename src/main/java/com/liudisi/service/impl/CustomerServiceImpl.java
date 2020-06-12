package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.dao.CustomerDao;
import com.liudisi.domain.Customer;
import com.liudisi.service.CustomerService;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.CustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author liudisi
 * 客户管理Service的实现类
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerDao customerDao;

    @Override
    public ResultObject findAllCustomer(CustomerVo customerVo) {
        Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getLimit());
        List<Customer> allCustomer = customerDao.findAllCustomer(customerVo);
        return new ResultObject(page.getTotal(), allCustomer);
    }

    @Override
    public void addCustomer(CustomerVo customerVo) {
        customerVo.setCreateTime(new Date());
        customerDao.addCustomer(customerVo);
    }

    @Override
    public void updateCustomer(CustomerVo customerVo) {
        customerDao.updateCustomer(customerVo);
    }

    @Override
    public void deleteCustomerByIdentity(String identity) {
        customerDao.deleteCustomerByIdentity(identity);
    }

    @Override
    public void batchDeleteCustomer(String[] identity) {
        customerDao.batchDeleteCustomer(identity);
    }

    @Override
    public Customer checkCustomerIsExist(String identity) {
         return customerDao.findCustomerByIdentity(identity);
    }

    @Override
    public List<Customer> findCustomerForList(CustomerVo customerVo) {
        return customerDao.findAllCustomer(customerVo);
    }
}
