package com.test.validator;

import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

public class ValidValidator implements Validator {

	@Override
	public void validate(FacesContext arg0, UIComponent arg1, Object obj) throws ValidatorException {
		// TODO Auto-generated method stub
		String vadstr=(String)obj;
		Object sessionAttribute = null;
		FacesContext facesContext = FacesContext.getCurrentInstance();
		ExternalContext externalContext = facesContext.getExternalContext();
		Map sessionMap = externalContext.getSessionMap();
		if (sessionMap!=null){
		sessionAttribute = sessionMap.get("vCode");
			}
	
			if(!vadstr.equals(sessionAttribute)){
				FacesMessage messages=new FacesMessage(FacesMessage.SEVERITY_ERROR,"验证码输入有误","验证码输入有误");
						throw new ValidatorException(messages);
			}
	
	}

}
