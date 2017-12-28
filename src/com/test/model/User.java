package com.test.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Vector;

import javax.faces.context.FacesContext;
import javax.faces.event.ValueChangeEvent;
import javax.faces.model.SelectItem;

public class User {
	private String msg;
	private int id;
	private String account;
	private String password;
	private String repass;
	private String name;
	private String sex="男";
	private String birth;
	private String education="高中";
	private String address;//拼接后字符串
	private String yourself;
	private String valid;
	private String email;
	private String []habby=new String [3];
	private String strHabby;//拼接后字符串
	private String loginMsg;
	private Connection connection;
	private String upMsg="";
	
	public String getUpMsg() {
		return upMsg;
	}
	public void setUpMsg(String upMsg) {
		this.upMsg = upMsg;
	}
	public String getLoginMsg() {
		return loginMsg;
	}
	public void setLoginMsg(String loginMsg) {
		this.loginMsg = loginMsg;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStrHabby() {
		return strHabby;
	}
	public void setStrHabby(String strHabby) {
		this.strHabby = strHabby;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String[] getHabby() {
		return habby;
	}
	public void setHabby(String[] habby) {
		this.habby = habby;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRepass() {
		return repass;
	}
	public void setRepass(String repass) {
		this.repass = repass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	
	public String getYourself() {
		return yourself;
	}
	public void setYourself(String yourself) {
		this.yourself = yourself;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	
//二级联动
	public List<SelectItem> LMList = new LinkedList<SelectItem>();;

    public Vector<List<SelectItem>> MCList = new Vector<List<SelectItem>>();

    public List<SelectItem> currentMCList = new LinkedList<SelectItem>();

    public String selectedOne = new String();

    public String selectedTwo = new String();

    //INI---------------------------------------------------------------------- 
    public User() throws Exception {

        LMList.add(new SelectItem("0_0", "请选择"));
        LMList.add(new SelectItem("A_1", "北京"));
        LMList.add(new SelectItem("B_2", "上海"));
        LMList.add(new SelectItem("C_3", "安徽"));

        List<SelectItem> list0 = new LinkedList<SelectItem>();
        List<SelectItem> list1 = new LinkedList<SelectItem>();
        List<SelectItem> list2 = new LinkedList<SelectItem>();
        List<SelectItem> list3 = new LinkedList<SelectItem>();

        list0.add(new SelectItem("请选择", "请选择"));

        list1.add(new SelectItem("东城", "东城"));
        list1.add(new SelectItem("西城", "西城"));
        list1.add(new SelectItem("朝阳", "朝阳"));
        list1.add(new SelectItem("其他", "其他"));

        list2.add(new SelectItem("黄埔", "黄埔"));
        list2.add(new SelectItem("徐汇", "徐汇"));
        list2.add(new SelectItem("浦东", "浦东"));
        list2.add(new SelectItem("其他", "其他"));

        list3.add(new SelectItem("合肥", "合肥"));
        list3.add(new SelectItem("六安", "六安"));
        list3.add(new SelectItem("宣城", "宣城"));
        list3.add(new SelectItem("其他", "其他"));

        MCList.add(list0);
        MCList.add(list1);
        MCList.add(list2);
        MCList.add(list3);
    }

    public void selectedOneChange(ValueChangeEvent event) {
        //valueChangeEvent of the first SelectOneMeun
        //The action is about INI the list for the second SelectOneMeun
        String str = (String) event.getNewValue();
        //Like you see, in the first SelectItems we hava "A_1"
        String[] ss = str.split("_");
        //After this we got the index of the "A_1" and the index is "1"
        str = ss[1];
        int index = Integer.parseInt(str);
        currentMCList = MCList.get(index);
    }

    public List<SelectItem> getLMList() {
        return LMList;
    }

    public void setLMList(List<SelectItem> list) {
        LMList = list;
    }

    public String getSelectedOne() {
        return selectedOne;
    }

    public void setSelectedOne(String selectedOne) {
        this.selectedOne = selectedOne;
    }

    public String getSelectedTwo() {
        return selectedTwo;
    }

    public void setSelectedTwo(String selectedTwo) {
        this.selectedTwo = selectedTwo;
    }

    public List<SelectItem> getCurrentMCList() {
        return currentMCList;
    }

    public void setCurrentMCList(List<SelectItem> currentMCList) {
        this.currentMCList = currentMCList;
    } 

    
    /**
     * 获取数据库连接
     * @return
     */
    public Connection getConnection(){
    	try {
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsfdemo", "root","1111");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return connection;
    }
    
    /**
     * 登录
     * @return
     */
    public String login(){
    	User user=getUserByAccount(account);
    	if(user.getAccount()!=null){
    		if(this.account.equals(user.getAccount())&&this.password.equals(user.getPassword())){
    			this.name=user.getName();
    			return "logSuccess";
    		}else{
    			this.loginMsg="输入密码有误";
    			return "logFail";
    		}
    	}else{
    		this.loginMsg="此账号不存在";
    		return "logFail";
    	}
    }
    
    
    /**
     * 启动唯一验证
     * @return
     */
    public void AuthAccount(){
    	String content=FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap().get("form:account");
    	 getUserByAccount(content);
    }
    /**
     * 验证账号是否唯一
     * @param at
     * @return
     */
    public User getUserByAccount(String at){
    	connection=getConnection();
    	PreparedStatement pst=null;
    	String sql ="select * from tb_user where account=?";
    	ResultSet rs=null;
    	User user=null;
    	try {
    		user=new User();
			pst=connection.prepareStatement(sql);
			pst.setString(1, at);
			rs=pst.executeQuery();
			if(rs.next()){
				user.setAccount(rs.getString("account"));
				user.setPassword(rs.getString("password"));
				user.setName(rs.getString("name"));
				msg="此账号已存在";
			}else{
				msg="账号可用";
			}
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return user;
    }
    
    /**
     * 注册
     * @return
     */
    public String regAccount(){
    	String str=null;
    	if(this.habby.length>1){
    		int x=1;
    		for(String s:habby){
    			if(x==1){
    			str=s;	
    			}else{
    			str=s+","+str;
    			}
    			x++;
    		}
    		this.strHabby=str;
    	}
    	if(habby.length==1){
    		strHabby=habby[0];
    	};
    	String[] ss = this.selectedOne.split("_");
    	 str = ss[1];
         int index = Integer.parseInt(str);
         if(index==1){
        	 this.address="北京"+"-"+this.selectedTwo;
         }else if(index==2){
        	 this.address="上海"+"-"+this.selectedTwo;
         }else if(index==3){
        	 this.address="安徽"+"-"+this.selectedTwo;
         }else{
        	 this.address="其他"+"-"+this.selectedTwo;
         }
    	
    	connection=getConnection();
    	//%Y~%m~%d %k.%i.%s
    	String sql="insert into tb_user(account,password,name,sex,birth,education,address,yourself,email,strHabby) value(?,?,?,?,str_to_date(?,'%Y-%m-%d'),?,?,?,?,?)";
    	PreparedStatement pst=null;
    	int i=0;
    	try {
			pst=connection.prepareStatement(sql);
			pst.setString(1, account);
			pst.setString(2, password);
			pst.setString(3, name);
			pst.setString(4, sex);
			pst.setString(5, birth);
			pst.setString(6, education);
			pst.setString(7, address);
			pst.setString(8, yourself);
			pst.setString(9, email);
			pst.setString(10, strHabby);
			i=pst.executeUpdate();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	if(i>0){
    		return "login";
    	}else{
    		return "regedit";
    	}
    }
    
    /**
     * 查询所有
     * @return
     */
   public List<User> getUserList(){
	   List<User>ulist=new ArrayList<User>();
	   connection =getConnection();
	   PreparedStatement pst=null;
	   ResultSet rs=null;
	   String sql ="select * from tb_user";
	   SimpleDateFormat spt=new SimpleDateFormat("yyyy-MM-dd");
	   try {
		pst=connection.prepareStatement(sql);
		rs=pst.executeQuery();
		while(rs.next()){
			User user=new User();
			user.setAccount(rs.getString("account"));
			user.setPassword(rs.getString("password"));
			user.setName(rs.getString("name"));
			user.setSex(rs.getString("sex"));
			user.setStrHabby(rs.getString("strHabby"));
			user.setAddress(rs.getString("address"));
			user.setEmail(rs.getString("email"));
			user.setId(rs.getInt("id"));
			user.setBirth(spt.format(rs.getDate("birth")));
			ulist.add(user);
		}
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return ulist;
   }
   
   /**
    * 根据id删除数据
    * @param id
    */
   public void delUser(int id){
	  connection =getConnection();
	  PreparedStatement pst=null;
	  String sql ="delete from tb_user where id=?";
	  try {
		pst=connection.prepareStatement(sql);
		pst.setInt(1, id);
		pst.executeUpdate();
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
   /**
    * 修改前步，数据回写
    * @param id
    */
   public String  getValueById(int ids){
	   this.id=ids;
	   connection=getConnection();
	   PreparedStatement pst=null;
	   ResultSet rs=null;
	   SimpleDateFormat spt=new SimpleDateFormat("yyyy-MM-dd");
	   String sql ="select * from tb_user where id =?";
	   try {
		pst=connection.prepareStatement(sql);
		pst.setInt(1, ids);
		rs=pst.executeQuery();
		if(rs.next()){
			id=rs.getInt("id");
			this.name=rs.getString("name");
			this.account=rs.getString("account");
			this.password=rs.getString("password");
			birth=spt.format(rs.getDate("birth"));
			address=rs.getString("address");
			if(address!=null&&!address.equals("")){
				String adds[]=address.split("-");
				this.selectedOne=adds[0];
				this.selectedTwo=adds[1];
			}
			sex=rs.getString("sex");
			this.education=rs.getString("education");
			this.email=rs.getString("email");
			this.strHabby=rs.getString("strHabby");
			if(strHabby!=null&&!strHabby.equals("")){
				String strs[]=strHabby.split(",");
				for(int i=0;i<strs.length;i++){
					habby[i]=strs[i];
				}
			}
			this.yourself=rs.getString("yourself");
			
		}
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   return "update";
   }
   
   /**
    * 修改信息
    * @return
    */
   public String updates(){
	   String str=null;
   	if(this.habby.length>1){
   		int x=1;
   		for(String s:habby){
   			if(x==1){
   			str=s;	
   			}else{
   			str=s+","+str;
   			}
  			x++;
  		}
   		this.strHabby=str;
   	}
   		if(habby.length==1){
   		strHabby=habby[0];
   		};
	   
	   int i=0;
	   connection=getConnection();
	   PreparedStatement pst=null;
	   String sql ="update tb_user set name=?,password=?,education=?,email=?,yourself=?,strHabby=? where id=?";
	   try {
		pst=connection.prepareStatement(sql);
		pst.setString(1, name);
		pst.setString(2, password);
		pst.setString(3, education);
		pst.setString(4, email);
		pst.setString(5, yourself);
		pst.setString(6, strHabby);
		pst.setInt(7, id);
		i=pst.executeUpdate();
		connection.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   if(i>0){
		   upMsg="修改成功!";
		   //return "upSuccess";
		   return getValueById(id);
	   }else{
		   upMsg="修改失败!";
		   return getValueById(id);
	   }
   }
}
