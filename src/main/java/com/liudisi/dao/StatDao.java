package com.liudisi.dao;

import com.liudisi.domain.Stat;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 统计分析Dao
 */
@Repository
public interface StatDao {

    /**
     * 查询客户地区统计的数据
     * @return
     */
    @Select({
            "<script>",
            "select address as name,count(1) as value",
            "from bus_customer",
            "group by address",
            "</script>"
    })
    List<Stat> findCusAddressStatData();

    /**
     * 查询年度业务员销售总额的数据
     * @return
     */
    @Select({
            "<script>",
            "select operName as name,sum(price) as value",
            "from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y\")=#{year}",
            "group by operName",
            "</script>"
    })
    List<Stat> findOperNamePricesToYearStatData(@Param("year") String year);

    /**
     * 查询公司年度月份销售总额的数据
     * @param year
     * @return
     */
    @Select({
            "<script>",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'01')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'02')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'03')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'04')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'05')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'06')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'07')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'08')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'09')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'10')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'11')",
            "UNION all",
            "select sum(price) as value from bus_rent",
            "where DATE_FORMAT(createTime,\"%Y%m\")= concat(#{year},'12')",
            "</script>"
    })
    List<Double> findCompanyPricesToYearMonthStatData(@Param("year") String year);
}
