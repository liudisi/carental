package com.liudisi.service;

import com.liudisi.domain.Menu;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.MenuVo;

import java.util.List;

/**
 * @author liudisi
 * 菜单管理Service
 */
public interface MenuService {
    /**
     *查询所有菜单返回
     * @param menuVo
     * @return
     */
    List<Menu> findAll (MenuVo menuVo);

    /**
     * 根据用户id查询用户可用菜单
     * @param menuVo
     * @param userId
     * @return
     */
    List<Menu> findMenuByUserId(MenuVo menuVo,Integer userId);

    /**
     * 查询所有菜单
     * @param menuVo
     * @return
     */
    ResultObject findAllMenu(MenuVo menuVo);

    /**
     * 添加菜单
     * @param menuVo
     * @return
     */
    void addMenu(MenuVo menuVo);

    /**
     * 修改菜单
     * @param menuVo
     * @return
     */
    void updateMenu(MenuVo menuVo);

    /**
     * 根据id删除菜单
     * @param id
     */
    void deleteMenu(Integer id);

    /**
     * 根据pid获取子菜单数量
     * @param pid
     * @return
     */
    Integer countChildrenMenuByPid(Integer pid);
}
