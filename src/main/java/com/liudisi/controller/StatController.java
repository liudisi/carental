package com.liudisi.controller;

import com.liudisi.domain.Customer;
import com.liudisi.domain.Rent;
import com.liudisi.domain.Stat;
import com.liudisi.service.CustomerService;
import com.liudisi.service.RentService;
import com.liudisi.service.StatService;
import com.liudisi.utils.ExportCustomerDataUtils;
import com.liudisi.utils.ExportRentDataUtils;
import com.liudisi.vo.CustomerVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liudisi
 * 统计分析Controller
 */
@Controller
@RequestMapping("stat")
public class StatController {

    @Autowired
    private StatService statService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private RentService rentService;

    /**
     * 跳转到客户地区统计分析页面
     *
     * @return
     */
    @RequestMapping("toCusAddressStat")
    public String toCusAddressStat() {
        return "stat/cusAddressStat";
    }

    /**
     * 加载客户地区数据
     *
     * @return
     */
    @RequestMapping("loadCusAddressStatJson")
    @ResponseBody
    public List<Stat> loadCusAddressStatJson() {
        return statService.findCusAddressStatList();
    }

    /**
     * 跳转到年度业务员销售总额统计分析页面
     *
     * @return
     */
    @RequestMapping("toOperNamePricesToYearStat")
    public String toOperNamePricesToYearStat() {
        return "stat/operNamePricesToYearStat";
    }

    /**
     * 加载年度业务员销售总额数据
     *
     * @return
     */
    @RequestMapping("loadOperNamePricesToYearStatJson")
    @ResponseBody
    public Map<String, Object> loadOperNamePricesToYearStatJson(@RequestParam("year") String year) {
        List<Stat> stats = statService.findOperNamePricesToYearStatData(year);
        List<String> names = new ArrayList<>();
        List<Double> values = new ArrayList<>();
        for (Stat stat : stats) {
            names.add(stat.getName());
            values.add(stat.getValue());
        }
        Map<String, Object> map = new HashMap<>();
        map.put("name", names);
        map.put("value", values);
        return map;
    }

    /**
     * 跳转到公司年度月份销售总额统计分析页面
     *
     * @return
     */
    @RequestMapping("toCompanyPricesToYearMonthStat")
    public String toCompanyPricesToYearMonthStat() {
        return "stat/companyPricesToYearMonthStat";
    }

    /**
     * 加载公司年度月份销售总额数据
     *
     * @param year
     * @return
     */
    @RequestMapping("loadCompanyPricesToYearMonthStatJson")
    @ResponseBody
    public List<Double> loadCompanyPricesToYearMonthStatJson(@RequestParam("year") String year) {
        return statService.findCompanyPricesToYearMonthStatData(year);
    }

    /**
     * 导出客户信息
     *
     * @param customerVo
     * @return
     */
    @RequestMapping("exportCustomer")
    public ResponseEntity<Object> exportCustomer(CustomerVo customerVo) {
        List<Customer> customers = customerService.findCustomerForList(customerVo);
        String fileName = "客户数据.xls";
        String sheetName = "客户数据";
        String titleName = "客户数据列表";
        ByteArrayOutputStream bos = ExportCustomerDataUtils.exportCustomerData(customers, sheetName, titleName);
        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");//处理中文文件名乱码问题
            //2.1创建封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //2.2封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //2.3设置下载文件的名称
            headers.setContentDispositionFormData("attachment", fileName);
            return new ResponseEntity<Object>(bos.toByteArray(), headers, HttpStatus.CREATED);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据出租单号导出出租单信息
     * @param rentId
     * @return
     */
    @RequestMapping("exportRent")
    public ResponseEntity<Object> exportRent(@RequestParam("rentId") String rentId){
        Rent rent = rentService.findRentByRentId(rentId);
        Customer customer = customerService.checkCustomerIsExist(rent.getIdentity());
        String fileName = customer.getCustName()+"-出租单信息.xls";
        String sheetName = customer.getCustName()+"的出租单";
        String titleName = customer.getCustName()+"的出租单信息";
        ByteArrayOutputStream bos = ExportRentDataUtils.exportRentData(rent,customer,sheetName,titleName);

        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");//处理中文文件名乱码问题
            //2.1创建封装响应头信息的对象
            HttpHeaders headers = new HttpHeaders();
            //2.2封装响应内容类型(APPLICATION_OCTET_STREAM 响应的内容不限定)
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //2.3设置下载文件的名称
            headers.setContentDispositionFormData("attachment",fileName);
            return new ResponseEntity<>(bos.toByteArray(),headers,HttpStatus.CREATED);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
