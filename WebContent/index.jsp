<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
    <%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录成功界面</title>
<script type="text/javascript">
function updateUser(id){
	alert(id);
}

</script>
</head>
<body>
<center>
<f:view>
<h:panelGrid columns="4">
<h:outputText value="欢迎回来:"></h:outputText>
<h:outputText value="#{user.name }" style="color:blue"/>
</h:panelGrid>
<br>
<h:form>
<h:dataTable value="#{user.getUserList() }" var="u" bgcolor="lightblue"   border="1" cellpadding="5" cellspacing="2">
<h:column>
<f:facet name="header">
<h:outputText value="ID"/>
</f:facet>
<h:outputText value="#{u.id }"/>
</h:column>

<h:column>
<f:facet name="header">
<h:outputText value="NAME"/>
</f:facet>
<h:outputText value="#{u.name }"/>
</h:column>

<h:column>
<f:facet name="header">
<h:outputText value="SEX"/>
</f:facet>
<h:outputText value="#{u.sex }"/>
</h:column>

<h:column>
<f:facet name="header">
<h:outputText value="BIRTH"/>
</f:facet>
<h:outputText value="#{u.birth }"/>
</h:column>

<h:column>
<f:facet name="header">
<h:outputText value="ADDRESS"/>
</f:facet>
<h:outputText value="#{u.address }"/>
</h:column>

<h:column>
<f:facet name="header">
<h:outputText value="OPTION"/>
</f:facet>
<h:commandLink value="修改"  action="#{user.getValueById(u.id) }"/>&nbsp;
<h:commandLink value="删除" action="#{user.delUser(u.id) }" onclick="if(!confirm('您确定要删除这条数据吗？')) return false"/>
</h:column>

</h:dataTable>


</h:form>
</f:view>
</center>
</body>
</html>