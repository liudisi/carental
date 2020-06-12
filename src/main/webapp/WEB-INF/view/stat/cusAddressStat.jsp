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
    <title>客户地区统计</title>
</head>
<body style="height: 100%; margin: 0">
<div id="container" style="height: 100%"></div>
<script type="text/javascript" src="../../../statics/echarts/js/echarts.min.js"></script>
<script type="text/javascript" src="../../../statics/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
    $.get("${requestScope.contextPath}/stat/loadCusAddressStatJson",function (data) {
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title: {
                text: '汽车出租系统客户地区统计分析',
                subtext: '真实有效',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: data
            },
            series: [
                {
                    name: '客户数量(占比)',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    data: data,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    })
</script>
</body>
</html>
