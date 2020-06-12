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
    <title>车辆管理</title>
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
            <label class="layui-form-label">车牌号:</label>
            <div class="layui-input-inline">
                <input type="text" name="carNumber" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">车辆型号:</label>
            <div class="layui-input-inline">
                <input type="text" name="carType" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">车辆颜色:</label>
            <div class="layui-input-inline">
                <input type="text" name="color" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">车辆描述:</label>
            <div class="layui-input-inline">
                <input type="text" name="description" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">出租状态:</label>
            <div class="layui-input-inline">
                <input type="radio" name="isRenting" value="1" title="已出租">
                <input type="radio" name="isRenting" value="0" title="未出租">
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
<table class="layui-hide" id="carTable" lay-filter="carTable"></table>
<div style="display: none;" id="carToolBar">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="batchDelete">批量删除</button>
    <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加车辆</button>
</div>
<div id="carBar" style="display: none;">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="viewBigImg">查看大图</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">
                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">车牌号:</label>
                        <div class="layui-input-block">
                            <input type="text" name="carNumber" id="carNumber" class="layui-input" lay-verify="required"
                                   placeholder="请输入车牌号">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车辆类型:</label>
                        <div class="layui-input-block">
                            <input type="text" name="carType" class="layui-input" lay-verify="required"
                                   placeholder="请输入车辆类型">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">车辆颜色:</label>
                        <div class="layui-input-block">
                            <input type="text" name="color" class="layui-input" lay-verify="required"
                                   placeholder="请输入车辆颜色">
                        </div>
                    </div>
                </div>
                <!-- 上传图片 -->
                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="carImgDiv">
                        <!-- 显示上传的图片 -->
                        <img class="layui-upload-img thumbImg" id="showCarImg">
                        <!-- 保存当前显示图片的地址 -->
                        <input type="hidden" name="carImg" id="carImg">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <div class="layui-inline">
                    <label class="layui-form-label">购买价格:</label>
                    <div class="layui-input-block">
                        <input type="text" name="price" class="layui-input" lay-verify="required|number"
                               placeholder="请输入购买价格">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出租价格:</label>
                    <div class="layui-input-block">
                        <input type="text" name="rentPrice" class="layui-input" lay-verify="required|number"
                               placeholder="请输入出租价格">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">出租押金:</label>
                    <div class="layui-input-block">
                        <input type="text" name="deposit" class="layui-input" lay-verify="required|number"
                               placeholder="请输入出租押金">
                    </div>
                </div>
            </div>
            <div class="layui-form-item magb0">
                <label class="layui-form-label">车辆描述:</label>
                <div class="layui-input-block">
                    <input type="text" name="description" class="layui-input" placeholder="请输入车辆描述">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">出租状态:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="isRenting" value="1" title="已出租">
                    <input type="radio" name="isRenting" value="0" title="未出租" checked="checked">
                </div>
            </div>
            <div class="layui-form-item magb0" style="text-align: center;">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn  layui-btn-sm layui-icon layui-icon-release"
                            lay-filter="doSubmit" lay-submit="">保存
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh">
                        重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
<!-- 添加和修改的弹出层结束 -->

<!-- 查看大图的弹出层开始 -->
<div id="viewBigCarImg" style="display: none;text-align: center">
    <img alt="车辆图片" width="700px" height="450px" id="viewCarImg">
</div>
<!-- 查看大图的弹出层结束 -->
<script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

<script>
    var tableIns;
    layui.use(['jquery', 'layer', 'form', 'table', 'upload'], function () {
        var form = layui.form
            , $ = layui.jquery
            , layer = layui.layer
            , table = layui.table
            , upload = layui.upload;

        //数据列表
        tableIns = table.render({
            elem: '#carTable'
            , url: '${requestScope.contextPath}/car/findAllCar'
            , toolbar: '#carToolBar'
            , title: '车辆列表'
            , height: 'full-260'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'carNumber', title: '车牌号', width: 120, align: 'center'}
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
                url: "${requestScope.contextPath}/car/findAllCar?" + params,
                page: {curr: 1}
            })
        });

        //监听头部工具栏事件
        table.on("toolbar(carTable)", function (obj) {
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
                title: '添加车辆信息',
                success: function (index) {
                    //清空表单数据
                    $("#dataFrm")[0].reset();
                    //设置默认图片
                    $("#showCarImg").attr('src',"${requestScope.contextPath}/file/downloadFile?path=images/defaultCarImg.jpg");
                    $("#carImg").val("images/defaultCarImg.jpg");
                    url = "${requestScope.contextPath}/car/addCar";
                    $("#carNumber").removeAttr("readonly");
                }
            });
        }

        //批量删除
        function batchDelete() {
            //得到选中的数据行
            var checkStatus = table.checkStatus('carTable');
            var data = checkStatus.data;
            var params = "";
            $.each(data, function (index, item) {
                if (index == 0) {
                    params += "carNumber=" + item.carNumber;
                } else {
                    params += "&carNumber=" + item.carNumber;
                }
            });
            layer.confirm('确定删除选中的这些车辆吗？', function (index) {
                //向服务端发送删除指令
                $.post("${requestScope.contextPath}/car/batchDeleteCar", params, function (res) {
                    layer.msg(res.msg);
                    //刷新数据 表格
                    tableIns.reload();
                });
            });
        }

        //监听行工具事件
        table.on('tool(carTable)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if (layEvent === 'del') { //删除
                layer.confirm('确定删除【' + data.carNumber + '】这个车辆吗？', function (index) {
                    //向服务端发送删除指令
                    $.get("${requestScope.contextPath}/car/deleteCarByCarNumber?carNumber=" + data.carNumber, function (res) {
                        layer.msg(res.msg);
                        //刷新数据 表格
                        tableIns.reload();
                    });
                });
            } else if (layEvent === 'edit') { //编辑
                //打开修改页面
                openUpdateCar(data);
            }else if(layEvent ==='viewBigImg'){//查看大图
                showBigCarImg(data);
            }
        });

        //查看大图
        function showBigCarImg(data) {
            mainIndex = layer.open({
                type: 1,
                title: '【'+data.carNumber+'】的车辆大图',
                content: $("#viewBigCarImg"),
                area: ['750px', '500px'],
                success: function (index) {
                    $("#viewCarImg").attr("src","${requestScope.contextPath}/file/downloadFile?path="+data.carImg);
                }
            });
        }
        //打开修改页面
        function openUpdateCar(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改车辆信息',
                content: $("#saveOrUpdateDiv"),
                area: ['850px', '470px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    $("#showCarImg").attr('src',"${requestScope.contextPath}/file/downloadFile?path="+data.carImg);
                    url = "${requestScope.contextPath}/car/updateCar";
                    $("#carNumber").attr("readonly","readonly");
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

        //上传缩略图
        upload.render({
            elem: '#carImgDiv',
            url: '${requestScope.contextPath}/file/uploadFile',
            acceptMime: 'image/*',
            field: 'upload',
            done: function (res, index, upload) {
                $('#showCarImg').attr('src', '${requestScope.contextPath}/file/downloadFile?path=' + res.data.src);
                $('#carImg').val(res.data.src);
                $('#carImgDiv').css("background", "#fff");
            }
        });
    });

</script>
</body>
</html>


