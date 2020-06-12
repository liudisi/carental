<%--
  Created by IntelliJ IDEA.
  check: Administrator
  Date: 2020/4/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>检查单管理</title>
    <link rel="stylesheet" href="../../../../statics/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../../statics/css/public.css" media="all"/>
</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">检查单号:</label>
            <div class="layui-input-inline">
                <input type="text" name="checkId" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-inline">
                <input type="text" name="rentId" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">存在问题:</label>
            <div class="layui-input-inline">
                <input type="text" name="problem" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">问题描述:</label>
            <div class="layui-input-inline">
                <input type="text" name="checkDesc" autocomplete="off" class="layui-input">
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
            <button type="reset" class="layui-btn  layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">重置
            </button>
        </div>
    </div>
</form>

<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="checkTable" lay-filter="checkTable"></table>
<div style="display: none;" id="checkToolBar">
</div>
<script type="text/html" id="checkBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <label class="layui-form-label">检查单号:</label>
            <div class="layui-input-block">
                <input type="text" name="checkId" lay-verify="required" readonly="readonly" placeholder="请输入检查单号"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentId" lay-verify="required" readonly="readonly"
                       placeholder="请输入出租单号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">检查时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkDate" id="checkDate" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">赔付金额:</label>
                <div class="layui-input-inline">
                    <input type="text" name="payMoney" lay-verify="required" placeholder="请输入赔付金额"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">存在问题:</label>
                <div class="layui-input-inline">
                    <input type="text" name="problem" lay-verify="required" placeholder="请输入存在的问题"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">填写人:</label>
                <div class="layui-input-inline">
                    <input type="text" name="operName" lay-verify="required" readonly="readonly" placeholder="请输入填写人"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">问题描述</label>
            <div class="layui-input-block">
                    <textarea placeholder="请输入问题描述" lay-verify="required" name="checkDesc"
                              class="layui-textarea"></textarea>
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
    layui.use(['jquery', 'layer', 'form', 'table', 'laydate'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer
            , table = layui.table
            , laydate = layui.laydate;
        //渲染时间
        laydate.render({
            elem: '#startTime',
            type: 'datetime'
        });
        laydate.render({
            elem: '#endTime',
            type: 'datetime'
        });

        //渲染时间
        laydate.render({
            elem: '#checkDate',
            type: 'datetime'
        });

        //数据列表
        tableIns = table.render({
            elem: '#checkTable'
            , url: '${requestScope.contextPath}/check/findAllCheck'
            , toolbar: '#checkToolBar'
            , title: '检查单列表'
            , height: 'full-260'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {field: 'checkId', title: '检查单号', width: 260, align: 'center'}
                , {field: 'rentId', title: '出租单号', width: 260, align: 'center'}
                , {field: 'checkDate', title: '检查时间', width: 160, align: 'center'}
                , {field: 'payMoney', title: '赔付金额', width: 100, align: 'center'}
                , {field: 'checkDesc', title: '问题描述', width: 140, align: 'center'}
                , {field: 'problem', title: '存在问题', width: 140, align: 'center'}
                , {field: 'operName', title: '填写人', width: 100, align: 'center'}
                , {field: 'createTime', title: '录入时间', width: 160, align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#checkBar', width: 100, align: 'center'}
            ]]
            , page: true
        });
        //模糊查询
        $("#doSearch").on('click', function () {
            var params = $("#searchFrm").serialize();
            tableIns.reload({
                url: "${requestScope.contextPath}/check/findAllCheck?" + params,
                page: {curr: 1}
            })
        });


        //打开添加页面
        var mainIndex;
        var url;

        //监听行工具事件
        table.on('tool(checkTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateCheck(data);
            }
        });


        //打开修改页面
        function openUpdateCheck(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改检查单信息',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '530px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${requestScope.contextPath}/check/updateCheck";
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


