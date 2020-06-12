package com.liudisi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author liudisi
 * 负责系统页面跳转Controller
 */
@Controller
@RequestMapping("sys")
public class SysController {
    /**
     * 跳转到工作台
     *
     * @return
     */
    @RequestMapping("toDeskManager")
    public String toDeskManager() {
        return "system/main/deskManager";
    }

    /**
     * 跳转到菜单管理
     *
     * @return
     */
    @RequestMapping("toMenuManager")
    public String toMenuManager() {
        return "system/menu/menuManager";
    }

    /**
     * 跳转到菜单管理的左边菜单树
     *
     * @return
     */
    @RequestMapping("toMenuLeftTree")
    public String toMenuLeftTree() {
        return "system/menu/menuLeftTree";
    }

    /**
     * 跳转到菜单管理的右边菜单列表
     *
     * @return
     */
    @RequestMapping("toMenuRightList")
    public String toMenuRightList() {
        return "system/menu/menuRightList";
    }

    /**
     * 跳转到角色管理
     *
     * @return
     */
    @RequestMapping("toRoleManager")
    public String toRoleManager() {
        return "system/role/roleManager";
    }

    /**
     * 跳转到用户管理
     *
     * @return
     */
    @RequestMapping("toUserManager")
    public String toUserManager() {
        return "system/user/userManager";
    }

    /**
     * 跳转到日志管理
     *
     * @return
     */
    @RequestMapping("toLogManager")
    public String toLogManager() {
        return "system/log/logManager";
    }

    /**
     * 跳转到公告管理
     *
     * @return
     */
    @RequestMapping("toNewsManager")
    public String toNewsManager() {
        return "system/news/newsManager";
    }
}
