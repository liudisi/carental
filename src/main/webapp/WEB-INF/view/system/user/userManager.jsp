<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="../../../../statics/layui/css/layui.css" media="all">
</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">用户姓名:</label>
            <div class="layui-input-inline">
                <input type="text" name="realName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登录姓名:</label>
            <div class="layui-input-inline">
                <input type="text" name="loginName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户职位:</label>
            <div class="layui-input-inline">
                <input type="text" name="position" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户地址:</label>
            <div class="layui-input-inline">
                <input type="text" name="address" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户电话:</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">性别:</label>
            <div class="layui-input-inline">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="button" class="layui-btn  layui-btn-sm layui-icon layui-icon-release"
                    id="doSearch" lay-submit="">查询
            </button>
            <button type="reset" class="layui-btn  layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
<div style="display: none;" id="userToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="batchDelete">批量删除</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加用户</button>
</div>
<div id="userBar" style="display: none;">
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="changeUserPwd">重置密码</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="selectUserRole">分配角色</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户姓名:</label>
                <div class="layui-input-inline">
                    <input type="hidden" name="userId">
                    <input type="text" name="realName" lay-verify="required" placeholder="请输入用户姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登陆姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginName" lay-verify="required" placeholder="请输入用户登陆姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" lay-verify="required|identity" placeholder="请输入用户身份证号"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" placeholder="请输入用户地址" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入用户电话" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户职位:</label>
                <div class="layui-input-inline">
                    <input type="text" name="position" placeholder="请输入用户职位" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="available" value="1" checked="checked" title="可用">
                    <input type="radio" name="available" value="0" title="不可用">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn  layui-btn-sm layui-icon layui-icon-release"
                        lay-filter="doSubmit" lay-submit="">保存
                </button>
                <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<!-- 用户分配角色的弹出层开始 -->
<div style="display: none;padding: 10px;" id="selectUserRole">
    <table class="layui-hide" id="userRoleTable" lay-filter="userRoleTable"></table>
</div>
<!-- 用户分配角色的弹出层结束 -->

<script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

<script>
    var tableIns;
    layui.extend({
        dtree: '../../../../statics/layui_ext/dist/dtree'
    }).use(['jquery', 'layer', 'form', 'table', 'dtree'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer
            , table = layui.table
            , dtree = layui.dtree;

        //数据列表
        tableIns = table.render({
            elem: '#userTable'
            , url: '${requestScope.contextPath}/user/findAllUser'
            , toolbar: '#userToolBar'
            , title: '用户列表'
            , height: 'full-310'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'userId', title: '用户ID', fixed: 'left', align: 'center'}
                , {field: 'realName', title: '用户姓名', align: 'center'}
                , {field: 'loginName', title: '登录姓名', align: 'center'}
                , {field: 'identity', title: '身份证号', align: 'center'}
                , {field: 'address', title: '用户地址', align: 'center'}
                , {field: 'phone', title: '用户电话', align: 'center'}
                , {field: 'position', title: '用户职位', align: 'center'}
                , {
                    field: 'sex', title: '性别', align: 'center', templet: function (res) {
                        return res.sex == '1' ? '<font color=blue>男</font>' : '<font color=green>女</font>';
                    }
                }
                , {
                    field: 'pwd', title: '密码', align: 'center', templet: function (res) {
                        return '******';
                    }
                }
                , {
                    field: 'available', title: '是否可用', align: 'center', templet: function (res) {
                        return res.available == '1' ? '<font color=green>可用</font>' : '<font color=red>不可用</font>';
                    }
                }
                , {fixed: 'right', title: '操作', toolbar: '#userBar', width: 260, align: 'center'}
            ]]
            , page: true
            , done: function (data, curr, count) {
                //不是第一页时如果当前返回的数据为0那么就返回上一页
                if (data.data.length == 0&&curr != 1){
                    tableIns.reload({
                        page: {curr: curr-1}
                    });
                }
            }
        });

        //模糊查询
        $("#doSearch").on('click', function () {
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${requestScope.contextPath}/user/findAllUser?" + params,
                page:{curr:1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(userTable)", function (obj) {
            switch (obj.event) {
                case 'add':
                    //增加
                    openAdd();
                    break;
                case 'batchDelete':
                    //批量删除
                    batchDelete();
                    break;
            }
        });

        //打开添加页面
        var mainIndex;
        var url;

        function openAdd() {
            mainIndex = layer.open({
                type: 1,
                area: ['800x', '450px'], //宽高
                content: $("#saveOrUpdateDiv"),
                title: '添加用户信息',
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url = "${requestScope.contextPath}/user/addUser";
                }
            });
        }

        //批量删除
        function batchDelete() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('userTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (index, item) {
                if (index == 0) {
                    params += "userId=" + item.userId;
                } else {
                    params += "&userId=" + item.userId;
                }
            });
            layer.confirm('确定删除选中的这些用户吗？', function (index) {
                //向服务端发送删除指令
                $.post("${requestScope.contextPath}/user/batchDeleteUser", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                });
            });
        }

        //监听行工具事件
        table.on('tool(userTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.loginName + '】这个用户吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/user/deleteUserByUserId?userId=" + data.userId, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateUser(data);
            } else if (layEvent === 'selectUserRole') {//分配菜单
                //打开分配菜单页面
                selectUserRole(data);
            } else if (layEvent === 'changeUserPwd') {//重置密码
                layer.confirm('确定重置【' + data.loginName + '】这个用户密码吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/user/changePwd?userId=" + data.userId, function (res) {
                        layer.msg(res.msg);
                    });
                });
            }
        });

        //打开修改页面
        function openUpdateUser(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改用户信息',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '450px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${requestScope.contextPath}/user/updateUser";
                }
            });
        }

        //打开分配角色页面
        function selectUserRole(data) {
            mainIndex = layer.open({
                type: 1,
                title: '分配【'+data.loginName+'】的角色',
                content: $("#selectUserRole"),
                area: ['800px', '450px'],
                btnAlign: 'c',
                btn: ['<div class="layui-icon layui-icon-release">确认分配</div>', '<div class="layui-icon layui-icon-close">取消分配</div>'],
                yes: function (index, layero) {
                    //得到选中的数据行
                    var checkStatus = table.checkStatus('userRoleTable');
                    var data1 = checkStatus.data;
                    var params = "userId="+data.userId;
                    $.each(data1, function (i,item) {
                        params+="&rid="+item.roleId;

                    });
                    $.post("${requestScope.contextPath}/user/addRoleUser",params,function (obj) {
                        layer.msg(obj.msg);
                        //关闭弹出层
                        layer.close(mainIndex);
                    })
                },
                success: function (index) {
                    var roleTableIns = table.render({
                        elem: '#userRoleTable'
                        , url: '${requestScope.contextPath}/user/initRoleUserTable?userId='+ data.userId
                        , title: '角色列表'
                        , cellMinWidth: 100 //设置列的最小默认宽度
                        , cols: [[
                            {type: 'checkbox', fixed: 'left'}
                            , {field: 'roleId', title: '角色ID', fixed: 'left', align: 'center'}
                            , {field: 'roleName', title: '角色名称', align: 'center'}
                            , {field: 'roleDesc', title: '角色备注', align: 'center'}
                        ]]
                    });
                }
            });
        }


        //保存
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                //刷新数据 表格
                tableIns.reload();
            });
        });
    });

</script>


</body>
</html>


