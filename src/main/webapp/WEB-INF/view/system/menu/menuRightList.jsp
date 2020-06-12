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
        <title>菜单管理</title>
        <link rel="stylesheet" href="../../../../statics/layui/css/layui.css" media="all">
        <link rel="stylesheet" href="../../../../statics/layui_ext/dtree/dtree.css">
        <link rel="stylesheet" href="../../../../statics/layui_ext/dtree/font/dtreefont.css">
        <style type="text/css">
        .select-test{position: absolute;max-height: 500px;height: 350px;overflow: auto;width: 100%;z-index: 123;display:
        none;border:1px solid silver;top: 42px;}
        .layui-show{display: block!important;}
        </style>
        </head>
        <body class="childrenBody">
        <!-- 搜索条件开始 -->
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
        </fieldset>
        <form class="layui-form" method="post" id="searchFrm">
        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">菜单名称:</label>
        <div class="layui-input-inline">
        <input type="text" name="title" autocomplete="off" class="layui-input">
        </div>
        </div>
        <div class="layui-inline">
        <button type="button" class="layui-btn layui-icon layui-icon-search" id="doSearch">查询</button>
        <button type="reset" class="layui-btn layui-btn-primary layui-icon layui-icon-refresh">重置</button>
        </div>
        </div>
        </form>

        <!-- 搜索条件结束 -->

        <!-- 数据表格开始 -->
        <table class="layui-hide" id="menuTable" lay-filter="menuTable"></table>
        <div style="display: none;" id="menuToolBar">
        <button type="button" class="layui-btn layui-btn-sm" lay-event="add">添加菜单</button>
        </div>
        <div id="menuBar" style="display: none;">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </div>
        <!-- 数据表格结束 -->

        <!-- 添加和修改的弹出层开始 -->
        <div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
        <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
        <label class="layui-form-label">父级菜单：</label>
        <div class="layui-input-block">
        <div class="layui-unselect layui-form-select" id="pid_div">
        <div class="layui-select-title">
        <input type="hidden" name="pid" id="pid">
        <input type="text" name="pid_str" id="pid_str" placeholder="请选择" readonly="" class="layui-input layui-unselect">
        <i class="layui-edge"></i>
        </div>
        </div>
        <div class="layui-card select-test" id="menuSelectDiv">
        <div class="layui-card-body">
        <div id="toolbarDiv"><ul id="menuTree" class="dtree" data-id="0" style="width: 100%;"></ul></div>
        </div>
        </div>
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">菜单名称:</label>
        <div class="layui-input-block">
        <input type="hidden" name="id">
        <input type="text" name="title" placeholder="请输入菜单名称" autocomplete="off"
        class="layui-input">
        </div>
        </div>
        <div class="layui-form-item">
        <label class="layui-form-label">菜单地址:</label>
        <div class="layui-input-block">
        <input type="text" name="href" placeholder="请输入菜单地址" autocomplete="off"
        class="layui-input">
        </div>
        </div>
        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">菜单图标:</label>
        <div class="layui-input-inline">
        <input type="text" name="icon" placeholder="请输入菜单图标" lay-verify="required" autocomplete="off"
        class="layui-input">
        </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">TARGET:</label>
        <div class="layui-input-inline">
        <input type="text" name="target" placeholder="请输入TRAGET" autocomplete="off"
        class="layui-input">
        </div>
        </div>
        </div>
        <div class="layui-form-item">
        <div class="layui-inline">
        <label class="layui-form-label">是否展开:</label>
        <div class="layui-input-inline">
        <input type="radio" name="spread" value="1" title="展开">
        <input type="radio" name="spread" value="0" title="不展开" checked="checked">
        </div>
        </div>
        <div class="layui-inline">
        <label class="layui-form-label">是否可用:</label>
        <div class="layui-input-inline">
        <input type="radio" name="available" value="1" checked="checked" title="可用">
        <input type="radio" name="available" value="0" title="不可">
        </div>
        </div>
        </div>
        <div class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
        <button type="button" class="layui-btn layui-btn-sm layui-icon layui-icon-release"
        lay-filter="doSubmit" lay-submit="">保存</button>
        <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
        </div>
        </div>
        </form>

        </div>
        <!-- 添加和修改的弹出层结束 -->
        <script src="../../../../statics/layui/layui.js" charset="utf-8"></script>

        <script>
        var tableIns;
        layui.extend({
        dtree:'../../../../statics/layui_ext/dist/dtree'
        }).use(['jquery','layer','form','table','dtree'], function(){
        var form = layui.form
        ,$=layui.jquery
        ,layer = layui.layer
        ,table = layui.table
        ,dtree = layui.dtree;


        tableIns=table.render({
        elem: '#menuTable'
        ,url:'${requestScope.contextPath}/menu/loadMenuManagerRightListJson'
        ,toolbar: '#menuToolBar'
        ,title: '菜单列表'
        ,height:'full-140'
        ,cellMinWidth:100 //设置列的最小默认宽度
        ,cols: [[
        {type: 'checkbox', fixed: 'left'}
        ,{field:'id', title:'ID', width:80, fixed: 'left',align:'center'}
        ,{field:'pid', title:'父节点', width:80,align:'center'}
        ,{field:'title', title:'菜单名称', width:120,align:'center'}
        ,{field:'href', title:'菜单地址', width:220,align:'center'}
        ,{field:'spread', title:'是否展开', width:100,align:'center', templet: function(res){
        return res.spread==1?'<font color=green>展开</font>':'<font color=red>不展开</font>';
        }}
        ,{field:'target', title:'TARGET', width:100,align:'center'}
        ,{field:'icon', title:'图标', width:100,align:'center',templet:function(res) {
        return '<div class="layui-icon">'+ res.icon +'</div>';
        }}
        ,{field:'available', title:'是否可用',align:'center', width:100, templet: function(res){
        return res.available ==1?'<font color=green>可用</font>':'<font color=red>不可用</font>';
        }}
        ,{fixed: 'right', title:'操作', toolbar: '#menuBar', width:160,align:'center'}
        ]]
        ,page: true
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
        $("#doSearch").on('click',function(){
        var params=$("#searchFrm").serialize();
        tableIns.reload({
        url:"${requestScope.contextPath}/menu/loadMenuManagerRightListJson?"+params,
        page:{curr:1}
        })
        });

        //监听头部工具栏事件
        table.on("toolbar(menuTable)",function(obj){
        switch(obj.event){
        case 'add':
        openAdd();
        break;
        case 'batchDelete':
        layer.msg('批量删除');
        break;
        }
        });

        //打开添加页面
        var mainIndex;
        var url;
        function openAdd(){
        mainIndex =layer.open({
        type: 1,
        area: ['800x', '450px'], //宽高
        content: $("#saveOrUpdateDiv"),
        title: '添加菜单信息',
        success:function(index){
        //清空表单数据
        $("#dataFrm")[0].reset();
        $("#menuSelectDiv").removeClass("layui-show");
        url="${requestScope.contextPath}/menu/addMenu";
        }
        });
        }

        //监听行工具事件
        table.on('tool(menuTable)', function(obj){
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        if(layEvent === 'del'){ //删除
        $.get("${requestScope.contextPath}/menu/checkMenuIsChildren?pid="+data.id,function(obj) {
        if (obj.code >= 0){
        layer.msg("当前菜单含有子菜单，不能删除，请先删除子菜单！");
        }else{
        layer.confirm('确定删除【'+data.title+'】这个菜单吗？', function(index){
        //向服务端发送删除指令
        $.get("${requestScope.contextPath}/menu/deleteMenu?id="+data.id,function(res) {
        layer.msg(res.msg);
        //刷新数据 表格
        tableIns.reload();
        //刷新左边的树
        window.parent.left.reload();
        //刷新添加和修改的下拉树
        dtree.reload(menuTree, {
        url: "${requestScope.contextPath}/menu/loadMenuManagerLeftTreeJson",
        initLevel: 2,
        icon: 3
        });
        })
        });
        }
        });
        } else if(layEvent === 'edit'){ //编辑
        //打开修改页面
        openUpdateMenu(data);
        }
        });

        //打开修改页面
        function openUpdateMenu(data){
        mainIndex=layer.open({
        type:1,
        title:'修改菜单信息',
        content:$("#saveOrUpdateDiv"),
        area:['800px','450px'],
        success:function(index){
        form.val("dataFrm",data);
        url="${requestScope.contextPath}/menu/updateMenu";
        //反选下拉树
        var pid = data.pid;
        var params = dtree.dataInit("menuTree", pid); // 初始化值
        //移除打开的样式
        $("#menuSelectDiv").removeClass("layui-show");
        //给下拉框的text框赋值
        $("#pid_str").val(params.context);
        }
        });
        }

        //初始化添加和修改页面的下拉树
        var menuTree = dtree.render({
        elem: "#menuTree",
        dataStyle: "layuiStyle", //使用layui风格的数据格式
        response:{message:"msg",statusCode:0}, //修改response中返回数据的定义
        dataFormat: "list", //配置data的风格为list
        url: "${requestScope.contextPath}/menu/loadMenuManagerLeftTreeJson", // 使用url加载（可与data加载同时存在）
        icon: "2",
        accordion:true
        });
        $("#pid_div").on("click",function(){
        $(this).toggleClass("layui-form-selected");
        $("#menuSelectDiv").toggleClass("layui-show layui-anim layui-anim-upbit");
        });
        dtree.on("node(menuTree)", function(obj){
        $("#pid_str").val(obj.param.context);
        $("#pid").val(obj.param.nodeId);
        $("#pid_div").toggleClass("layui-form-selected");
        $("#menuSelectDiv").toggleClass("layui-show layui-anim layui-anim-upbit");
        });

        //保存
        form.on("submit(doSubmit)",function(obj){
        //序列化表单数据
        var params=$("#dataFrm").serialize();
        $.post(url,params,function(obj){
        layer.msg(obj.msg);
        //关闭弹出层
        layer.close(mainIndex)
        //刷新数据 表格
        tableIns.reload();
        //刷新左边的树
        window.parent.left.reload();
        //刷新添加和修改的下拉树
        dtree.reload(menuTree, {
        url: "${requestScope.contextPath}/menu/loadMenuManagerLeftTreeJson",
        initLevel: 2,
        icon: 3
        });
        })
        });
        });

        function reloadTable(id){
        tableIns.reload({
        url:"${requestScope.contextPath}/menu/loadMenuManagerLeftTreeJson?id="+id
        })
        }
        </script>


        </body>
        </html>

