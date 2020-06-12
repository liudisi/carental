package com.liudisi.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.liudisi.dao.MenuDao;
import com.liudisi.domain.Menu;
import com.liudisi.service.MenuService;
import com.liudisi.utils.ResultObject;
import com.liudisi.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liudisi
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    public List<Menu> findAll(MenuVo menuVo) {
        return menuDao.findAll(menuVo);
    }

    @Override
    public List<Menu> findMenuByUserId(MenuVo menuVo, Integer userId) {
        return menuDao.findMenuByUserId(menuVo.getAvailable(),userId);
    }

    @Override
    public ResultObject findAllMenu(MenuVo menuVo) {
        Page<Object> page = PageHelper.startPage(menuVo.getPage(), menuVo.getLimit());
        List<Menu> menus = menuDao.findAll(menuVo);
        return new ResultObject(page.getTotal(),menus);
    }

    @Override
    public void addMenu(MenuVo menuVo) {
         menuDao.addMenu(menuVo);
    }

    @Override
    public void updateMenu(MenuVo menuVo) {
        menuDao.updateMenuById(menuVo);
    }

    @Override
    public void deleteMenu(Integer id) {
        menuDao.deleteMenuById(id);
        menuDao.deleteRoleMenuByMid(id);
    }

    @Override
    public Integer countChildrenMenuByPid(Integer pid) {
        return menuDao.countChildrenMenuByPid(pid);
    }
}

