package com.liudisi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author liudisi
 * 菜单实体类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Menu implements Serializable {
    /**
     * 菜单id
     */
    private Integer id;

    /**
     * 父节点id
     */
    private Integer pid;

    /**
     * 标题
     */
    private String title;

    /**
     * 页面地址
     */
    private String href;

    /**
     * 是否展开 0：不展开，1：展开
     */
    private Integer spread;

    private String target;

    /**
     * 图标
     */
    private String icon;

    /**
     * 是否可用 0：不可用，1：可用
     */
    private Integer available;



}
