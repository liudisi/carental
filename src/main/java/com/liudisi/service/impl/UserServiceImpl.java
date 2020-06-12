package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.constast.SystemConstast;
import com.liudisi.dao.RoleDao;
import com.liudisi.dao.UserDao;
import com.liudisi.domain.Role;
import com.liudisi.domain.User;
import com.liudisi.service.UserService;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author liudisi
 * 用户Dao
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public User login(UserVo userVo) {
        String pwd = DigestUtils.md5DigestAsHex(userVo.getPwd().getBytes());
        userVo.setPwd(pwd);
        return userDao.login(userVo);
    }

    @Override
    public ResultObject findAllUser(UserVo userVo) {
        Page<Object> pages = PageHelper.startPage(userVo.getPage(), userVo.getLimit());
        List<User> allUser = userDao.findAllUser(userVo);
        return new ResultObject(pages.getTotal(), allUser);
    }

    @Override
    public void addUser(UserVo userVo) {
        //设置默认密码
        userVo.setPwd(DigestUtils.md5DigestAsHex(SystemConstast.USER_DEFAULT_PWD.getBytes()));
        //设置用户类型都是普通用户type=2
        userVo.setType(SystemConstast.USER_TYPE_NORMAL);
        userDao.addUser(userVo);
    }

    @Override
    public void updateUser(UserVo userVo) {
        userDao.updateUser(userVo);
    }

    @Override
    public void deleteUserByUserId(Integer userId) {
        userDao.deleteUserByUserId(userId);
        userDao.deleteRoleUserByUserId(userId);
    }

    @Override
    public void batchDeleteUser(Integer[] userIds) {
        userDao.batchDeleteUser(userIds);
        userDao.batchDeleteRoleUser(userIds);
    }

    @Override
    public void changePwd(Integer userId) {
        User user = new User();
        //重置密码
        user.setPwd(DigestUtils.md5DigestAsHex(SystemConstast.USER_DEFAULT_PWD.getBytes()));
        user.setUserId(userId);
        userDao.changeUserPwd(user);
    }

    @Override
    public ResultObject initRoleUserTable(Integer userId) {
        Role role = new Role();
        role.setAvailable(SystemConstast.AVAILABLE_TRUE);
        //查询所有可用角色
        List<Role> allRole = roleDao.findAllRole(role);
        //查询当前用户已有所有可用的角色
        List<Role> roleList = userDao.findRoleByUserId(SystemConstast.AVAILABLE_TRUE, userId);
        List<Map<String, Object>> data = new ArrayList<>();
        //判断当前用户可用的角色在所有角色中是否存在，存在就选中
        for (Role role1 : allRole) {
            Boolean LAY_CHECKED = false;
            for (Role role2 : roleList) {
                if (role1.getRoleId().equals(role2.getRoleId())) {
                    LAY_CHECKED = true;
                    break;
                }
            }
            //数据格式封装
            Map<String, Object> map = new HashMap<>();
            map.put("roleId", role1.getRoleId());
            map.put("roleName", role1.getRoleName());
            map.put("roleDesc", role1.getRoleDesc());
            map.put("LAY_CHECKED", LAY_CHECKED);
            data.add(map);
        }
        return new ResultObject(data);
    }

    @Override
    public void addRoleUser(Integer userId, Integer[] rids) {
        //如果存在先删除sys_role_user表信息，防止主键重复，添加不上
        userDao.deleteRoleUserByUserId(userId);
        if (rids != null && rids.length > 0) {
            for (Integer rid : rids) {
                //保存角色和用户的关联信息
                userDao.addRoleUser(userId, rid);
            }
        }
    }
}
