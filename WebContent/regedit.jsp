<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
    <%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
    <%@ taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="a4j" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册界面</title>
<script type="text/javascript" src="My97DatePicker/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function changeCode(){
    $("code").src = "ValidateCodeServlet?a="+new Date();
}
</script>
</head>
<body>
<f:view>
<center>
<h3>用户注册</h3>
<h:form id="form">
<a4j:region>

<h:panelGrid columns="4">
登录账号:
<h:inputText immediate="true" valueChangeListener="#{user.AuthAccount }" id="account" value="#{user.account }" required="true" requiredMessage="必填">
<a4j:support  event="onblur" reRender="result"></a4j:support>
</h:inputText>
<h:message for="account" style="color:red"/>
<h:outputText id="result" value="#{user.msg }" style="color:red"></h:outputText>
</h:panelGrid>

<h:panelGrid columns="4">
密码：
<h:inputSecret  id="pass"  value="#{user.password }" required="true" requiredMessage="必填" validatorMessage="密码必须由字母或数字组成的6-8位数组成">
<f:validateRegex pattern="^[a-zA-Z0-9]{6,8}$"/>
</h:inputSecret>
<h:message for="pass" style="color:red"/>
</h:panelGrid>

<h:panelGrid columns="6">
确认密码：<h:inputSecret  id="repass" value="#{user.repass }" required="true" requiredMessage="必填">
<f:validator validatorId="repassValid"/></h:inputSecret>
<h:message id="repasswordMsg" for="repass" style="color:red">

</h:message>
</h:panelGrid>

<h:panelGrid columns="4">
姓名：<h:inputText required="true" id="name" value="#{user.name }" requiredMessage="必填"></h:inputText>
<h:message for="name" style="color:red"></h:message>
</h:panelGrid>

<h:panelGrid columns="4">
性别：<h:selectOneRadio value="#{user.sex }">
<f:selectItem itemValue="男" itemLabel="男"/><f:selectItem itemValue="女" itemLabel="女"/>
</h:selectOneRadio> 
</h:panelGrid>

<h:panelGrid columns="4" >
出生日期：<h:inputText required="true" requiredMessage="必填"  id="birth" value="#{user.birth }" onclick="WdatePicker()" >


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
 				<h:selectOneMenu value="#{user.selectedOne}"
                    valueChangeListener="#{user.selectedOneChange}" immediate="true">
                    <f:selectItems value="#{user.LMList}" />
                     <a4j:support event="onchange" reRender="selid" immediate="true"/>
                </h:selectOneMenu>
                <a4j:outputPanel>
                <h:selectOneMenu id="selid" value="#{user.selectedTwo}">
                    <f:selectItems value="#{user.currentMCList}" />
                </h:selectOneMenu>
                </a4j:outputPanel>
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

<h:panelGrid columns="5">
验证码：<h:inputText id="valid" value="#{user.valid }" required="true" requiredMessage="必填">
<f:validator validatorId="ValidValidator"/>
</h:inputText>
<h:message for="valid" style="color:red"></h:message>

		 <h:graphicImage value="ValidateCodeServlet"/>
	 <h:commandLink id="bid"  immediate="true" onclick="changeCode()">换一张
	 </h:commandLink>
</h:panelGrid>
<h:panelGrid columns="4">
	<h:commandButton  value="注册" action="#{user.regAccount }"></h:commandButton>
	&nbsp;&nbsp;
	<h:commandButton  value="返回" action="login" immediate="true"></h:commandButton>
</h:panelGrid>

</a4j:region>
</h:form>
</center>
</f:view>
</body>
</html>