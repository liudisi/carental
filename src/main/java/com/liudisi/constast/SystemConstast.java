package com.liudisi.constast;

/**
 * @author liudisi
 * 常量接口
 */
public interface SystemConstast {
    String USER_LOGIN_ERROR_MSG = "用户名或密码输入错误";
    /**
     * 菜单是否可用
     */
    Integer AVAILABLE_TRUE = 1;
    Integer AVAILABLE_FALSE = 0;

    /**
     * 用户类型：超级管理员
     */
    Integer USER_TYPE_SUPER = 1;
    Integer USER_TYPE_NORMAL = 2;
    /**
     * 菜单是否展开
     */
    Integer SPREAD_TRUE = 1;
    Integer SPREAD_FALSE = 0;

    String ADD_SUCCESS = "添加成功";
    String ADD_ERROR = "添加失败";

    String UPDATE_SUCCESS = "更新成功";
    String UPDATE_ERROR = "更新失败";

    String DELETE_SUCCESS = "删除成功";
    String DELETE_ERROR = "删除失败";

    String RESET_SUCCESS = "重置成功";
    String RESET_ERROR = "重置失败";

    String DISPATCH_SUCCESS = "分配成功";
    String DISPATCH_ERROR = "分配失败";

    Integer CODE_ERROR = -1;//失败
    Integer CODE_SUCCESS = 0;//成功

    String CHECKED_TRUE = "1";//选中
    String CHECKED_FALSE = "0";//不选中
    //用户默认密码
    String USER_DEFAULT_PWD = "123456";
    String UPLOAD_FILE_TEMP = "_temp";
    /**
     * 默认图片
     */
    String DEFAULT_CAR_IMG = "images/defaultCarImg.jpg";

    /**
     * 单号前缀
     */
    String CAR_ORDER_CZ = "CZ";
    String CAR_ORDER_JC = "JC";

    /**
     * 出租单状态 0:未归还，1:已归还
     */
    Integer CAR_RENT_FLAG_FALSE = 0;
    Integer CAR_RENT_FLAG_TRUE = 1;

    /**
     * 出租状态 0:未出租，1:已出租
     */
    Integer CAR_RENT_IS_FALSE = 0;
    Integer CAR_RENT_IS_TRUE = 1;

    String EXPORT_SUCCESS = "导出成功";
    String EXPORT_ERROR="导出失败";
    Object USER_LOGIN_VERIFY_CODE_ERROR_MSG = "验证码有误，请重新输入！";
}
