package com.liudisi.vo;

import com.liudisi.domain.Menu;
import lombok.Data;

/**
 * @author liudisi
 * 菜单实体的增强类
 * 分页参数
 */
@Data
public class MenuVo extends Menu {
    //页码
    private Integer page;
    //每页条数
    private Integer limit;

}
