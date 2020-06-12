package com.liudisi.dao;

import com.liudisi.domain.Role;
import com.liudisi.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 用户Dao
 */
@Repository
public interface UserDao {
    String SYS_USER_COLUMN = "userId,loginName,identity,realName,sex,address,phone,pwd,position,type,available";

    /**
     * 用户登录
     */
    @Select({
            "select",
            SYS_USER_COLUMN,
            "from sys_user",
            "where loginName=#{loginName} and pwd=#{pwd}"
    })
    User login(User user);

    /**
     * 查询所有用户信息
     *
     * @param user
     * @return
     */
    @Select({
            "<script>",
            "select",
            SYS_USER_COLUMN,
            "from sys_user",
            "<where>",
            "<if test=\"loginName != null and loginName !=''\"> and loginName like concat('%',#{loginName},'%') </if>",
            "<if test=\"realName != null and realName !=''\"> and realName like concat('%',#{realName},'%') </if>",
            "<if test=\"position != null and position !=''\"> and position like concat('%',#{position},'%') </if>",
            "<if test=\"address != null and address !=''\"> and address like concat('%',#{address},'%') </if>",
            "<if test=\"identity != null and identity !=''\"> and identity=#{identity} </if>",
            "<if test=\"phone != null and phone !=''\"> and phone=#{phone} </if>",
            "<if test=\"sex != null\"> and sex=#{sex} </if>",
            "and type != 1",
            "</where>",
            "</script>"
    })
    List<User> findAllUser(User user);

    /**
     * 添加用户信息
     * @param user
     */
    @Insert({
            "insert into sys_user(loginName,realName,identity,sex,address,phone,pwd,position,type,available)",
            "values(#{loginName},#{realName},#{identity},#{sex},#{address},#{phone},#{pwd},#{position},#{type},#{available})"
    })
    void addUser(User user);

    /**
     * 修改用户信息
     * @param user
     */
    @Update({
            "<script>",
            "update sys_user",
            "set loginName=#{loginName},realName=#{realName},identity=#{identity},address=#{address},phone=#{phone},position=#{position},sex=#{sex},available=#{available}",
            "where",
            "userId=#{userId}",
            "</script>"
    })
    void updateUser(User user);

    /**
     * 根据用户id删除用户信息
     * @param userId
     */
    @Delete({
            "delete from sys_user where userId=#{userId}"
    })
    void deleteUserByUserId(@Param("userId")Integer userId);

    /**
     * 根据用户id删除sys_role_user表信息
     * @param userId
     */
    @Delete({
            "delete from sys_role_user where uid=#{userId}"
    })
    void deleteRoleUserByUserId(@Param("userId")Integer userId);

    /**
     * 批量删除用户信息
     * @param userIds
     */
    @Delete({
            "<script>",
            "delete from sys_user",
            "where userId in",
            "<foreach collection=\"userIds\" item=\"item\" open=\"(\" separator=\",\" close=\")\"> #{item} </foreach>",
            "</script>"
    })
    void batchDeleteUser(@Param("userIds") Integer[] userIds);

    /**
     * 批量删除角色和用户的关联表
     * @param userIds
     */
    @Delete({
            "<script>",
            "delete from sys_role_user",
            "where uid in",
            "<foreach collection=\"userIds\" item=\"item\" open=\"(\" separator=\",\" close=\")\"> #{item} </foreach>",
            "</script>"
    })
    void batchDeleteRoleUser(@Param("userIds") Integer[] userIds);

    /**
     * 重置用户密码
     * @param user
     */
    @Update({
            "<script>",
            "update sys_user",
            "set pwd=#{pwd}",
            "where",
            "userId=#{userId}",
            "</script>"
    })
    void changeUserPwd(User user);

    /**
     * 根据用户id查询当前用户可用的角色信息
     * @param available
     * @param userId
     * @return
     */
    @Select({
            "<script>",
            "select * from sys_role sr inner join sys_role_user sru on sr.roleId = sru.rid",
            "where sr.available=#{available} and sru.uid=#{userId}",
            "</script>"
    })
    List<Role> findRoleByUserId(@Param("available") Integer available, @Param("userId") Integer userId);

    /**
     * 保存sys_role_user表信心
     * @param userId
     * @param rid
     */
    @Insert({
            "insert into sys_role_user(uid,rid) values(#{userId},#{rid})"
    })
    void addRoleUser(@Param("userId")Integer userId,@Param("rid")Integer rid);
}
