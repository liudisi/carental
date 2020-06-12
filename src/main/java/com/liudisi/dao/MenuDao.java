package com.liudisi.dao;

import com.liudisi.domain.Menu;
import com.liudisi.vo.MenuVo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author liudisi
 * 菜单管理Dao
 */
@Repository
public interface MenuDao {
    String SYS_MENU_COLUMN = "id,pid,title,href,spread,target,icon,available";
    /**
     * 初始化菜单数据
     * @param menu
     * @return
     */
    @Insert("insert into sys_menu values(#{id},#{pid},#{title},#{href},#{spread},#{target},#{icon},#{available})")
    void addMenu(Menu menu);

    /**
     * 查询所有菜单
     * @return
     */
    @Select({
            "<script>",
            "select",
            SYS_MENU_COLUMN,
            "from sys_menu",
            "<where>",
            "<if test=\"title != null and title != ''\"> and title like concat('%',#{title},'%') </if>",
            "<if test=\"available != null\"> and available = #{available} </if>",
            "<if test=\"id != null\"> and (id = #{id} or pid = #{id}) </if>",
            "</where>",
            "</script>"
    })
    List<Menu> findAll(Menu menu);

    /**
     * 根据id修改菜单信息
     * @param menu
     * @return
     */
    @Update({
            "<script>",
            "update sys_menu",
            "set pid=#{pid},title=#{title},href=#{href},spread=#{spread},target=#{target},icon=#{icon},available=#{available}",
            "where id=#{id}",
            "</script>"
    })
    void updateMenuById(Menu menu);

    /**
     * 根据id删除菜单
     * @param id
     */
    @Delete({
            "<script>",
            "delete from sys_menu",
            "where id = #{id}",
            "</script>"
    })
    void deleteMenuById(@Param("id") Integer id);

    /**
     * 根据pid获取子菜单总数
     * @param pid
     * @return
     */
    @Select({
            "<script>",
            "select count(0)",
            "from sys_menu",
            "<where>",
            "<if test=\"pid != null\"> and pid = #{pid} </if>",
            "</where>",
            "</script>"
    })
    Integer countChildrenMenuByPid(@Param("pid") Integer pid);

    /**
     * 根据菜单id删除sys_role_menu表中关联信息
     * @param mid
     */
    @Delete({
            "delete from sys_role_menu where mid =#{mid}"
    })
    void deleteRoleMenuByMid(@Param("mid") Integer mid);

    /**
     * 根据用户id获取菜单信息
     * @param available
     * @param userId
     * @return
     */
    @Select({
            "<script>",
            "select distinct",
            SYS_MENU_COLUMN,
            "from sys_menu sm",
            "left join sys_role_menu srm on sm.id=srm.mid",
            "left join sys_role_user sru on sru.rid=srm.rid",
            "where",
            "sru.uid=#{userId} and sm.available=#{available}",
            "</script>"
    })
    List<Menu> findMenuByUserId(@Param("available") Integer available, @Param("userId") Integer userId);
}
