<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/3
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>年度业务员销售总额统计</title>
    <link rel="stylesheet" href="../../../statics/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../statics/css/public.css" media="all"/>
</head>
<body style="height: 70%; margin: 0">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <div class="layui-form-item" style="text-align: center">
        <div class="layui-inline">
            <label class="layui-form-label">选择年份:</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" id="year" readonly="readonly" placeholder="yyyy">
            </div>
        </div>
        <div class="layui-btn-group">
            <button type="button" class="layui-btn  layui-icon layui-icon-release"
                    id="doSearch" lay-submit="">查询
            </button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->

<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="../../../statics/echarts/js/echarts.min.js"></script>
<script src="../../../statics/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['jquery', 'form', 'laydate'], function () {
        var form = layui.form
            , $ = layui.jquery
            , laydate = layui.laydate;
        //渲染时间
        laydate.render({
            elem: '#year',
            type: 'year',
            value: new Date()
        });

        $("#doSearch").on('click', function () {
            getDate();
        });

        function getDate() {
            var year = $("#year").val();
            if (year === '') {
                year = new Date().getFullYear();
            }
            $.get("${requestScope.contextPath}/stat/loadOperNamePricesToYearStatJson", {year: year}, function (data) {
                var dom = document.getElementById("container");
                var myChart = echarts.init(dom);
                var app = {};
                option = null;
                option = {
                    color: ['#3398DB'],
                    title: {
                        text: '年度业务员销售总额统计分析',
                        subtext: '真实有效',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: data.name,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '销售总额',
                            type: 'bar',
                            barWidth: '60%',
                            data: data.value
                        }
                    ]
                };
                if (option && typeof option === "object") {
                    myChart.setOption(option, true);
                }
            });
        }

        getDate();
    });
</script>
</body>
</html>
