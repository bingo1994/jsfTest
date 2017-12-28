package com.test.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.component.html.HtmlInputSecret;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;


public class PassValidator implements Validator {

	@Override
	public void validate(FacesContext context, UIComponent componentToValidate, Object obj) throws ValidatorException {
		// TODO Auto-generated method stub
		String repass=(String)obj;
		
		//获取前台表单控件的值
		String pass=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("form:pass");
		//取得密码组件
		/*UIComponent component = null;
		for(UIComponent ui : componentToValidate.getParent().getChildren()){
			if("pass".equals(ui.getId())){
				component = ui;
				break;
				}
		}
		 FacesContext context = FacesContext.getCurrentInstance(); 
		 UIComponent inputtextValue = context.getViewRoot().findComponent("pass"); 
		//转换类型
		HtmlInputSecret htmlInputSecret = (HtmlInputSecret)component;*/
		//比对密码是否一致
		if (!repass.equals(pass) ){
			FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_ERROR,"两次输入密码不一致","两次输入密码不一致");
			throw new ValidatorException(messages);
			}
	}

}
