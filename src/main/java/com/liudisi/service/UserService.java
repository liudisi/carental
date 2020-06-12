package com.liudisi.service;

import com.liudisi.domain.User;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.UserVo;

/**
 * @author liudisi
 * 用户Service
 */
public interface UserService {
    /**
     * 用户登录
     *
     * @param userVo
     * @return
     */
    User login(UserVo userVo);

    /**
     * 查询所有用户信息
     *
     * @param userVo
     * @return
     */
    ResultObject findAllUser(UserVo userVo);

    /**
     * 添加用户信息
     *
     * @param userVo
     * @return
     */
    void addUser(UserVo userVo);

    /**
     * 修改用户信息
     *
     * @param userVo
     */
    void updateUser(UserVo userVo);

    /**
     * 根据用户id删除用户信息
     *
     * @param userId
     */
    void deleteUserByUserId(Integer userId);

    /**
     * 批量删除用户信息
     *
     * @param userIds
     */
    void batchDeleteUser(Integer userIds[]);

    /**
     * 重置密码
     *
     * @param userId
     */
    void changePwd(Integer userId);

    /**
     * 初始化分配角色列表
     *
     * @param userId
     * @return
     */
    ResultObject initRoleUserTable(Integer userId);

    /**
     * 分配角色保存sys_role_user表信息
     *
     * @param userId
     * @param rids
     */
    void addRoleUser(Integer userId, Integer[] rids);
}
