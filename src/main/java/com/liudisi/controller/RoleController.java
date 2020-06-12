package com.liudisi.controller;

import com.liudisi.service.RoleService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * @author liudisi
 * 角色管理Controller
 */
@RestController
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    /**
     * 查询所有角色信息
     *
     * @param roleVo
     * @return
     */
    @RequestMapping("findAllRole")
    public ResultObject findAllRole(RoleVo roleVo) {
        return roleService.findAllRole(roleVo);
    }

    /**
     * 添加角色
     *
     * @param roleVo
     * @return
     */
    @RequestMapping("addRole")
    public Result addMenu(RoleVo roleVo) {
        try {
            roleService.addRole(roleVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改角色
     *
     * @param roleVo
     * @return
     */
    @RequestMapping("updateRole")
    public Result updateMenu(RoleVo roleVo) {
        try {
            roleService.updateRole(roleVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据rid删除角色
     *
     * @param rid
     * @return
     */
    @GetMapping("deleteRoleByRid")
    public Result deleteMenu(@RequestParam Integer rid) {
        try {
            roleService.deleteRoleByRid(rid);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     *
     * @param rids
     * @return
     */
    @PostMapping("batchDelete")
    public Result batchDelete(Integer[] rids) {
        try {
            roleService.batchDelete(rids);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 加载角色管理分配菜单的Json
     *
     * @param roleId
     * @return
     */
    @RequestMapping("initRoleMenuTreeJson")
    public ResultObject initRoleMenuTreeJson(@RequestParam Integer roleId) {
        return roleService.initRoleMenuTreeJson(roleId);
    }

    /**
     * 保存sys_role_menu表信息
     *
     * @param rid
     * @param mids
     * @return
     */
    @PostMapping("addMenuRole")
    public Result addMenuRole(@RequestParam Integer rid, @RequestParam("mid") Integer[] mids) {
        try {
            roleService.addRoleMenu(rid, mids);
            return Result.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DISPATCH_ERROR;
        }
    }
}
