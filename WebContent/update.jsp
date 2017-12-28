<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
    <%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
    <%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="My97DatePicker/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
</head>
<body>

<f:view>
<h:form id="form">
<center>
<h3>信息修改</h3>
<h:panelGrid columns="4">
<h:outputText value="#{user.upMsg }" style="color:red"/>
</h:panelGrid>

<h:panelGrid columns="4">
id:<h:inputText    value="#{user.id }" disabled="true"/>
</h:panelGrid>
<h:panelGrid columns="4">
登录账号:
<h:inputText immediate="true"  id="account" value="#{user.account }" disabled="true"/>

</h:panelGrid>

<h:panelGrid columns="4">
密码：
<h:inputText  id="pass"  value="#{user.password }" required="true" requiredMessage="必填" validatorMessage="密码必须由字母或数字组成的6-8位数组成">
<f:validateRegex pattern="^[a-zA-Z0-9]{6,8}$"/>
</h:inputText>
<h:message for="pass" style="color:red"/>
</h:panelGrid>


<h:panelGrid columns="4">
姓名：<h:inputText required="true" id="name" value="#{user.name }" requiredMessage="必填"></h:inputText>
<h:message for="name" style="color:red"></h:message>
</h:panelGrid>

<h:panelGrid columns="4">
性别：<h:selectOneRadio value="#{user.sex }" disabled="true">
<f:selectItem itemValue="男" itemLabel="男"/><f:selectItem itemValue="女" itemLabel="女"/>
</h:selectOneRadio> 
</h:panelGrid>

<h:panelGrid columns="4" >
出生日期：<h:inputText required="true" disabled="true" requiredMessage="必填"  id="birth" value="#{user.birth }" onclick="WdatePicker()" >


</h:inputText>
<h:message for="birth" style="color:red"/>
</h:panelGrid>

<h:panelGrid columns="4">
学历：<h:selectOneMenu value="#{user.education }">
<f:selectItem itemValue="小学" itemLabel="小学"/>
<f:selectItem itemValue="初中" itemLabel="初中"/>
<f:selectItem itemValue="高中" itemLabel="高中"/>
<f:selectItem itemValue="大学" itemLabel="大学"/>
</h:selectOneMenu>
</h:panelGrid>

<h:panelGrid columns="4" >
邮箱：<h:inputText required="true" requiredMessage="必填" id="email" value="#{user.email }" validatorMessage="邮箱格式有误">
<f:validateRegex pattern="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+"/>
</h:inputText>
<h:message for="email" style="color:red"></h:message>
</h:panelGrid>

<h:panelGrid columns="4">
地址：
 				<h:selectOneMenu value="#{user.selectedOne}" disabled="true">
                    <f:selectItem itemLabel="北京" itemValue="北京"/>
                    <f:selectItem itemLabel="上海" itemValue="上海"/>
                    <f:selectItem itemLabel="安徽" itemValue="安徽"/>
                </h:selectOneMenu>
                <h:selectOneMenu id="selid" value="#{user.selectedTwo}" disabled="true">
               		<f:selectItem itemLabel="东城" itemValue="东城"/>
                    <f:selectItem itemLabel="西城" itemValue="西城"/>
                    <f:selectItem itemLabel="朝阳" itemValue="朝阳"/>
                    <f:selectItem itemLabel="黄埔" itemValue="黄埔"/>
                    <f:selectItem itemLabel="徐汇" itemValue="徐汇"/>
                    <f:selectItem itemLabel="浦东" itemValue="浦东"/>
                    <f:selectItem itemLabel="合肥" itemValue="合肥"/>
                    <f:selectItem itemLabel="六安" itemValue="六安"/>
                    <f:selectItem itemLabel="宣城" itemValue="宣城"/>
                    <f:selectItem itemLabel="其他" itemValue="其他"/>
                </h:selectOneMenu>
</h:panelGrid>
<h:panelGrid columns="4">

爱好：<h:selectManyCheckbox value="#{user.habby }" id="habbys">
<f:selectItem itemValue="篮球" itemLabel="篮球"/>
<f:selectItem itemValue="羽毛球" itemLabel="羽毛球"/>
<f:selectItem itemValue="乒乓球" itemLabel="乒乓球"/>
</h:selectManyCheckbox>

</h:panelGrid>
<h:panelGrid columns="4">
自我评价：<h:inputTextarea required="true" requiredMessage="必填" cols="12" id="yourself" rows="2" value="#{user.yourself }"></h:inputTextarea>
<h:message for="yourself" style="color:red"></h:message>
</h:panelGrid>

<h:panelGrid columns="4">
	<h:commandButton action="#{user.updates }" value="修改" />
	&nbsp;&nbsp;
	<h:commandButton action="upSuccess" value="返回"/>
</h:panelGrid>
</center>
</h:form>
</f:view>
</body>
</html>