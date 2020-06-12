package com.liudisi.dao;

import com.liudisi.domain.Menu;
import com.liudisi.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author liudisi
 * 角色管理Dao
 */
@Repository
public interface RoleDao {

    /**
     * 添加角色信息
     *
     * @param role
     */
    @Insert({
            "insert into sys_role(roleName,roleDesc,available) values(#{roleName},#{roleDesc},#{available})"
    })
    void addRole(Role role);

    /**
     * 查询所有角色信息
     *
     * @param role
     * @return
     */
    @Select({
            "<script>",
            "select roleId,roleName,roleDesc,available",
            "from sys_role",
            "<where>",
            "<if test=\"roleName != null and roleName != ''\"> and roleName like concat('%',#{roleName},'%') </if>",
            "<if test=\"roleDesc != null and roleDesc != ''\"> and roleDesc like concat('%',#{roleDesc},'%') </if>",
            "<if test=\"available != null\"> and available=#{available} </if>",
            "</where>",
            "</script>"
    })
    List<Role> findAllRole(Role role);

    /**
     * 修改角色信息
     *
     * @param role
     */
    @Update({
            "<script>",
            "update sys_role",
            "set roleName=#{roleName},roleDesc=#{roleDesc},available=#{available}",
            "where roleId=#{roleId}",
            "</script>"
    })
    void updateRole(Role role);

    /**
     * 根据rid删除sys_role表信息
     *
     * @param rid
     */
    @Delete({
            "<script>",
            "delete from sys_role",
            "where roleId =#{rid}",
            "</script>"
    })
    void deleteRoleByRid(@Param("rid") Integer rid);

    /**
     * 根据rid删除sys_role_menu表信息
     *
     * @param rid
     */
    @Delete({
            "delete from sys_role_menu where rid=#{rid}"
    })
    void deleteRoleMenuByRid(@Param("rid") Integer rid);

    /**
     * 根据rid删除sys_role_user表信息
     *
     * @param rid
     */
    @Delete({
            "delete from sys_role_user where rid=#{rid}"
    })
    void deleteRoleUserByRid(@Param("rid") Integer rid);

    /**
     * 根据rids批量删除sys_role表信息
     *
     * @param rids
     */
    @Delete({
            "<script>",
            "delete from sys_role",
            "where roleId in",
            "<foreach item=\"item\" collection=\"rids\" open=\"(\" separator=\",\" close=\")\"> #{item} </foreach>",
            "</script>"
    })
    void batchDeleteRoleByRids(@Param("rids") Integer[] rids);

    /**
     * 根据rids批量删除sys_role_menu表信息
     *
     * @param rids
     */
    @Delete({
            "<script>",
            "delete from sys_role_menu",
            "where rid in",
            "<foreach collection=\"rids\" item=\"item\" open=\"(\" separator=\",\" close=\")\"> #{item} </foreach>",
            "</script>"
    })
    void batchDeleteRoleMenuByRids(@Param("rids") Integer[] rids);

    /**
     * 根据rids批量删除sys_role_user表信息
     *
     * @param rids
     */
    @Delete({
            "<script>",
            "delete from sys_role_user",
            "where rid in",
            "<foreach collection=\"rids\" item=\"item\" open=\"(\" separator=\",\" close=\")\"> #{item} </foreach>",
            "</script>"
    })
    void batchDeleteRoleUserByRids(@Param("rids") Integer[] rids);

    /**
     * 根据角色id查询当前角色可用的菜单
     * @param available
     * @param roleId
     * @return
     */
    @Select({
            "<script>",
            "select * from sys_menu sm inner join sys_role_menu srm on sm.id=srm.mid",
            "where sm.available=#{available} and srm.rid=#{roleId}",
            "</script>"
    })
    List<Menu> findMenuByRoleId(@Param("available") Integer available, @Param("roleId") Integer roleId);

    /**
     * 保存sys_role_menu表信息
     * @param rid
     * @param mid
     */
    @Insert({
            "insert into sys_role_menu(rid,mid) values(#{rid},#{mid})"
    })
    void addRoleMenu(@Param("rid") Integer rid,@Param("mid") Integer mid);
}
