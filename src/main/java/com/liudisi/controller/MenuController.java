package com.liudisi.controller;

import com.liudisi.constast.SystemConstast;
import com.liudisi.domain.Menu;
import com.liudisi.domain.User;
import com.liudisi.service.MenuService;
import com.liudisi.utils.*;
import com.liudisi.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudisi
 * 菜单管理Controller
 */
@RestController
@RequestMapping("menu")
public class MenuController {
    @Autowired
    private MenuService menuService;

    /**
     * 加载系统首页左侧导航栏
     *
     * @return
     */
    @RequestMapping("loadLeftMenu")
    public List<TreeNode> loadLeftMenu(MenuVo menuVo) {
        //获取登录用户信息
        User user = (User) WebUtils.getHttpSession().getAttribute("user");
        menuVo.setAvailable(SystemConstast.AVAILABLE_TRUE);
        List<Menu> menus = null;
        //判断当前用户类型
        if (user.getType().equals(SystemConstast.USER_TYPE_SUPER)) {
            menus = menuService.findAll(menuVo);
        } else {
            menus = menuService.findMenuByUserId(menuVo, user.getUserId());
        }
        List<TreeNode> treeNodes = new ArrayList<>();
        //赋值
        for (Menu menu : menus) {
            Boolean spread = menu.getSpread() == SystemConstast.SPREAD_TRUE ? true : false;
            treeNodes.add(new TreeNode(menu.getId(), menu.getPid(), menu.getTitle(), menu.getHref()
                    , spread, menu.getTarget(), menu.getIcon(), menu.getAvailable()));
        }
        return TreeNodeBuilder.builder(treeNodes, 1);
    }

    /**
     * 加载菜单管理下的左侧菜单树
     *
     * @param menuVo
     * @return
     */
    @RequestMapping("loadMenuManagerLeftTreeJson")
    public ResultObject loadMenuManagerLeftTreeJson(MenuVo menuVo) {
        menuVo.setAvailable(SystemConstast.AVAILABLE_TRUE);
        List<Menu> menus = menuService.findAll(menuVo);
        List<TreeNode> treeNode = new ArrayList<>();
        for (Menu menu : menus) {
            Boolean spread = menu.getSpread() == SystemConstast.SPREAD_TRUE ? true : false;
            treeNode.add(new TreeNode(menu.getId(), menu.getPid(), menu.getTitle(), menu.getHref()
                    , spread, menu.getTarget(), menu.getIcon(), menu.getAvailable()));
        }
        return new ResultObject(treeNode);
    }

    /**
     * 加载菜单管理下右侧数据列表
     *
     * @param menuVo
     * @return
     */
    @RequestMapping("loadMenuManagerRightListJson")
    public ResultObject loadMenuManagerRightListJson(MenuVo menuVo) {
        return menuService.findAllMenu(menuVo);
    }

    /**
     * 添加菜单
     *
     * @param menuVo
     * @return
     */
    @RequestMapping("addMenu")
    public Result addMenu(MenuVo menuVo) {
        try {
            menuService.addMenu(menuVo);
            return Result.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.ADD_ERROR;
        }
    }

    /**
     * 修改菜单
     *
     * @param menuVo
     * @return
     */
    @RequestMapping("updateMenu")
    public Result updateMenu(MenuVo menuVo) {
        try {
            menuService.updateMenu(menuVo);
            return Result.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.UPDATE_ERROR;
        }
    }

    /**
     * 根据id删除菜单
     *
     * @param id
     * @return
     */
    @GetMapping("deleteMenu")
    public Result deleteMenu(@RequestParam Integer id) {
        try {
            menuService.deleteMenu(id);
            return Result.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return Result.DELETE_ERROR;
        }
    }

    /**
     * 根据pid判断当前菜单是否含有子菜单
     *
     * @param pid
     * @return
     */
    @GetMapping("checkMenuIsChildren")
    public Result checkMenuIsChildren(@RequestParam Integer pid) {
        Integer count = menuService.countChildrenMenuByPid(pid);
        if (count > 0) {
            return Result.STATUSCODE_TRUE;
        } else {
            return Result.STATUSCODE_FALSE;
        }
    }
}
