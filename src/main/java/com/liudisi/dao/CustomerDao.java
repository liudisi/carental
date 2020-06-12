package com.liudisi.dao;

import com.liudisi.domain.Customer;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 客户管理的Dao
 */
@Repository
public interface CustomerDao {

    String BUS_CUSTOMER_COLUMN = "identity,custName,sex,address,phone,career,createTime";
    /**
     * 查询所有客户信息
     * @param customer
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CUSTOMER_COLUMN,
            "from bus_customer",
            "<where>",
            "<if test=\"identity != null and identity != ''\"> and identity like concat('%',#{identity},'%') </if>",
            "<if test=\"custName != null and custName != ''\"> and custName like concat('%',#{custName},'%') </if>",
            "<if test=\"address != null and address != ''\"> and address like concat('%',#{address},'%') </if>",
            "<if test=\"phone != null and phone != ''\"> and phone like concat('%',#{phone},'%') </if>",
            "<if test=\"career != null and career != ''\"> and career like concat('%',#{career},'%') </if>",
            "<if test=\"sex != null\"> and sex=#{sex} </if>",
            "</where>",
            "order by createTime desc",
            "</script>"
    })
    List<Customer> findAllCustomer(Customer customer);

    /**
     * 添加客户
     * @param customer
     */
    @Insert({
            "<script>",
            "insert into bus_customer values(#{identity},#{custName},#{sex},#{address},#{phone},#{career},#{createTime})",
            "</script>"
    })
    void addCustomer(Customer customer);

    /**
     * 修改客户信息
     * @param customer
     */
    @Update({
            "<script>",
            "update bus_customer",
            "set custName=#{custName},sex=#{sex},address=#{address},phone=#{phone},career=#{career}",
            "where identity=#{identity}",
            "</script>"
    })
    void updateCustomer(Customer customer);

    /**
     * 根据身份证号删除客户信息
     * @param identity
     */
    @Delete({
            "<script>",
            "delete from bus_customer where identity=#{identity}",
            "</script>"
    })
    void deleteCustomerByIdentity(@Param("identity") String identity);

    /**
     * 批量删除客户信息
     * @param identity
     */
    @Delete({
            "<script>",
            "delete from bus_customer",
            "where identity in",
            "<foreach collection=\"identity\" item=\"item\" open=\"(\" separator=\",\" close=\")\">",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void batchDeleteCustomer(@Param("identity") String[] identity);

    /**
     * 根据身份证号查询客户信息
     * @param identity
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CUSTOMER_COLUMN,
            "from bus_customer",
            "where identity=#{identity}",
            "</script>"
    })
    Customer findCustomerByIdentity(String identity);
}
