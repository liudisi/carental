package com.liudisi.service;

import com.liudisi.utils.ResultObject;
import com.liudisi.vo.RoleVo;

/**
 * @author liudisi
 * 角色管理Service
 */
public interface RoleService {
    /**
     * 查询所有角色信息
     * @param roleVo
     * @return
     */
    ResultObject findAllRole(RoleVo roleVo);

    /**
     * 添加角色信息
     * @param roleVo
     * @return
     */
    void addRole(RoleVo roleVo);

    /**
     * 修改角色信息
     * @param roleVo
     * @return
     */
    void updateRole(RoleVo roleVo);

    /**
     * 根据rid删除角色
     * @param rid
     */
    void deleteRoleByRid(Integer rid);

    /**
     * 批量删除
     * @param rids
     */
    void batchDelete(Integer[] rids);

    /**
     * 加载角色管理分配菜单的复选树
     * @param roleId
     * @return
     */
    ResultObject initRoleMenuTreeJson(Integer roleId);

    /**
     * 保存sys_role_menu表信息
     * @param rid
     * @param mids
     */
    void addRoleMenu(Integer rid,Integer[] mids);
}
