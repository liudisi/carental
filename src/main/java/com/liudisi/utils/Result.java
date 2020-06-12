package com.liudisi.utils;

import com.liudisi.constast.SystemConstast;
import lombok.Data;

/**
 * @author liudisi
 */
@Data
public class Result {
    private Integer code;
    private String msg;

    //添加成功
    public static final Result ADD_SUCCESS = new Result(SystemConstast.CODE_SUCCESS, SystemConstast.ADD_SUCCESS);
    //添加失败
    public static final Result ADD_ERROR = new Result(SystemConstast.CODE_ERROR, SystemConstast.ADD_ERROR);
    //更新成功
    public static final Result UPDATE_SUCCESS = new Result(SystemConstast.CODE_SUCCESS, SystemConstast.UPDATE_SUCCESS);
    //更新失败
    public static final Result UPDATE_ERROR = new Result(SystemConstast.CODE_ERROR, SystemConstast.UPDATE_ERROR);
    //删除成功
    public static final Result DELETE_SUCCESS = new Result(SystemConstast.CODE_SUCCESS, SystemConstast.DELETE_SUCCESS);
    //删除失败
    public static final Result DELETE_ERROR = new Result(SystemConstast.CODE_ERROR, SystemConstast.DELETE_ERROR);
    //重置成功
    public static final Result RESET_SUCCESS = new Result(SystemConstast.CODE_SUCCESS, SystemConstast.RESET_SUCCESS);
    //重置失败
    public static final Result RESET_ERROR = new Result(SystemConstast.CODE_ERROR, SystemConstast.RESET_ERROR);
    //分发成功
    public static final Result DISPATCH_SUCCESS = new Result(SystemConstast.CODE_SUCCESS, SystemConstast.DISPATCH_SUCCESS);
    //分发失败
    public static final Result DISPATCH_ERROR = new Result(SystemConstast.CODE_ERROR, SystemConstast.DISPATCH_ERROR);
    //导出成功
    public static final Result EXPORT_SUCCESS = new Result(SystemConstast.CODE_SUCCESS,SystemConstast.EXPORT_SUCCESS);
    //导出失败
    public static final Result EXPORT_ERROR = new Result(SystemConstast.CODE_ERROR,SystemConstast.EXPORT_ERROR);
    //状态码0
    public static final Result STATUSCODE_TRUE = new Result(SystemConstast.CODE_SUCCESS);
    //状态码1
    public static final Result STATUSCODE_FALSE = new Result(SystemConstast.CODE_ERROR);
    private Result(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private Result(Integer code) {
        this.code = code;
    }
}
