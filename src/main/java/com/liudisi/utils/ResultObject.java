package com.liudisi.utils;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author liudisi
 * Layui数据格式
 */
@Data
@NoArgsConstructor
public class ResultObject {
    private Integer code =0;
    private String msg = "";
    private Long count;
    private Object data;

    public ResultObject(Object data) {
        this.data = data;
    }

    public ResultObject(Long count, Object data) {
        this.count = count;
        this.data = data;
    }
}
