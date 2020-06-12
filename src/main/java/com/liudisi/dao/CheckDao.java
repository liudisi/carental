package com.liudisi.dao;

import com.liudisi.domain.Check;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 检查单管理的Dao
 */
@Repository
public interface CheckDao {

    String BUS_CHECK_COLUMN = "checkId,checkDate,checkDesc,problem,payMoney,operName,rentId,createTime";

    /**
     * 添加检查单信息
     *
     * @param check
     */
    @Insert({
            "<script>",
            "insert into bus_check",
            "<trim prefix=\"(\" suffix=\")\" suffixOverrides=\",\">",
            "<if test=\"checkId != null and checkId != ''\"> checkId, </if>",
            "<if test=\"checkDate != null\"> checkDate, </if>",
            "<if test=\"checkDesc != null and checkDesc != ''\"> checkDesc, </if>",
            "<if test=\"problem != null and problem != ''\"> problem, </if>",
            "<if test=\"payMoney != null\"> payMoney, </if>",
            "<if test=\"operName != null and operName != ''\"> operName, </if>",
            "<if test=\"rentId != null and rentId != ''\"> rentId, </if>",
            "<if test=\"createTime != null\"> createTime, </if>",
            "</trim>",
            "<trim prefix=\"values(\" suffix=\")\" suffixOverrides=\",\">",
            "<if test=\"checkId != null and checkId != ''\"> #{checkId}, </if>",
            "<if test=\"checkDate != null\"> #{checkDate}, </if>",
            "<if test=\"checkDesc != null and checkDesc != ''\"> #{checkDesc}, </if>",
            "<if test=\"problem != null and problem != ''\"> #{problem}, </if>",
            "<if test=\"payMoney != null\"> #{payMoney}, </if>",
            "<if test=\"operName != null and operName != ''\"> #{operName}, </if>",
            "<if test=\"rentId != null and rentId != ''\"> #{rentId}, </if>",
            "<if test=\"createTime != null\"> #{createTime}, </if>",
            "</trim>",
            "</script>"
    })
    void addCheck(Check check);

    /**
     * 查询所有检查单信息
     *
     * @param check
     * @return
     */
    @Select({
            "<script>",
            "select",
            BUS_CHECK_COLUMN,
            "from bus_check",
            "<where>",
            "<if test=\"checkId != null and checkId != ''\"> and checkId like concat('%',#{checkId},'%') </if>",
            "<if test=\"rentId != null and rentId != ''\"> and rentId like concat('%',#{rentId},'%') </if>",
            "<if test=\"problem != null and problem != ''\"> and problem like concat('%',#{problem},'%') </if>",
            "<if test=\"checkDesc != null and checkDesc != ''\"> and checkDesc like concat('%',#{checkDesc},'%') </if>",
            "<if test=\"startTime != null \"> and checkDate <![CDATA[>=]]> #{startTime} </if>",
            "<if test=\"endTime != null \"> and checkDate <![CDATA[<=]]> #{endTime} </if>",
            "</where>",
            "order by createTime desc",
            "</script>"
    })
    List<Check> findAllCheck(Check check);

    /**
     * 修改检查单信息
     *
     * @param check
     */
    @Update({
            "<script>",
            "update bus_check",
            "<set>",
            "<if test=\"checkDate != null\"> checkDate=#{checkDate}, </if>",
            "<if test=\"checkDesc != null and checkDesc != ''\"> checkDesc=#{checkDesc}, </if>",
            "<if test=\"problem != null and problem != ''\"> problem=#{problem}, </if>",
            "<if test=\"payMoney != null\"> payMoney=#{payMoney}, </if>",
            "<if test=\"operName != null and operName != ''\"> operName=#{operName}, </if>",
            "<if test=\"rentId != null and rentId != ''\"> rentId=#{rentId} </if>",
            "</set>",
            "where checkId=#{checkId}",
            "</script>"
    })
    void updateCheck(Check check);
}
