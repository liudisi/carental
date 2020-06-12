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
    <title>日志管理</title>
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
            <label class="layui-form-label">登陆名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="loginName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登陆IP:</label>
            <div class="layui-input-inline">
                <input type="text" name="loginIp" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime" readonly="readonly" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" readonly="readonly" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="button" class="layui-btn  layui-btn-sm layui-icon layui-icon-release"
                    id="doSearch" lay-submit="">查询
            </button>
            <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="logInfoTable" lay-filter="logInfoTable"></table>
<div style="display: none;" id="logInfoToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="batchDelete">批量删除</button>
</div>
<div id="logInfoBar" style="display: none;">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

<script>
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        //渲染时间
        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });


        //数据列表
        tableIns = table.render({
            elem: '#logInfoTable'
            , url: '${requestScope.contextPath}/logInfo/findAllLogInfo'
            , toolbar: '#logInfoToolBar'
            , title: '日志信息列表'
            , height: 'full-200'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', fixed: 'left', align: 'center'}
                , {field: 'loginName', title: '登录名称', align: 'center'}
                , {field: 'loginIp', title: '登录IP', align: 'center'}
                , {field: 'loginTime', title: '登录时间', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#logInfoBar', align: 'center'}
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
                url: "${requestScope.contextPath}/logInfo/findAllLogInfo?" + params,
                page:{curr:1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(logInfoTable)", function (obj) {
            if (obj.event === 'batchDelete') {
                batchDelete();
            }
        });

        //批量删除
        function batchDelete() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('logInfoTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (index, item) {
                if (index == 0) {
                    params += "id=" + item.id;
                } else {
                    params += "&id=" + item.id;
                }
            });
            layer.confirm('确定删除选中的这些日志信息吗？', function (index) {
                //向服务端发送删除指令
                $.post("${requestScope.contextPath}/logInfo/batchDeleteByIds", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                });
            });
        }

        //监听行工具事件
        table.on('tool(logInfoTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.loginName + '】的日志信息吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/logInfo/deleteLogInfoById?id=" + data.id, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            }
        });
    });

</script>


</body>
</html>


