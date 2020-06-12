    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="utf-8">
        <title>菜单管理</title>
        </head>
        <%--  如果使用frameset的包含页面 主页面不能含有body   --%>
        <frameset cols="260,*" border="1">
        <frame src="${requestScope.contextPath}/sys/toMenuLeftTree" name="left">
        <frame src="${requestScope.contextPath}/sys/toMenuRightList" name="right">
        </frameset>
        </html>
