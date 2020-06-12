package com.liudisi.utils;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

/**
 * @author liudisi
 */
@Data
@NoArgsConstructor
public class TreeNode {
    private Integer id;
    @JsonProperty("parentId")
    private Integer pid;
    private String title;
    private String href;
    private Boolean spread;
    private String target;
    private String icon;
    private Integer available;
    private List<TreeNode> children = new ArrayList<>();

    //角色管理分配菜单下的复选树的必要属性
    private String checkArr = "";

    /**
     * dtree的复选树使用
     * @param id
     * @param pid
     * @param title
     * @param spread
     * @param checkArr
     */
    public TreeNode(Integer id, Integer pid, String title, Boolean spread, String checkArr) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.spread = spread;
        this.checkArr = checkArr;
    }

    /**
     * 首页左边导航栏的构造器
     *
     * @param id
     * @param pid
     * @param title
     * @param href
     * @param spread
     * @param target
     * @param icon
     */
    public TreeNode(Integer id, Integer pid, String title, String href, Boolean spread, String target, String icon,Integer available) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.href = href;
        this.spread = spread;
        this.target = target;
        this.icon = icon;
        this.available = available;
    }

}
