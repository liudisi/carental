<%--
  Created by IntelliJ IDEA.
  customer: Administrator
  Date: 2020/4/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户管理</title>
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
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">客户姓名:</label>
            <div class="layui-input-inline">
                <input type="text" name="custName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">客户职位:</label>
            <div class="layui-input-inline">
                <input type="text" name="career" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">客户地址:</label>
            <div class="layui-input-inline">
                <input type="text" name="address" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">客户电话:</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
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
            <button type="button" class="layui-btn  layui-btn-normal layui-btn-sm layui-icon layui-icon-download-circle"
                    id="doExport" lay-submit="">导出
            </button>
            <button type="reset" class="layui-btn  layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置
            </button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="customerTable" lay-filter="customerTable"></table>
<div style="display: none;" id="customerToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="batchDelete">批量删除</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加客户</button>
</div>
<div id="customerBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="identity" id="identity" lay-verify="required|identity"
                           placeholder="请输入客户身份证号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="custName" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户地址:</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" placeholder="请输入客户地址" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户电话:</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入客户电话" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户职位:</label>
                <div class="layui-input-inline">
                    <input type="text" name="career" placeholder="请输入客户职位" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" checked="checked" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn  layui-btn-sm layui-icon layui-icon-release"
                        lay-filter="doSubmit" lay-submit="">保存
                </button>
                <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置
                </button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

<script>
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer
            , table = layui.table;

        //数据列表
        tableIns = table.render({
            elem: '#customerTable'
            , url: '${requestScope.contextPath}/cus/findAllCustomer'
            , toolbar: '#customerToolBar'
            , title: '客户列表'
            , height: 'full-250'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'identity', title: '身份证号', fixed: 'left', align: 'center'}
                , {field: 'custName', title: '客户姓名', width: 100, align: 'center'}
                , {
                    field: 'sex', title: '性别', width: 80, align: 'center', templet: function (res) {
                        return res.sex == '1' ? '<font color=blue>男</font>' : '<font color=green>女</font>';
                    }
                }
                , {field: 'address', title: '客户地址', align: 'center'}
                , {field: 'phone', title: '客户电话', align: 'center'}
                , {field: 'career', title: '客户职位', align: 'center'}
                , {field: 'createTime', title: '录入时间', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#customerBar', width: 150, align: 'center'}
            ]]
            , page: true
            , done: function (data, curr, count) {
                //不是第一页时如果当前返回的数据为0那么就返回上一页
                if (data.data.length == 0 && curr != 1) {
                    tableIns.reload({
                        page: {curr: curr - 1}
                    });
                }
            }
        });
        //模糊查询
        $("#doSearch").on('click', function () {
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${requestScope.contextPath}/cus/findAllCustomer?" + params,
                page: {curr: 1}
            })
        });

        //导出
        $("#doExport").on('click', function (obj) {
            var params = $("#searchFrm").serialize();
            window.location.href = "${requestScope.contextPath}/stat/exportCustomer?" + params;
        });

        //监听头部工具栏事件
        table.on("toolbar(customerTable)", function (obj) {
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
                area: ['700x', '400px'], //宽高
                content: $("#saveOrUpdateDiv"),
                title: '添加客户信息',
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    url = "${requestScope.contextPath}/cus/addCustomer";
                    $("#identity").removeAttr("readonly");
                }
            });
        }

        //批量删除
        function batchDelete() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('customerTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (index, item) {
                if (index == 0) {
                    params += "identity=" + item.identity;
                } else {
                    params += "&identity=" + item.identity;
                }
            });
            layer.confirm('确定删除选中的这些客户吗？', function (index) {
                //向服务端发送删除指令
                $.post("${requestScope.contextPath}/cus/batchDeleteCustomer", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                });
            });
        }

        //监听行工具事件
        table.on('tool(customerTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.custName + '】这个客户吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/cus/deleteCustomerByIdentity?identity=" + data.identity, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateCustomer(data);
            }
        });

        //打开修改页面
        function openUpdateCustomer(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改客户信息',
                content: $("#saveOrUpdateDiv"),
                area: ['700px', '400px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${requestScope.contextPath}/cus/updateCustomer";
                    $("#identity").attr("readonly", "readonly");
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


