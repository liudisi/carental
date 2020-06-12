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
    <title>汽车入库</title>
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
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentId" id="search_rentId" placeholder="请输入出租单号" autocomplete="off"
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

<!-- 检查单表单开始 -->
<div id="dataFrm" style="display: none">
    <blockquote class="layui-elem-quote" style="margin-top: 10px;">
        <h2>检查单</h2>
        <hr>
        <form class="layui-form layui-row layui-col-space10" lay-filter="checkFrm" id="checkFrm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">检查单号:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="checkId" id="checkId" autocomplete="off" placeholder="请输入检查单号"
                               readonly="readonly" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出租单号:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="rentId" placeholder="请输入出租单号" autocomplete="off" readonly="readonly"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">检查时间:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="checkDate" id="checkDate" readonly="readonly" autocomplete="off"
                               placeholder="请选择检查时间" class="layui-input">
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
                    <label class="layui-form-label">赔付金额:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="payMoney" lay-verify="required|number" value="0" placeholder="请输入赔付金额"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">填写人:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="operName" readonly="readonly" placeholder="请输入填写人"
                               autocomplete="off" class="layui-input">
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
                    <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">
                        重置
                    </button>
                </div>
            </div>
        </form>
    </blockquote>
</div>
<!-- 检查单表单结束 -->

<!-- 出租单 车辆 客户信息展开开始 -->
<div id="cardData" style="display: none">
    <div style="padding: 10px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space8">
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">车辆信息</div>
                    <div class="layui-card-body" id="car_carNumber">
                    </div>
                    <div class="layui-card-body" id="car_carType">
                    </div>
                    <div class="layui-card-body" id="car_color">
                    </div>
                    <div class="layui-card-body" id="car_price">
                    </div>
                    <div class="layui-card-body" id="car_rentPrice">
                    </div>
                    <div class="layui-card-body" id="car_deposit">
                    </div>
                    <div class="layui-card-body" id="car_description">
                    </div>
                    <div class="layui-card-body">
                        车辆图片:<img src="" alt="" id="car_carImg" width="150px" height="100px">
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">出租单信息</div>
                    <div class="layui-card-body" id="rent_rentId">
                    </div>
                    <div class="layui-card-body" id="rent_price">
                    </div>
                    <div class="layui-card-body" id="rent_beginDate">
                    </div>
                    <div class="layui-card-body" id="rent_returnDate">
                    </div>
                    <div class="layui-card-body" id="rent_operName">
                    </div>
                </div>
            </div>
            <div class="layui-col-md4">
                <div class="layui-card">
                    <div class="layui-card-header">客户信息</div>
                    <div class="layui-card-body" id="customer_identity">
                    </div>
                    <div class="layui-card-body" id="customer_custName">
                    </div>
                    <div class="layui-card-body" id="customer_sex">
                    </div>
                    <div class="layui-card-body" id="customer_address">
                    </div>
                    <div class="layui-card-body" id="customer_phone">
                    </div>
                    <div class="layui-card-body" id="customer_career">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 出租单 车辆 客户信息展开结束 -->

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
            elem: '#checkDate',
            type: 'datetime'
        });

        //根据出租单号查询出租单信息
        $("#doSearch").on('click', function () {
            var rentId = $("#search_rentId").val();
            $.post("${requestScope.contextPath}/check/checkRentIsExist", {rentId: rentId}, function (obj) {
                if (obj === "") {
                    layer.msg("出租单号不存在，请更正后再查询");
                    $("#dataFrm").hide();
                    $("#cardData").hide();
                } else {
                    if (obj.rentFlag === 1) {
                        layer.msg("该出租单号相关车辆已归还，无需再入库");
                        $("#dataFrm").hide();
                        $("#cardData").hide();
                    } else {
                        initCheckFrmDataAndCard(rentId);
                        $("#dataFrm").show();
                        $("#cardData").show();
                    }
                }
            });
        });

        //加载表单数据和卡片面板数据
        function initCheckFrmDataAndCard(rentId) {
            $.post("${requestScope.contextPath}/check/initCheckFromDataAndCard", {rentId: rentId}, function (obj) {
                //检查单
                var check = obj.check;
                form.val("checkFrm", check);//装载表单

                //出租单
                var rent = obj.rent;
                $("#rent_rentId").html("出租单号: " + rent.rentId);
                $("#rent_price").html("出租价格: " + rent.price);
                $("#rent_beginDate").html("起租时间: " + rent.beginDate);
                $("#rent_returnDate").html("归还时间: " + rent.returnDate);
                $("#rent_operName").html("填写人: " + rent.operName);
                //客户
                var customer = obj.customer;
                $("#customer_identity").html("身份证号: " + customer.identity);
                $("#customer_custName").html("客户姓名: " + customer.custName);
                $("#customer_sex").html("客户性别: " + (customer.sex == 1 ? '男' : '女'));
                $("#customer_address").html("客户地址: " + customer.address);
                $("#customer_phone").html("客户电话: " + customer.phone);
                $("#customer_career").html("客户职位: " + customer.career);
                //车辆
                var car = obj.car;
                $("#car_carNumber").html("车牌号: " + car.carNumber);
                $("#car_carType").html("车辆类型: " + car.carType);
                $("#car_color").html("车辆颜色: " + car.color);
                $("#car_price").html("购买价格: " + car.price);
                $("#car_rentPrice").html("出租价格: " + car.rentPrice);
                $("#car_deposit").html("出租押金: " + car.deposit);
                $("#car_description").html("车辆描述: " + car.description);
                $("#car_carImg").attr("src", "${requestScope.contextPath}/file/downloadFile?path=" + car.carImg);
            });

        }


        //保存
        form.on("submit(doSubmit)", function () {
            //序列化表单数据
            var params = $("#checkFrm").serialize();
            $.post("${requestScope.contextPath}/check/addCheck", params, function (obj) {
                layer.msg(obj.msg);
                $("#dataFrm").hide();
                $("#cardData").hide();
            });
        });

    });

</script>
</body>
</html>


