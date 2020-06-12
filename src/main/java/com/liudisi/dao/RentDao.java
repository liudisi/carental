package com.liudisi.dao;

import com.liudisi.domain.Rent;
import com.liudisi.vo.RentVo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 出租单管理的Dao
 */
@Repository
public interface RentDao {

    String BUS_RENT_COLUMN = "rentId,price,beginDate,returnDate,rentFlag,identity,carNumber,operName,createTime";

    /**
     * 添加出租单信息
     *
     * @param rent
     */
    @Insert({
            "<script>",
            "insert into bus_rent values(#{rentId},#{price},#{beginDate},#{returnDate}," +
                    "#{rentFlag},#{identity},#{carNumber},#{operName},#{createTime})",
            "</script>"
    })
    void addRent(Rent rent);

    /**
     * 查询所有出租单信息
     *
     * @param rent
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_RENT_COLUMN,
            "from bus_rent",
            "<where>",
            "<if test=\"rentId != null and rentId != ''\"> and rentId like concat('%',#{rentId},'%') </if>",
            "<if test=\"identity != null and identity != ''\"> and identity like concat('%',#{identity},'%') </if>",
            "<if test=\"carNumber != null and carNumber != ''\"> and carNumber like concat('%',#{carNumber},'%') </if>",
            "<if test=\"rentFlag != null\"> and rentFlag=#{rentFlag} </if>",
            "<if test=\"startTime != null\"> and createTime <![CDATA[>=]]> #{startTime} </if>",
            "<if test=\"endTime != null\"> and createTime <![CDATA[<=]]> #{endTime} </if>",
            "</where>",
            "order by createTime desc",
            "</script>"
    })
    List<Rent> findAllRent(Rent rent);

    /**
     * 根据出租单号删除出租单信息
     *
     * @param rentId
     */
    @Delete({
            "<script>",
            "delete from bus_rent where rentId =#{rentId}",
            "</script>"
    })
    void deleteRentByRentId(@Param("rentId") String rentId);

    /**
     * 修改出租单信息
     *
     * @param rent
     */
    @Update({
            "<script>",
            "update bus_rent",
            "<set>",
            "<if test=\"price != null\"> price=#{price},</if>",
            "<if test=\"beginDate != null\"> beginDate=#{beginDate},</if>",
            "<if test=\"returnDate != null\"> returnDate=#{returnDate},</if>",
            "<if test=\"rentFlag != null\"> rentFlag=#{rentFlag},</if>",
            "<if test=\"identity != null and identity != ''\"> identity=#{identity},</if>",
            "<if test=\"carNumber != null and carNumber != ''\"> carNumber=#{carNumber},</if>",
            "<if test=\"operName != null and operName != ''\"> operName=#{operName} </if>",
            "</set>",
            "where rentId=#{rentId}",
            "</script>"
    })
    void updateRent(Rent rent);

    /**
     * 根据出租单号查询出租单信息
     *
     * @param rentId
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_RENT_COLUMN,
            "from bus_rent",
            "where rentId = #{rentId}",
            "</script>"
    })
    Rent findRentByRentId(@Param("rentId") String rentId);
}
