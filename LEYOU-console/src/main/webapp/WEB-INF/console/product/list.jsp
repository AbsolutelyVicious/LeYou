<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>babasport-list</title>
<script type="text/javascript">
//上架
function isShow(flat){
	//请至少选择一个
	var size = $("input[name='ids']:checked").size();
	if(size == 0){
		alert("请至少选择一个");
		return;
	}
	//你确定删除吗
	if(!confirm("你确定操作吗")){
		return;
	}
	//提交 Form表单
	$("#jvForm").attr("action","/console/product/isShow.do?isShow="+flat);
	$("#jvForm").attr("method","post");
	$("#jvForm").submit();
	
}
function optDelete() {

    //请至少选择一个
    var size = $("input[name='ids']:checked").size();
    if(size == 0){
        alert("请至少选择一个");
        return;
    }
    //你确定删除吗
    if(!confirm("你确定删除吗")){
        return;
    }
    //提交 Form表单
    $("#jvForm").attr("action","/console/product/toDelete.do");
    $("#jvForm").attr("method","post");
    $("#jvForm").submit();
	
}
</script>
</head>
<body>
<div class="box-positon">
	<div class="rpos">当前位置: 商品管理 - 列表</div>
	<form class="ropt">
		<input class="add" type="button" value="添加" onclick="window.location.href='add.do'"/>
	</form>
	<div class="clear"></div>
</div>
<div class="body-box">

<form action="/console/product/list.do" method="post" style="padding-top:5px;">
名称: <input type="text" name="name" value="${product.name}"/>
	<select name="brandId">

        <c:if test="${product.name==null}">
            <option value="">请选择品牌</option>
        </c:if>
        <c:if test="${product!=null}">
            <option value="">${product.brandId}</option>
        </c:if>
        <c:forEach items="${products}" var="brandId">
            <option value="${brandId}">${brandId}</option>
        </c:forEach>

	</select>
	<select name="isShow">
		<option value="1">上架</option>
		<option selected="selected" value="0">下架</option>
	</select>
	<input type="submit" class="query" value="查询"/>
</form>

<form id="jvForm">
<table cellspacing="1" cellpadding="0" width="100%" border="0" class="pn-ltable">
	<thead class="pn-lthead">
		<tr>
			<th width="20"><input type="checkbox" onclick="Pn.checkbox('ids',this.checked)"/></th>
			<th>商品编号</th>
			<th>商品名称</th>
			<th>图片</th>
			<th width="4%">新品</th>
			<th width="4%">热卖</th>
			<th width="4%">推荐</th>
			<th width="4%">上下架</th>
			<th width="12%">操作选项</th>
		</tr>
	</thead>
	<tbody class="pn-ltbody">
	<c:forEach items="${productsList.result}" var="product">
		<tr bgcolor="#ffffff" onmouseover="this.bgColor='#eeeeee'" onmouseout="this.bgColor='#ffffff'">
			<td align="center"><input type="checkbox" name="ids" value="${product.id}"/></td>
			<td>&nbsp;&nbsp;${product.id}</td>
			<td align="center">${product.name}</td>
            <td align="center">
			<c:forTokens items="${product.imgUrl}" delims="," var="imgUrl">
			<img width="50" height="50" src="${imgUrl}"/>
			</c:forTokens>
            </td>
			<td align="center">
				<c:if test="${product.isNew==0}">否</c:if>
				<c:if test="${product.isNew==1}">是</c:if>
			</td>
			<td align="center">
				<c:if test="${product.isHot==0}">否</c:if>
				<c:if test="${product.isHot==1}">是</c:if>
			</td>
			<td align="center">
				<c:if test="${product.isCommend==0}">否</c:if>
				<c:if test="${product.isCommend==1}">是</c:if>
			</td>
			<td align="center">
				<c:if test="${product.isShow==0}">下架</c:if>
				<c:if test="${product.isShow==1}">上架</c:if>
			</td>
			<td align="center">
			<a href="#" class="pn-opt">查看</a> | <a href="#" class="pn-opt">修改</a> | <a href="#" onclick="if(!confirm('您确定删除吗？')) {return false;}" class="pn-opt">删除</a> | <a href="/console/sku/list.do?productId=${product.brandId}" class="pn-opt">库存</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="page pb15">
	<span class="r inb_a page_b">
	
		<a href="/console/product/list.do?pageNum=1"><font size="2">首页</font></a>
	
		<a href="/console/product/list.do?pageNum=${productsList.pageNum-1}"><font size="2">上一页</font></a>
	

        <c:if test="${productsList.pageNum<=4}">
            <c:forEach begin="${productsList.pageNum}" end="${productsList.pageNum+4}" var="pn">
                <c:if test="${pn < productsList.pageNum}">
                    <a href="/console/product/list.do?pageNum=${productsList.pageNum+1}">${pn}</a>
                </c:if>
                <c:if test="${pn==productsList.pageNum}">
                    <strong>${pn}&nbsp;</strong>
                </c:if>
                <c:if test="${pn > productsList.pageNum}">
                    <a href="/console/product/list.do?pageNum=${productsList.pageNum+1}">${pn}</a>
                </c:if>
            </c:forEach>
        </c:if>
		<c:if test="${productsList.pageNum>4}">
            <c:forEach begin="${productsList.pageNum-3}" end="${productsList.pageNum+3}" var="pn">
                <c:if test="${pn < productsList.pageNum}">
                    <a href="/console/product/list.do?pageNum=${productsList.pageNum+1}">${pn}</a>
                </c:if>
                <c:if test="${pn==productsList.pageNum}">
					<strong><font color="#dc143c">${pn}&nbsp;</font></strong>
                </c:if>
                <c:if test="${pn > productsList.pageNum}">
                    <a href="/console/product/list.do?pageNum=${productsList.pageNum+1}">${pn}</a>
                </c:if>
            </c:forEach>
        </c:if>

		<a href="/console/product/list.do?pageNum=${productsList.pageNum+1}"><font size="2">下一页</font></a>
	
		<a href="/console/product/list.do?pageNum=${productsList.pages}"><font size="2">尾页</font></a>
	
		共<var>${productsList.pages}</var>页 到第<input type="text" size="3" id="PAGENO"/>页 <input type="button" onclick="javascript:window.location.href = '/product/list.do?&amp;isShow=0&amp;pageNo=' + $('#PAGENO').val() " value="确定" class="hand btn60x20" id="skip"/>
	
	</span>
</div>
	<%-------------------------------------------------------------------------------------------------------------------------------------------------%>
<div style="margin-top:15px;"><input class="del-button" type="button" value="删除" onclick="optDelete();"/><input class="add" type="button" value="上架" onclick="isShow(1);"/><input class="del-button" type="button" value="下架" onclick="isShow(0);"/></div>
</form>
</div>
</body>
</html>