﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_config.aspx.cs" Inherits="QJcms.Web.admin.users.user_config" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户参数设置</title>
    <script type="text/javascript" src="../../scripts/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../scripts/jquery/Validform_v5.3.2_min.js"></script>
    <script type="text/javascript" src="../../scripts/lhgdialog/lhgdialog.js?skin=mac"></script>
    <script type="text/javascript" charset="utf-8" src="../../editor/kindeditor-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../editor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="../js/layout.js"></script>
    <link href="../skin/default/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            //初始化表单验证
            $("#form1").initValidform();
            $("#regrules").click(function () {
                regrulesshow(this);
            });
            regrulesshow($("#regrules"));
            //初始化编辑器
            var editorMini = KindEditor.create('#regrulestxt', {
                width: '98%',
                height: '250px',
                resizeType: 1,
                uploadJson: '../../tools/upload_ajax.ashx?action=EditorFile&IsWater=1',
                items: [
				'source', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', '|', 'image', 'link', 'fullscreen']
            });
        });
        function regrulesshow(obj) {
            if ($(obj).prop("checked") == true) {
                $("#regrules_tab").show();
            }
            else {
                $("#regrules_tab").hide();
            }
        }
    </script>
</head>
<body class="mainbody">
    <form id="form1" runat="server">
    <!--导航栏-->
    <div class="location">
        <a href="javascript:history.back(-1);" class="back"><i></i><span>返回上一页</span></a> <a href="../center.aspx" class="home"><i></i><span>首页</span></a> <i class="arrow"></i><span>会员设置</span> <i class="arrow"></i><span>参数设置</span>
    </div>
    <div class="line10">
    </div>
    <!--/导航栏-->
    <!--内容-->
    <div class="content-tab-wrap">
        <div id="floatHead" class="content-tab">
            <div class="content-tab-ul-wrap">
                <ul>
                    <li><a href="javascript:;" onclick="tabs(this);">基本参数设置</a></li>
                    <li id="regrules_tab" style="display: none;"><a href="javascript:;" onclick="tabs(this);">注册协议</a></li>
                    <li runat="server" id="point_tab"><a href="javascript:;" onclick="tabs(this);">积分规则</a></li>
                    <li runat="server" id="invited_tab"><a href="javascript:;" onclick="tabs(this);">邀请码规则</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--用户参数设置-->
    <div class="tab-content">
        <dl>
            <dt>新用户注册设置</dt>
            <dd>
                <div class="rule-multi-radio">
                    <asp:RadioButtonList ID="regstatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    </asp:RadioButtonList>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>新用户注册验证</dt>
            <dd>
                <div class="rule-multi-radio">
                    <asp:RadioButtonList ID="regverify" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    </asp:RadioButtonList>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>欢迎短消息类型</dt>
            <dd>
                <div class="rule-multi-radio">
                    <asp:RadioButtonList ID="regmsgstatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    </asp:RadioButtonList>
                </div>
            </dd>
        </dl>
        <dl>
            <dt>欢迎短消息内容</dt>
            <dd>
                <asp:TextBox ID="regmsgtxt" runat="server" CssClass="input" TextMode="MultiLine" />
                <span class="Validform_checktip">支持HTML</span>
            </dd>
        </dl>
        <dl>
            <dt>用户名保留关健字</dt>
            <dd>
                <asp:TextBox ID="regkeywords" runat="server" CssClass="input normal" />
                <span class="Validform_checktip">*以英文逗号“,”分隔开</span>
            </dd>
        </dl>
        <dl>
            <dt>IP注册间隔限制</dt>
            <dd>
                <asp:TextBox ID="regctrl" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                小时 <span class="Validform_checktip">*同一IP的注册间隔，0为不限制</span>
            </dd>
        </dl>
        <dl runat="server" id="smsexpired">
            <dt>手机验证码有效期</dt>
            <dd>
                <asp:TextBox ID="regsmsexpired" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                分钟 <span class="Validform_checktip">*新用户手机验证码有效期，0为不限制</span>
            </dd>
        </dl>
        <dl runat="server" id="mailexpired">
            <dt>邮件验证有效期</dt>
            <dd>
                <asp:TextBox ID="regemailexpired" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                天 <span class="Validform_checktip">*新用户注册链接及验证邮件有效期，0为不限制</span>
            </dd>
        </dl>
        <dl runat="server" id="mailditto">
            <dt>同邮箱注册多个用户</dt>
            <dd>
                <div class="rule-single-checkbox">
                    <asp:CheckBox ID="regemailditto" runat="server" />
                </div>
                <span class="Validform_checktip">*允许同邮箱注册多个用户时不能允许邮箱登录</span>
            </dd>
        </dl>
        <dl runat="server" id="smslogin">
            <dt>允许手机号登录</dt>
            <dd>
                <div class="rule-single-checkbox">
                    <asp:CheckBox ID="mobilelogin" runat="server" />
                </div>
                <span class="Validform_checktip">*允许手机号码做为登录用户名</span>
            </dd>
        </dl>
        <dl runat="server" id="maillogin">
            <dt>允许邮箱登录</dt>
            <dd>
                <div class="rule-single-checkbox">
                    <asp:CheckBox ID="emaillogin" runat="server" />
                </div>
                <span class="Validform_checktip">*允许邮箱登录时不能开启同邮箱注册多个用户</span>
            </dd>
        </dl>
        <dl>
            <dt>开启注册协议</dt>
            <dd>
                <div class="rule-single-checkbox">
                    <asp:CheckBox ID="regrules" runat="server" />
                </div>
                <span class="Validform_checktip">*开启后，用户必须同意才能注册</span>
            </dd>
        </dl>
    </div>
    <!--/用户参数设置-->
    <!--注册协议-->
    <div class="tab-content">
        <dl>
            <dt>协议内容</dt>
            <dd>
                <asp:TextBox ID="regrulestxt" runat="server" CssClass="input" TextMode="MultiLine" />
            </dd>
        </dl>
    </div>
    <!--/注册协议-->
    <!--积分规则-->
    <div class="tab-content" runat="server" id="point_content">
        <dl>
            <dt>现金/积分兑换比例</dt>
            <dd>
                <asp:TextBox ID="pointcashrate" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                个 <span class="Validform_checktip">*1元等于多少个积分，0为禁用兑换功能</span>
            </dd>
        </dl>
        <dl>
            <dt>每天登录获得积分</dt>
            <dd>
                <asp:TextBox ID="pointloginnum" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                分 <span class="Validform_checktip">*会员每天登录获得的积分，一天只赠送一次</span>
            </dd>
        </dl>
        <dl runat="server" id="dlInvitPoint">
            <dt>邀请注册获得积分</dt>
            <dd>
                <asp:TextBox ID="pointinvitenum" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                分 <span class="Validform_checktip">*邀请一个注册成功用户所获得的积分</span>
            </dd>
        </dl>
    </div>
    <!--/注册协议-->
    <!--邀请码规则-->
    <div class="tab-content" runat="server" id="invited_content">
        <dl>
            <dt>邀请码使用期限</dt>
            <dd>
                <asp:TextBox ID="invitecodeexpired" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                天 <span class="Validform_checktip">*邀请码有效天数，0为不限制</span>
            </dd>
        </dl>
        <dl>
            <dt>邀请码可使用次数</dt>
            <dd>
                <asp:TextBox ID="invitecodecount" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                次 <span class="Validform_checktip">*邀请码使用次数，0为不限制</span>
            </dd>
        </dl>
        <dl>
            <dt>每天申请邀请码数量</dt>
            <dd>
                <asp:TextBox ID="invitecodenum" runat="server" CssClass="input small" datatype="n" sucmsg=" " />
                个 <span class="Validform_checktip">*每天可申请邀请码数量，0为不限制</span>
            </dd>
        </dl>
    </div>
    <!--/用户积分策略-->
    <!--内容-->
    <!--工具栏-->
    <div class="page-footer">
        <div class="btn-list">
            <asp:Button ID="btnSubmit" runat="server" Text="提交保存" CssClass="btn" OnClick="btnSubmit_Click" />
            <input name="btnReturn" type="button" value="返回上一页" class="btn yellow" onclick="javascript:history.back(-1);" />
        </div>
        <div class="clear">
        </div>
    </div>
    <!--/工具栏-->
    </form>
</body>
</html>
