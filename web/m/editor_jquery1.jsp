<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="kr.pe.okjsp.util.CommonUtil"%>
<jsp:useBean id="member" class="kr.pe.okjsp.member.Member" scope="session"/>

<%
	String bbs = CommonUtil.nchk(request.getParameter("bbs"), "perf");

	//if(member.getSid() == 0) {
	//	response.sendRedirect("https://www.okjsp.pe.kr/jsp/member/loginMobile.jsp?returnPath=/m/editor.jsp?bbs=" + bbs);
	//	return; 
	//}
	
	member.setId("bluepoet");
	member.setSid(3146);
%>
<html>
<head>
<META HTTP-EQUIV="Content-type" CONTENT="text/html;charset=ksc5601">

<!-- ############ ����ó��(prototype ���)  ########### -->
<script type="text/javascript" src="/m/js/prototype-1.6.0.2.js"></script>
<script language="javascript">

//1. AJAX ȣ��(���� �ߺ����̵� üũ)
function writeProc()
{
	alert('1111');
	var form = document.form;
	var url = "writeProc.jsp";
	var pars = "writer="+form.writer.value+"&bbs="+form.bbs.value+"&content="+form.content.value+"&subject="+form.subject.value+"&homepage="+form.homepage.value+"&password="+form.password.value+"&ccl_id="+form.ccl_id.value;
	var ajaxObj = new Ajax.Request(
			url,
			{
			method: 'GET', 			
			parameters: pars,					 				    
			onComplete: goList
		});

	return false;
}		

//2. AJAX ����� �ޱ�(����Ÿ�� �������� �ޱ�)
function goList(responseHttpObj)
{					
	var returnData = eval("(" + responseHttpObj.responseText+ ")");					
	var result = returnData.data.result;
	
	if(result != 0)
	{
		alert('����� �ԷµǾ����ϴ�.');		
	}	
}
</script>
</head>
<!-- ############ �۾���_start ########### -->
<body>
    <div title="�۾���">
    	<!-- target="_self"�����ؼ� ȭ�� ������ ���� �ذ� -->
    	<!-- iui.js���� ���� -->
    	<fieldset>
	    <form name="form" action="javascript:history.back();" onsubmit="return writeProc()" method="post" class="panel"  selected="true" target="_self">
	    
	        <div class="row">
	            <label>bbs</label>
	            <select name="bbs" id="bbs" style="font-size:20px;font-family:Arial;width:200px">
					<jsp:include page="/jsp/option.jsp"></jsp:include>
				</select>
				<script type="text/javascript">
					document.getElementById('bbs').value = '<%= bbs %>';
				</script>
	        </div>
	        <div class="row">
	            <label>Writer</label>
	            <input type="text" name="writer" id="writer" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>homepage</label>
	            <input type="text" name="homepage" id="homepage" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>password</label>
	            <input type="password" name="password"  id="password" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>CCL</label>
	            <select name="ccl_id" id="ccl_id" style="font-size:20px;font-family:Arial;width:200px">
					<option value="0">Copyright-�����ڿ��� ���۱�</option>
					<option value="1">CCL-������ǥ��</option>
					<option value="2">CCL-������ǥ��-�������Ǻ������</option>
					<option value="3">CCL-������ǥ��-�������</option>
					<option value="4">CCL-������ǥ��-�񿵸�</option>
					<option value="5">CCL-������ǥ��-�񿵸�-�������Ǻ������</option>
					<option value="6">CCL-������ǥ��-�񿵸�-�������</option>
				</select>
	        </div>
	        <div class="row">
	            <label>Subject</label>
	            <input type="text" name="subject" id="subject" style="font-size:20px;font-family:Arial"/>
	        </div>
	        <div class="row">
	            <label>Content</label>
	            <!-- msgbackup:��� ���� ��... -->
	            <input type="hidden" name="msgbackup" id="msgbackup">
	            <textarea name="content" id="content" style="font-size:20px;font-family:Arial;width:320px"></textarea>
	        </div>
	    	<div class="row"><br/>
	    		<input type="submit" value="����"><br/-->							
	    	</div>
	    </form>
	    </fieldset>
    </div>
</body>
<!-- ############ �۾���_end ########### -->
</html>
