<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css"
	type="text.css">

<script type="text/javascript">
	function validation() {

		var frm = document.forms[0];

		if (frm.subject.value == "") {
			alert("������ �Է����ּ���.");
			return false;
		}

		else if (frm.name.value == "") {
			alert("�̸��� �Է����ּ���.");
			return false;
		}

		else if (frm.password.value == "") {
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}

		else if (frm.content.value == "") {
			alert("������ �Է����ּ���.");
			return false;
		}
		return true;
	}
	
	${document}.ready(function(){
		$("#content").cleditor();
	});
	
</script>
</head>
<body>
	<table width=600 border=0 cellspacing=0 cellpadding=2>
		<tr>
			<td align=center><h2>��Ʈ����2 �Խ���</h2></td>
		</tr>
	</table>

	<s:if test="reply">
		<form action="replyAction.action" method=post
			enctype="multipart.form-data" ansubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_step" value="%{resultClass.re_Step}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
	</s:if>

	<s:elseif test="resultClass==NULL">
		<form action="writeAction.action" method=post
			enctype="multipart/form-data" onsubmit="return validation();">
	</s:elseif>

	<s:else>
		<form action="modifyAction.action" method="post"
			enctype="multipart/form-data">
			<s:hidden name="no" value="%{resultClass.no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.file_savname)" />
	</s:else>

	<table width=600 border=0 cellspacing=0 cellpadding=0>
		<tr>
			<td align=right colspan=2><font color="#FF0000">*</font>�� �ʼ�
				�Է»����Դϴ�.</td>
		</tr>

		<tr bgcolor="#777777">
			<td height=1 colspan=2></td>
		</tr>

		<tr>
			<td width=100 bgcolor="#F4F4F4"><font color="#FF0000">*</font>����</td>
			<td width=500 bgcolor="#FFFFFF"><s:textfield name="subject"
					theme="simple" value="%{resultClass.subject}"
					cssStyle="width:370px" maxlength="50" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height=1 colspan=2></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font>�̸�</td>
			<td bgcolor="#FFFFFF"><s:textfield name="name" theme="simple"
					value="%{resultClass.name}" cssStyle="width:100px" maxlength="20" />
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ��й�ȣ</td>
			<td bgcolor="#FFFFFF"><s:textfield name="password"
					theme="simple" value="%{resultClass.password}"
					cssStyle="width:100px" maxlength="20" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ����</td>
			<td bgcolor="#FFFFFF"><s:textarea name="content" theme="simple"
					value="%{resultClass.content}" cols="50" rows="10" /></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">÷������</td>
			<td bgcolor="#FFFFFF"><s:file name="upload" theme="simple" /> <s:if
					test="resultClass.file_orgname != NULL">&nbsp; * 
		<s:property value="resultClass.file_orgname" />������ ��ϵǾ� �ֽ��ϴ�. �ٽþ��ε��ϸ� ������ ������ �����˴ϴ�.
		</s:if></td>
		</tr>

		<tr bgcolor="#777777">
			<td height=1 colspan=2></td>
		</tr>

		<tr>
			<td height=10 colspan=2></td>
		</tr>

		<tr>
			<td align=right colspan=2><input name=submit type=submit
				value="�ۼ��Ϸ�" class="inputb"> <input name="list" type=button
				value="���" class="inputb"
				onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage"/>'">
			</td>
		</tr>

	</table>
	</form>
</body>
</html>












































