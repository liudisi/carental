package com.liudisi.controller;

import com.liudisi.service.UserService;
import com.liudisi.utils.Result;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author liudisi
 * 用户管理Controller
 */
@RestController
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 查询所有用户信息
     *
     * @param userVo
     * @return
     */
    @RequestMapping("findAllUser")
    public ResultObject findAllUser(UserVo userVo) {
        return userService.findAllUser(userVo);
    }

    /**
     * 添加用户信息
     *
     * @param userVo
     * @return
     */
    @RequestMapping("addUser")
    public Result addUser(UserVo userVo) {
        try {
            userService.addUser(userVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改用户信息
     *
     * @param userVo
     * @return
     */
    @RequestMapping("updateUser")
    public Result updateUser(UserVo userVo) {
        try {
            userService.updateUser(userVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据用户id删除用户信息
     *
     * @param userId
     * @return
     */
    @RequestMapping("deleteUserByUserId")
    public Result deleteUserByUserId(@RequestParam("userId") Integer userId) {
        try {
            userService.deleteUserByUserId(userId);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 批量删除用户信息
     *
     * @param userIds
     * @return
     */
    @RequestMapping("batchDeleteUser")
    public Result batchDeleteUser(@RequestParam("userId") Integer[] userIds) {
        try {
            userService.batchDeleteUser(userIds);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 重置密码
     *
     * @param userId
     * @return
     */
    @RequestMapping("changePwd")
    public Result changePwd(Integer userId) {
        try {
            userService.changePwd(userId);
            return Result.RESET_SUCCESS;
        } catch (Exception e) {
            return Result.RESET_ERROR;
        }
    }

    /**
     * 初始化分配角色列表
     *
     * @param userId
     * @return
     */
    @RequestMapping("initRoleUserTable")
    public ResultObject initRoleUserTable(@RequestParam("userId") Integer userId) {
        return userService.initRoleUserTable(userId);
    }

    /**
     * 分配角色保存sys_role_user表信息
     *
     * @param userId
     * @param rids
     * @return
     */
    @RequestMapping("addRoleUser")
    public Result addRoleUser(@RequestParam("userId") Integer userId, @RequestParam("rid") Integer[] rids) {
        try {
            userService.addRoleUser(userId, rids);
            return Result.DISPATCH_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DISPATCH_ERROR;
        }
    }
}
