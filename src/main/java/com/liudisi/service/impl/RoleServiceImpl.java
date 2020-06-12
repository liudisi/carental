package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.constast.SystemConstast;
import com.liudisi.dao.MenuDao;
import com.liudisi.dao.RoleDao;
import com.liudisi.domain.Menu;
import com.liudisi.domain.Role;
import com.liudisi.service.RoleService;
import com.liudisi.utils.ResultObject;
import com.liudisi.utils.TreeNode;
import com.liudisi.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudisi
 * 角色管理实现类
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    @Autowired
    private MenuDao menuDao;

    @Override
    public ResultObject findAllRole(RoleVo roleVo) {
        Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getLimit());
        List<Role> roles = roleDao.findAllRole(roleVo);
        return new ResultObject(page.getTotal(), roles);
    }

    @Override
    public void addRole(RoleVo roleVo) {
        roleDao.addRole(roleVo);
    }

    @Override
    public void updateRole(RoleVo roleVo) {
        roleDao.updateRole(roleVo);
    }

    @Override
    public void deleteRoleByRid(Integer rid) {
        roleDao.deleteRoleByRid(rid);
        roleDao.deleteRoleMenuByRid(rid);
        roleDao.deleteRoleUserByRid(rid);
    }

    @Override
    public void batchDelete(Integer[] rids) {
        roleDao.batchDeleteRoleByRids(rids);
        roleDao.batchDeleteRoleMenuByRids(rids);
        roleDao.batchDeleteRoleUserByRids(rids);
    }

    @Override
    public ResultObject initRoleMenuTreeJson(Integer roleId) {
        //查询所有可用的菜单
        Menu menu = new Menu();
        menu.setAvailable(SystemConstast.AVAILABLE_TRUE);
        List<Menu> all = menuDao.findAll(menu);
        //根据角色Id查询当前角色所拥有的可用菜单
        List<Menu> roleMenu = roleDao.findMenuByRoleId(SystemConstast.AVAILABLE_TRUE, roleId);
        List<TreeNode> treeNodes = new ArrayList<>();
        //在所有菜单中包含角色拥有菜单复选树设置为选中状态
        for (Menu menu1 : all) {
            String checkArr = SystemConstast.CHECKED_FALSE;
            for (Menu menu2 : roleMenu) {
                if (menu1.getId().equals(menu2.getId())) {
                    checkArr = SystemConstast.CHECKED_TRUE;
                    break;
                }
            }
            boolean spread = menu1.getSpread() == SystemConstast.SPREAD_TRUE ? true : false;
            treeNodes.add(new TreeNode(menu1.getId(), menu1.getPid(), menu1.getTitle(), spread, checkArr));
        }
        return new ResultObject(treeNodes);
    }

    @Override
    public void addRoleMenu(Integer rid, Integer[] mids) {
        //根据rid删除sys_role_menu表信息
        roleDao.deleteRoleMenuByRid(rid);
        if (mids != null && mids.length > 0) {
            for (Integer mid : mids) {
                //保存角色和菜单关联信息
                roleDao.addRoleMenu(rid, mid);
            }
        }
    }
}
