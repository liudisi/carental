package com.liudisi.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author liudisi
 * 角色实现类
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Role implements Serializable {

    /**
     * 角色id
     */
    private Integer roleId;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色备注
     */
    private String roleDesc;

    /**
     * 是否可用 1：可用，0：不可用
     */
    private Integer available;

}
