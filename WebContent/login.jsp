<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
    <%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录界面</title>
</head>
<body>
<f:view>
<center>
<h3>用户登录</h3>
<h:form>
<h:panelGrid columns="4">
<h:outputText value="#{user.loginMsg }" style="color:red"/>
</h:panelGrid>
<h:panelGrid columns="4">
登录账号：<h:inputText value="#{user.account }"></h:inputText>
</h:panelGrid>
<h:panelGrid columns="4">
登录账号：<h:inputText value="#{user.password }"></h:inputText>
</h:panelGrid>
<h:commandButton value="登录" action="#{user.login }"></h:commandButton>&nbsp;&nbsp;
<h:commandButton value="注册" action="regedit"></h:commandButton>
</h:form>
</center>
</f:view>
</body>
</html>