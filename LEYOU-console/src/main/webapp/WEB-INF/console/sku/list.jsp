<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>babasport-list</title>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 库存管理 - 列表</div>
	<div class="clear"></div>
</div>
<div class="body-box">
<form method="post" id="tableForm">
<table cellspacing="1" cellpadding="0" border="0" width="100%" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品颜色</th>
			<th>商品尺码</th>
			<th>市场价格</th>
			<th>销售价格</th>
			<th>库       存</th>
			<th>购买限制</th>
			<th>运       费</th>
			<th>是否赠品</th>
			<th>操       作</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">

			<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
				<td><input type="checkbox" name="ids" value="73"/></td>
				<td>20141028114308048</td>
				<td align="center">西瓜红</td>
				<td align="center">S</td>
				<td align="center"><input type="text" id="m52" value="0.0" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="p52" value="0.0" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="i52" value="0" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="l52" value="0" disabled="disabled" size="10"/></td>
				<td align="center"><input type="text" id="f52" value="10.0" disabled="disabled" size="10"/></td>
				<td align="center">不是</td>
				<td align="center"><a href="javascript:updateSku(52)" class="pn-opt">修改</a> | <a href="javascript:addSku(52)" class="pn-opt">保存</a></td>
			</tr>

	</tbody>
</table>
</form>
</div>
</body>
</html>