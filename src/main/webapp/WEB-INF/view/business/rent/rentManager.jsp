<%--
  Created by IntelliJ IDEA.
  rent: Administrator
  Date: 2020/4/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出租单管理</title>
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
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-inline">
                <input type="text" name="rentId" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">车牌号:</label>
            <div class="layui-input-inline">
                <input type="text" name="carNumber" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-inline">
                <input type="text" name="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
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
        <div class="layui-inline">
            <label class="layui-form-label">出租单状态:</label>
            <div class="layui-input-inline">
                <input type="radio" name="rentFlag" value="1" title="已归还">
                <input type="radio" name="rentFlag" value="0" title="未归还">
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
<table class="layui-hide" id="rentTable" lay-filter="rentTable"></table>
<div style="display: none;" id="rentToolBar">
</div>
<script type="text/html" id="rentBar">
    {{#  if(d.rentFlag == 1){ }}
    <a  class="layui-btn  layui-btn-warm layui-btn-xs" lay-event="export">导出</a>
    {{#  } else { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a  class="layui-btn  layui-btn-warm layui-btn-xs" lay-event="export">导出</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  } }}
</script>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">起租时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="beginDate" id="beginDate" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">归还时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="returnDate" id="returnDate" readonly="readonly" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentId" id="rentId" lay-verify="required" readonly="readonly"
                       placeholder="请输入出租单号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-block">
                <input type="text" name="identity" lay-verify="required|identity" readonly="readonly"
                       placeholder="请输入身份证号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">车牌号:</label>
                <div class="layui-input-inline">
                    <input type="text" name="carNumber" lay-verify="required" readonly="readonly" placeholder="请输入车牌号"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出租价格:</label>
                <div class="layui-input-inline">
                    <input type="text" name="price" lay-verify="required|number"
                           placeholder="请输入出租价格"
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
            elem: '#beginDate',
            type: 'datetime'
        });
        laydate.render({
            elem: '#returnDate',
            type: 'datetime'
        });

        //数据列表
        tableIns = table.render({
            elem: '#rentTable'
            , url: '${requestScope.contextPath}/rent/findAllRent'
            , toolbar: '#rentToolBar'
            , title: '出租单列表'
            , height: 'full-260'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {field: 'rentId', title: '出租单号', width: 260, align: 'center'}
                , {field: 'identity', title: '身份证号', width: 180, align: 'center'}
                , {field: 'carNumber', title: '车牌号', width: 140, align: 'center'}
                , {field: 'price', title: '出租价格', width: 100, align: 'center'}
                , {
                    field: 'rentFlag', title: '出租单状态', width: 100, align: 'center', templet: function (res) {
                        return res.rentFlag == '1' ? '<font color=green>已归还</font>' : '<font color=red>未归还</font>';
                    }
                }
                , {field: 'beginDate', title: '起租时间', width: 160, align: 'center'}
                , {field: 'returnDate', title: '归还时间', width: 160, align: 'center'}
                , {field: 'operName', title: '填写人', width: 100, align: 'center'}
                , {field: 'createTime', title: '录入时间', width: 160, align: 'center'}
                , {fixed: 'right', title: '操作', toolbar: '#rentBar', width: 160, align: 'center'}
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
                url: "${requestScope.contextPath}/rent/findAllRent?" + params,
                page: {curr: 1}
            })
        });


        //打开添加页面
        var mainIndex;
        var url;

        //监听行工具事件
        table.on('tool(rentTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.rentId + '】这个出租单吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/rent/deleteRentByRentId?rentId=" + data.rentId, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateRent(data);
            }else if (layEvent === 'export'){//导出
                window.location.href="${requestScope.contextPath}/stat/exportRent?rentId="+data.rentId;
            }
        });


        //打开修改页面
        function openUpdateRent(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改出租单信息',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "${requestScope.contextPath}/rent/updateRent";
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


