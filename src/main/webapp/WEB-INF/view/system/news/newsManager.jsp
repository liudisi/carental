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
    <title>公告管理</title>
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
            <label class="layui-form-label">公告标题:</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-inline">
                <input type="text" name="content" autocomplete="off" class="layui-input">
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
    <div class="layui-form-item" style="text-align: center">
        <div class="layui-inline">
            <button type="button" class="layui-btn layui-icon layui-icon-search" id="doSearch">查询</button>
            <button type="reset" class="layui-btn layui-btn-primary layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="newsTable" lay-filter="newsTable"></table>
<div style="display: none;" id="newsToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="batchDelete">批量删除</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加公告</button>
</div>
<div id="newsBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="viewNews">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px;text-align: left" id="saveOrUpdateDiv">
    <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <label class="layui-form-label">公告标题:</label>
            <div class="layui-input-block">
                <input type="hidden" name="id">
                <input type="text" name="title" placeholder="请输入公告标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公告内容:</label>
            <div class="layui-input-block">
                <!-- 文本域 -->
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="content"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-sm layui-icon layui-icon-release"
                        lay-filter="doSubmit" lay-submit="">保存
                </button>
                <button type="reset" id="dataFrmResetBtn" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置</button>
            </div>
        </div>
    </form>
</div>
<!-- 添加和修改的弹出层结束 -->

<!-- 查看公告的div -->
<div  id="viewNewsDiv" style="padding: 10px;display: none;">
    <h2 id="view_title" align="center"></h2>
    <hr>
    <div style="text-align: right;">
        发布人:<span id="view_operName"></span> <span style="display: inline-block;width: 20px"></span>
        发布时间:<span id="view_createTime"></span>
    </div>
    <hr>
    <div  id="view_content"></div>
</div>

<script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

<script>
    var tableIns;
    //初始化富文本编辑器
    var editIndex;
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate', 'layedit'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer
            , table = layui.table
            , laydate = layui.laydate
            , layedit = layui.layedit;
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
            elem: '#newsTable'
            , url: '${requestScope.contextPath}/news/findAllNews'
            , toolbar: '#newsToolBar'
            , title: '公告列表'
            , height: 'full-200'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', fixed: 'left', align: 'center'}
                , {field: 'title', title: '公告标题', align: 'center'}
                // , {field: 'content', title: '公告内容', align: 'center'}
                , {field: 'createTime', title: '创建时间', align: 'center'}
                , {field: 'operName', title: '发布人', align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#newsBar', align: 'center'}
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
                url: "${requestScope.contextPath}/news/findAllNews?" + params,
                page:{curr:1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(newsTable)", function (obj) {
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
                area: ['800x', '550px'], //宽高
                content: $("#saveOrUpdateDiv"),
                title: '添加公告',
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    editIndex = layedit.build('content'); //建立编辑器
                    url = "${requestScope.contextPath}/news/addNews";
                }
            });
        }

        //批量删除
        function batchDelete() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('newsTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (index, item) {
                if (index == 0) {
                    params += "id=" + item.id;
                } else {
                    params += "&id=" + item.id;
                }
            });
            layer.confirm('确定删除选中的这些公告吗？', function (index) {
                //向服务端发送删除指令
                $.post("${requestScope.contextPath}/news/batchDeleteByIds", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                });
            });
        }

        //监听行工具事件
        table.on('tool(newsTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.title + '】这个公告吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/news/deleteNewsById?id=" + data.id, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateNews(data);
            } else if (layEvent === 'viewNews') {//查看
                //打开查看页面
                viewNews(data);
            }
        });

        //打开修改页面
        function openUpdateNews(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改公告',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '550px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    editIndex = layedit.build('content'); //建立编辑器
                    url = "${requestScope.contextPath}/news/updateNews";
                }
            });
        }

        //打开查看页面
        function viewNews(data) {
            mainIndex = layer.open({
                type: 1,
                title: '查看公告',
                content: $("#viewNewsDiv"),
                area: ['800px', '550px'],
                success: function (index) {
                    $("#view_title").html(data.title);
                    $("#view_operName").html(data.operName);
                    $("#view_createTime").html(data.createTime);
                    $("#view_content").html(data.content);
                }
            });
        }

        //富文本编辑器重置按钮
        $("#dataFrmResetBtn").on("click",function () {
            layedit.setContent(editIndex,"");
        });

        //保存
        form.on("submit(doSubmit)", function (obj) {
            layedit.sync(editIndex);//把富文本里面的数据同步到自己写的textarea里面
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            });
        });
    });

</script>
</body>
</html>


