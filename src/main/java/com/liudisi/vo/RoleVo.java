package com.liudisi.vo;

import com.liudisi.domain.Role;
import lombok.Data;

/**
 * @author liudisi
 * 角色实体的增强类
 * 分页参数
 */
@Data
public class RoleVo extends Role {
    //页数
    private Integer page;
    //每页条数
    private Integer limit;
}
