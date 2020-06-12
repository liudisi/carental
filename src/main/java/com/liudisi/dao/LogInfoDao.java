package com.liudisi.dao;

import com.liudisi.domain.LogInfo;
import com.liudisi.vo.LogInfoVo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 日志信息Dao
 */
@Repository
public interface LogInfoDao {

    /**
     * 查看日志
     * @param logInfo
     * @return
     */
    @Select({
            "<script>",
            "select id,loginName,loginIp,loginTime",
            "from sys_log_login",
            "<where>",
            "<if test=\"loginName != null and loginName !=''\"> and loginName like concat('%',#{loginName},'%') </if>",
            "<if test=\"loginIp != null and loginIp !=''\"> and loginIp like concat('%',#{loginIp},'%') </if>",
            "<if test=\"startTime !=null\"> and loginTime <![CDATA[>=]]> #{startTime} </if>",
            "<if test=\"endTime !=null\"> and loginTime <![CDATA[>=]]> #{endTime} </if>",
            "</where>",
            "order by loginTime desc",
            "</script>"
    })
    List<LogInfo> findAllLogInfo(LogInfo logInfo);

    /**
     * 根据id删除日志信息
     * @param id
     */
    @Delete({
            "<script>",
            "delete from sys_log_login where id = #{id}",
            "</script>"
    })
    void deleteLogInfoById(@Param("id") Integer id);

    /**
     * 批量删除日志信息
     * @param ids
     */
    @Delete({
            "<script>",
            "delete from sys_log_login",
            "where id in",
            "<foreach collection=\"ids\" item=\"item\" open=\"(\" separator=\",\" close=\")\">",
            "#{item}",
            "</foreach>",
            "</script>"
    })
    void batchDeleteLogInfoByIds(@Param("ids")Integer[] ids);

    /**
     * 添加日志
     * @param logInfo
     */
    @Insert({
            "<script>",
            "insert into sys_log_login(loginName,loginIp,loginTime) values(#{loginName},#{loginIp},#{loginTime})",
            "</script>"
    })
    void addLogInfo(LogInfo logInfo);
}
