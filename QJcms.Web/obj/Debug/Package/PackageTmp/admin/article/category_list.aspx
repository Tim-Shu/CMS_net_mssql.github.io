﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category_list.aspx.cs" Inherits="QJcms.Web.admin.article.category_list" %>

<%@ Import Namespace="QJcms.Common" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>内容类别</title>
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=mac"></script>
    <script type="text/javascript" src="../js/layout.js"></script>
    <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $(".expandable-close").click(function () {
                $(this).toggleClass("expandable-open");
                $(this).next().toggleClass("folder-open");
                //$('tr[id*="_' + $(this).attr("data") + '_"]').toggle();
                $(".layer_" + $(this).attr("data")).toggle();
            });
        });
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a> <a href="../center.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow"></i><span>内容类别</span>
    </div>
    <!--/导航栏-->
    <!--工具栏-->
    <div class="toolbar-wrap">
        <div id="floatHead" class="toolbar">
            <div class="l-list">
                <ul class="icon-list">
                    <li runat="server" id="tool_add"><a class="add" href="category_edit.aspx?action=<%=QJEnums.ActionEnum.Add %>&channel_id=<%=this.channel_id %>"><i></i><span>新增</span></a></li>
                    <li>
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="save" OnClick="btnSave_Click"><i></i><span>保存</span></asp:LinkButton></li>
                    <li><a class="all" href="javascript:;" onclick="checkAll(this);"><i></i><span>全选</span></a></li>
                    <li runat="server" id="tool_del">
                        <asp:LinkButton ID="btnDelete" runat="server" CssClass="del" OnClientClick="return ExePostBack('btnDelete','本操作会删除本类别及下属子类别，是否继续？');" OnClick="btnDelete_Click"><i></i><span>删除</span></asp:LinkButton></li>
                </ul>
            </div>
        </div>
    </div>
    <!--/工具栏-->
    <!--列表-->
    <asp:Repeater ID="rptList" runat="server" OnItemDataBound="rptList_ItemDataBound">
        <HeaderTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="ltable">
                <tr>
                    <th width="6%">
                        选择
                    </th>
                    <th align="left" width="6%">
                        编号
                    </th>
                    <th align="left">
                        类别名称
                    </th>
                    <%if (chanModel.is_category_call == 1)
                      { %>
                    <th align="left" width="12%">
                        调用别名
                    </th>
                    <%} %>
                    <th align="left" width="12%">
                        排序
                    </th>
                    <th width="12%">
                        操作
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr id='layer<%#Eval("class_list").ToString().Replace(',','_') %>' <%#Convert.ToInt32(Eval("class_layer")) > 1 ? " style='display:none;'" : ""%> class='layer_<%#Eval("parent_id").ToString()%>'>
                <td align="center">
                    <asp:CheckBox ID="chkId" CssClass="checkall" runat="server" Enabled='<%#bool.Parse((Convert.ToInt32(Eval("is_sys"))==0 ).ToString())%>' Style="vertical-align: middle;" />
                    <asp:HiddenField ID="hidParent" Value='<%#Eval("is_parent")%>' runat="server" />
                    <asp:HiddenField ID="hidId" Value='<%#Eval("id")%>' runat="server" />
                    <asp:HiddenField ID="hidLayer" Value='<%#Eval("class_layer") %>' runat="server" />
                </td>
                <td>
                    <%#Eval("id")%>
                </td>
                <td>
                    <asp:Literal ID="LitFirst" runat="server"></asp:Literal>
                    <a href="category_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%>">
                        <%#Eval("title")%> 
                        <%#Eval("sub_title")%></a>
                </td>
                <%if (chanModel.is_category_call == 1)
                  { %>
                <td>
                    <%#Eval("call_index")%>
                </td>
                <%} %>
                <td>
                    <asp:TextBox ID="txtSortId" runat="server" Text='<%#Eval("sort_id")%>' CssClass="sort" onkeydown="return checkNumber(event);" />
                </td>
                <td align="center">
                    <asp:HyperLink runat="server" ID="hlChild" NavigateUrl='category_edit.aspx?action=<%#QJEnums.ActionEnum.Add %>&channel_id=<%=this.channel_id %>&id=<%#Eval("id")%>' Text="添加子类"></asp:HyperLink>
                    <a href="category_edit.aspx?action=<%#QJEnums.ActionEnum.Edit %>&channel_id=<%#this.channel_id %>&id=<%#Eval("id")%>">修改</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            <%#rptList.Items.Count == 0 ? "<tr><td align=\"center\" colspan=\"6\">暂无记录</td></tr>" : ""%>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <!--/列表-->
    </form>
</body>
</html>
