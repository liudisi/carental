<%--
  Created by IntelliJ IDEA.
  car: Administrator
  Date: 2020/4/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汽车出租</title>
    <link rel="stylesheet" href="../../../../statics/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../../statics/css/public.css" media="all"/>
</head>
<body class="childrenBody">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item" style="text-align: center">
        <div class="layui-inline">
            <label class="layui-form-label">身份证号:</label>
            <div class="layui-input-block">
                <input type="text" name="identity" id="identity" placeholder="请输入客户身份证号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn  layui-icon layui-icon-release"
                    id="doSearch" lay-submit="">查询
            </button>
            <button type="reset" class="layui-btn  layui-btn-primary layui-icon layui-icon-refresh">重置
            </button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<div id="dataTable" style="display: none">
    <table id="carTable" lay-filter="carTable"></table>
    <div id="carBar" style="display: none;">
        <a class="layui-btn layui-btn-xs " lay-event="rentCar">出租汽车</a>
        <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="viewBigImg">查看车辆大图</a>
    </div>
</div>
<!-- 数据表格结束 -->

<!-- 汽车出租的弹出层开始 -->
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
<!-- 汽车出租的弹出层结束 -->

<!-- 查看大图的弹出层开始 -->
<div id="viewBigCarImg" style="display: none;text-align: center">
    <img alt="车辆图片" width="700px" height="450px" id="viewCarImg">
</div>
<!-- 查看大图的弹出层结束 -->
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
            elem: '#beginDate',
            type: 'datetime'
        });
        laydate.render({
            elem: '#returnDate',
            type: 'datetime'
        });

        function initCarData() {
            //数据列表
            tableIns = table.render({
                elem: '#carTable'
                , url: '${requestScope.contextPath}/car/findAllCar?isRenting=0'
                , title: '车辆列表'
                , height: 'full-150'
                , cellMinWidth: 100 //设置列的最小默认宽度
                , cols: [[
                    {field: 'carNumber', title: '车牌号', width: 120, align: 'center'}
                    , {field: 'carType', title: '车辆型号', width: 100, align: 'center'}
                    , {field: 'color', title: '车辆颜色', width: 100, align: 'center'}
                    , {field: 'price', title: '购买价格', width: 80, align: 'center'}
                    , {field: 'rentPrice', title: '出租价格', width: 80, align: 'center'}
                    , {field: 'deposit', title: '出租押金', width: 80, align: 'center'}
                    , {field: 'description', title: '车辆描述', width: 180, align: 'center'}
                    , {
                        field: 'isRenting', title: '出租状态', width: 100, align: 'center', templet: function (res) {
                            return res.isRenting == '1' ? '<font color=green>已出租</font>' : '<font color=red>未出租</font>';
                        }
                    }
                    , {
                        field: 'carImg', title: '缩略图', width: 180, align: 'center', templet: function (res) {
                            return "<img width=40 height=30 src=${requestScope.contextPath}/file/downloadFile?path=" + res.carImg + "/>";
                        }
                    }
                    , {field: 'createTime', title: '录入时间', width: 180, align: 'center'}
                    , {fixed: 'right', title: '操作', toolbar: '#carBar', width: 200, align: 'center'}
                ]]
                , page: true
            });
        }

        //模糊查询
        $("#doSearch").on('click', function () {
            var params = $("#searchFrm").serialize();
            $.post("${requestScope.contextPath}/rent/checkCustomerIsExist", params, function (obj) {
                if (obj.code < 0) {
                    layer.msg("客户身份证号不存在，请更正后再查询");
                    $("#dataTable").hide();
                } else {
                    $("#dataTable").show();
                    initCarData();
                }
            });
        });

        var mainIndex;
        //监听行工具事件
        table.on('tool(carTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'rentCar') { //编辑
                //打开修改页面
                openRentCar(data);
            } else if (layEvent === 'viewBigImg') {//查看大图
                showBigCarImg(data);
            }
        });

        //查看大图
        function showBigCarImg(data) {
            mainIndex = layer.open({
                type: 1,
                title: '【' + data.carNumber + '】的车辆大图',
                content: $("#viewBigCarImg"),
                area: ['750px', '500px'],
                success: function (index) {
                    $("#viewCarImg").attr("src", "${requestScope.contextPath}/file/downloadFile?path=" + data.carImg);
                }
            });
        }

        //打开汽车出租页面
        function openRentCar(data) {
            mainIndex = layer.open({
                type: 1,
                title: '填写汽车出租单',
                content: $("#saveOrUpdateDiv"),
                area: ['800px', '500px'],
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    var identity = $("#identity").val();
                    var price = data.rentPrice;
                    var carNumber = data.carNumber;
                    //请求数据
                    $.get("${requestScope.contextPath}/rent/initRentFrom", {
                        identity: identity,
                        price: price,
                        carNumber: carNumber
                    }, function (obj) {
                        //赋值
                        form.val("dataFrm", obj.data);
                    });
                }
            });
        }

        //保存
        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post("${requestScope.contextPath}/rent/addRent", params, function (obj) {
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                $("#dataTable").hide();
            });
        });

    });

</script>
</body>
</html>


