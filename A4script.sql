USE [script]
GO
/****** Object:  Table [dbo].[qj_advert]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_advert](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[type] [int] NOT NULL,
	[price] [money] NOT NULL,
	[remark] [nvarchar](255) NULL,
	[view_num] [int] NOT NULL,
	[view_width] [int] NOT NULL,
	[view_height] [int] NOT NULL,
	[target] [nvarchar](30) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_advert] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_advert_banner]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_advert_banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aid] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[file_path] [nvarchar](255) NULL,
	[link_url] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[sort_id] [int] NOT NULL,
	[is_lock] [int] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_qj_advert_banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[call_index] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[tags] [nvarchar](max) NULL,
	[zhaiyao] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[sort_id] [int] NULL,
	[click] [int] NULL,
	[status] [tinyint] NULL,
	[is_msg] [tinyint] NULL,
	[is_top] [tinyint] NULL,
	[is_red] [tinyint] NULL,
	[is_hot] [tinyint] NULL,
	[is_slide] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
	[is_html] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[add_time] [datetime] NULL,
	[update_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_albums]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[thumb_path] [nvarchar](255) NULL,
	[original_path] [nvarchar](255) NULL,
	[remark] [nvarchar](max) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article_albums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_attach]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_attach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[file_name] [nvarchar](255) NULL,
	[file_path] [nvarchar](255) NULL,
	[file_size] [int] NULL,
	[file_ext] [nvarchar](20) NULL,
	[down_num] [int] NULL,
	[point] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article_attach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_attribute_field]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_attribute_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[control_type] [nvarchar](50) NULL,
	[data_type] [nvarchar](50) NULL,
	[data_length] [int] NULL,
	[data_place] [tinyint] NULL,
	[item_option] [nvarchar](max) NULL,
	[default_value] [nvarchar](max) NULL,
	[is_required] [tinyint] NULL,
	[is_password] [tinyint] NULL,
	[is_html] [tinyint] NULL,
	[editor_type] [tinyint] NULL,
	[valid_tip_msg] [nvarchar](255) NULL,
	[valid_error_msg] [nvarchar](255) NULL,
	[valid_pattern] [nvarchar](max) NULL,
	[sort_id] [int] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_qj_article_attribute_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_attribute_value]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_attribute_value](
	[article_id] [int] NOT NULL,
	[sub_title] [nvarchar](255) NULL,
	[source] [nvarchar](100) NULL,
	[author] [nvarchar](50) NULL,
	[goods_no] [nvarchar](100) NULL,
	[stock_quantity] [int] NULL,
	[market_price] [money] NULL,
	[sell_price] [money] NULL,
	[point] [int] NULL,
	[job_deions] [nvarchar](max) NULL,
	[job_content] [nvarchar](max) NULL,
	[job_request] [nvarchar](max) NULL,
	[xinghao] [nvarchar](200) NULL,
	[jianjie] [nvarchar](max) NULL,
	[canshu] [nvarchar](max) NULL,
	[chicun] [nvarchar](max) NULL,
	[zhinan] [nvarchar](max) NULL,
	[shipin] [nvarchar](255) NULL,
	[testUeEditor1] [nvarchar](max) NULL,
	[testUeEditor2] [nvarchar](max) NULL,
	[testUeEditor3] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_attributes]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[attr_id] [int] NULL,
	[attr_value_id] [int] NULL,
	[input_value] [nvarchar](max) NULL,
 CONSTRAINT [PK_qj_article_attributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_brand]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[brand_id] [tinyint] NULL,
	[brand_title] [nvarchar](100) NULL,
 CONSTRAINT [PK_qj_article_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_category]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[sub_title] [nvarchar](255) NULL,
	[call_index] [nvarchar](50) NULL,
	[parent_id] [int] NULL,
	[class_list] [nvarchar](max) NULL,
	[class_layer] [int] NULL,
	[sort_id] [int] NULL,
	[link_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[abstracts] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[price_range] [nvarchar](max) NULL,
	[icon_url] [nvarchar](255) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[is_parent] [int] NULL,
	[is_hot] [int] NULL,
	[is_sys] [int] NULL,
	[is_lock] [int] NULL,
 CONSTRAINT [PK_qj_article_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_category_albums]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_category_albums](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[thumb_path] [nvarchar](255) NULL,
	[original_path] [nvarchar](255) NULL,
	[remark] [nvarchar](max) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article_category_albums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_comment]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[article_id] [int] NULL,
	[parent_id] [int] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[user_ip] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[is_lock] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[is_reply] [tinyint] NULL,
	[reply_content] [nvarchar](max) NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_goods]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[goods_no] [nvarchar](50) NULL,
	[spec_ids] [nvarchar](max) NULL,
	[spec_text] [nvarchar](max) NULL,
	[stock_quantity] [int] NULL,
	[market_price] [money] NULL,
	[sell_price] [money] NULL,
 CONSTRAINT [PK_qj_article_goods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_goods_spec]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_goods_spec](
	[article_id] [int] NULL,
	[spec_id] [int] NULL,
	[parent_id] [int] NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_spec]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_spec](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[remark] [nvarchar](255) NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_article_spec] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_tags]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[is_red] [tinyint] NULL,
	[sort_id] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_article_tags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_article_tags_relation]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_article_tags_relation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[tag_id] [int] NULL,
 CONSTRAINT [PK_qj_article_tags_relation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_attributes]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_attributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NULL,
	[category_id] [int] NULL,
	[group_name] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[is_img] [int] NULL,
	[is_filter] [int] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_attributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_attributes_groups]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_attributes_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_attributes_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_attributes_values]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_attributes_values](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[attr_id] [int] NULL,
	[group_id] [int] NULL,
	[category_id] [int] NULL,
	[group_name] [nvarchar](100) NULL,
	[attr_name] [nvarchar](100) NULL,
	[attr_value] [nvarchar](255) NULL,
	[is_input] [int] NULL,
	[is_img] [int] NULL,
	[group_sort] [int] NULL,
	[attr_sort] [int] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_attributes_values] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_brand]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_id] [int] NULL,
	[title] [nvarchar](100) NULL,
	[logo] [nvarchar](255) NULL,
	[is_lock] [int] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_channel]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_channel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_id] [int] NULL,
	[name] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[content_name] [nvarchar](100) NULL,
	[category_name] [nvarchar](100) NULL,
	[comment_name] [nvarchar](100) NULL,
	[recom_type] [nvarchar](255) NULL,
	[is_content] [int] NULL,
	[content] [nvarchar](max) NULL,
	[is_cover] [int] NULL,
	[cover_url] [nvarchar](255) NULL,
	[is_image] [int] NULL,
	[is_albums] [tinyint] NULL,
	[is_attach] [tinyint] NULL,
	[is_spec] [tinyint] NULL,
	[is_comment] [int] NULL,
	[is_category_call] [int] NULL,
	[is_category_link] [int] NULL,
	[is_category_abstract] [int] NULL,
	[is_category_details] [int] NULL,
	[is_category_seo] [int] NULL,
	[is_category_layer] [int] NULL,
	[is_category_price] [int] NULL,
	[is_category_attributes] [int] NULL,
	[is_category_images] [int] NULL,
	[is_category_icon] [int] NULL,
	[is_category_subtitle] [int] NULL,
	[is_category_hot] [int] NULL,
	[is_content_call] [int] NULL,
	[is_content_link] [int] NULL,
	[is_content_abstract] [int] NULL,
	[is_content_details] [int] NULL,
	[is_content_seo] [int] NULL,
	[is_content_tags] [int] NULL,
	[is_content_click] [int] NULL,
	[is_content_audit] [int] NULL,
	[is_content_related] [int] NULL,
	[content_related_channel] [nvarchar](max) NULL,
	[is_contents_move] [int] NULL,
	[is_contents_copy] [int] NULL,
	[is_contents_batch] [int] NULL,
	[is_brand] [int] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_channel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_channel_field]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_channel_field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[channel_id] [int] NULL,
	[field_id] [int] NULL,
 CONSTRAINT [PK_qj_channel_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_channel_site]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_channel_site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[build_path] [nvarchar](100) NULL,
	[templet_path] [nvarchar](100) NULL,
	[domain] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[logo] [nvarchar](255) NULL,
	[company] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[tel] [nvarchar](30) NULL,
	[fax] [nvarchar](30) NULL,
	[hotline] [nvarchar](30) NULL,
	[qq] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[contact] [nvarchar](100) NULL,
	[crod] [nvarchar](100) NULL,
	[copyright] [nvarchar](max) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keyword] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
	[is_mobile] [tinyint] NULL,
	[is_default] [tinyint] NULL,
	[sort_id] [int] NULL,
 CONSTRAINT [PK_qj_channel_site] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_express]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_express](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[express_code] [nvarchar](100) NULL,
	[express_fee] [money] NULL,
	[website] [nvarchar](255) NULL,
	[remark] [nvarchar](max) NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_qj_express] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_feedback]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_path] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[user_qq] [nvarchar](30) NULL,
	[user_email] [nvarchar](50) NULL,
	[add_time] [datetime] NOT NULL,
	[reply_content] [nvarchar](max) NULL,
	[reply_time] [datetime] NULL,
	[is_lock] [tinyint] NOT NULL,
 CONSTRAINT [PK_qj_feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_link]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_link](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[site_path] [nvarchar](100) NULL,
	[title] [nvarchar](100) NULL,
	[user_name] [nvarchar](50) NULL,
	[user_tel] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[site_url] [nvarchar](255) NULL,
	[img_url] [nvarchar](255) NULL,
	[is_image] [int] NOT NULL,
	[sort_id] [int] NOT NULL,
	[is_red] [tinyint] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_mail_template]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_mail_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[maill_title] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_qj_mail_template] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_manager]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_manager](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[role_type] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[salt] [nvarchar](20) NULL,
	[real_name] [nvarchar](50) NULL,
	[telephone] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[is_lock] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_manager_log]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_manager_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[role_type] [int] NULL,
	[action_type] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[user_ip] [nvarchar](30) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_manager_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_manager_role]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_manager_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](100) NULL,
	[role_type] [tinyint] NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_qj_manager_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_manager_role_value]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_manager_role_value](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[nav_name] [nvarchar](100) NULL,
	[action_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_qj_manager_role_value] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_navigation]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_navigation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NULL,
	[channel_id] [int] NULL,
	[nav_type] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[title] [nvarchar](100) NULL,
	[sub_title] [nvarchar](100) NULL,
	[icon_url] [nvarchar](255) NULL,
	[link_url] [nvarchar](255) NULL,
	[sort_id] [int] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
	[remark] [nvarchar](max) NULL,
	[action_type] [nvarchar](max) NULL,
	[is_sys] [tinyint] NULL,
	[is_customer] [int] NULL,
 CONSTRAINT [PK_qj_navigation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_online_service]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_online_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[link_url] [nvarchar](255) NULL,
	[sort_id] [int] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_qj_online_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_online_service_group]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_online_service_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[default_view] [tinyint] NOT NULL,
	[sort_id] [int] NOT NULL,
	[is_lock] [tinyint] NOT NULL,
 CONSTRAINT [PK_qj_online_service_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_order_goods]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_order_goods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[order_id] [int] NULL,
	[goods_id] [int] NULL,
	[goods_no] [nvarchar](50) NULL,
	[goods_title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[spec_text] [nvarchar](max) NULL,
	[goods_price] [money] NULL,
	[real_price] [money] NULL,
	[quantity] [int] NULL,
	[point] [int] NULL,
 CONSTRAINT [PK_qj_order_goods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_orders]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [nvarchar](100) NULL,
	[trade_no] [nvarchar](100) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[payment_fee] [money] NULL,
	[payment_status] [tinyint] NULL,
	[payment_time] [datetime] NULL,
	[express_id] [int] NULL,
	[express_no] [nvarchar](100) NULL,
	[express_fee] [money] NULL,
	[express_status] [tinyint] NULL,
	[express_time] [datetime] NULL,
	[accept_name] [nvarchar](50) NULL,
	[post_code] [nvarchar](20) NULL,
	[telphone] [nvarchar](30) NULL,
	[mobile] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[area] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[remark] [nvarchar](max) NULL,
	[is_invoice] [tinyint] NULL,
	[invoice_title] [nvarchar](100) NULL,
	[invoice_taxes] [money] NULL,
	[payable_amount] [money] NULL,
	[real_amount] [money] NULL,
	[order_amount] [money] NULL,
	[point] [int] NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[confirm_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_qj_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_payment]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[remark] [nvarchar](max) NULL,
	[type] [tinyint] NULL,
	[poundage_type] [tinyint] NULL,
	[poundage_amount] [money] NULL,
	[sort_id] [int] NULL,
	[is_mobile] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
	[is_license] [int] NULL,
	[api_path] [nvarchar](100) NULL,
 CONSTRAINT [PK_qj_payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_script_code]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_script_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[user_name] [nvarchar](100) NULL,
	[login_ip] [nvarchar](30) NULL,
	[login_time] [datetime] NULL,
	[login_history] [nvarchar](max) NULL,
	[place] [nvarchar](255) NULL,
	[site_id] [int] NULL,
	[sort_id] [int] NULL,
	[is_lock] [tinyint] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_script_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_seo_list]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_seo_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[call_index] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NULL,
	[seo_title] [nvarchar](255) NULL,
	[seo_keywords] [nvarchar](255) NULL,
	[seo_description] [nvarchar](255) NULL,
 CONSTRAINT [PK_qj_seo_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_sms_template]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_sms_template](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[call_index] [nvarchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[is_sys] [tinyint] NULL,
 CONSTRAINT [PK_qj_sms_template] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_addr_book]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_addr_book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[accept_name] [nvarchar](100) NULL,
	[area] [nvarchar](100) NULL,
	[address] [nvarchar](max) NULL,
	[mobile] [nvarchar](20) NULL,
	[telphone] [nvarchar](30) NULL,
	[email] [nvarchar](50) NULL,
	[post_code] [nvarchar](20) NULL,
	[is_default] [tinyint] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_addr_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_amount_log]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_amount_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[value] [money] NULL,
	[remark] [nvarchar](max) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_amount_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_attach_log]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_attach_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[attach_id] [int] NULL,
	[file_name] [nvarchar](255) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_attach_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_code]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_code](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[str_code] [nvarchar](255) NULL,
	[count] [int] NULL,
	[status] [tinyint] NULL,
	[user_ip] [nvarchar](20) NULL,
	[eff_time] [datetime] NOT NULL,
	[add_time] [datetime] NOT NULL,
 CONSTRAINT [PK_qj_user_code] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_group_price]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_group_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[article_id] [int] NULL,
	[goods_id] [int] NULL,
	[group_id] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_qj_user_group_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_groups]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[grade] [int] NULL,
	[upgrade_exp] [int] NULL,
	[amount] [money] NULL,
	[point] [int] NULL,
	[discount] [int] NULL,
	[is_default] [tinyint] NULL,
	[is_upgrade] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
 CONSTRAINT [PK_qj_user_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_login_log]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_login_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[remark] [nvarchar](255) NULL,
	[login_time] [datetime] NULL,
	[login_ip] [nvarchar](50) NULL,
 CONSTRAINT [PK_qj_user_login_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_message]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_message](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [tinyint] NULL,
	[post_user_name] [nvarchar](100) NULL,
	[accept_user_name] [nvarchar](100) NULL,
	[is_read] [tinyint] NULL,
	[title] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[post_time] [datetime] NOT NULL,
	[read_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_oauth]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_oauth](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[oauth_name] [nvarchar](50) NOT NULL,
	[oauth_access_token] [nvarchar](max) NULL,
	[oauth_openid] [nvarchar](255) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_oauth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_oauth_app]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_oauth_app](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NULL,
	[img_url] [nvarchar](255) NULL,
	[app_id] [nvarchar](100) NULL,
	[app_key] [nvarchar](max) NULL,
	[remark] [nvarchar](max) NULL,
	[sort_id] [int] NULL,
	[is_mobile] [tinyint] NULL,
	[is_lock] [tinyint] NULL,
	[api_path] [nvarchar](255) NULL,
 CONSTRAINT [PK_qj_user_oauth_app] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_point_log]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_point_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[value] [int] NULL,
	[remark] [nvarchar](max) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_point_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_user_recharge]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_user_recharge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](100) NULL,
	[recharge_no] [nvarchar](100) NULL,
	[payment_id] [int] NULL,
	[amount] [money] NULL,
	[status] [tinyint] NULL,
	[add_time] [datetime] NULL,
	[complete_time] [datetime] NULL,
 CONSTRAINT [PK_qj_user_recharge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_users]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NULL,
	[user_name] [nvarchar](100) NOT NULL,
	[salt] [nvarchar](20) NULL,
	[password] [nvarchar](100) NOT NULL,
	[mobile] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[avatar] [nvarchar](255) NULL,
	[nick_name] [nvarchar](100) NULL,
	[sex] [nvarchar](20) NULL,
	[birthday] [datetime] NULL,
	[telphone] [nvarchar](50) NULL,
	[area] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[qq] [nvarchar](20) NULL,
	[msn] [nvarchar](100) NULL,
	[amount] [money] NULL,
	[point] [int] NULL,
	[exp] [int] NULL,
	[status] [tinyint] NULL,
	[reg_time] [datetime] NULL,
	[reg_ip] [nvarchar](20) NULL,
 CONSTRAINT [PK_qj_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_weixin_access_token]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_weixin_access_token](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[access_token] [nvarchar](max) NULL,
	[expires_in] [int] NULL,
	[count] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_weixin_access_token] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_weixin_account]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_weixin_account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[originalid] [nvarchar](50) NULL,
	[wxcode] [nvarchar](50) NULL,
	[token] [nvarchar](max) NULL,
	[appid] [nvarchar](100) NULL,
	[appsecret] [nvarchar](150) NULL,
	[is_push] [tinyint] NULL,
	[sort_id] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_weixin_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_weixin_request_content]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_weixin_request_content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[rule_id] [int] NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[link_url] [nvarchar](max) NULL,
	[img_url] [nvarchar](max) NULL,
	[media_url] [nvarchar](max) NULL,
	[meida_hd_url] [nvarchar](max) NULL,
	[sort_id] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_weixin_request_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_weixin_request_rule]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_weixin_request_rule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[name] [nvarchar](200) NULL,
	[keywords] [nvarchar](max) NULL,
	[request_type] [int] NULL,
	[response_type] [int] NULL,
	[is_like_query] [tinyint] NULL,
	[is_default] [tinyint] NULL,
	[sort_id] [int] NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_weixin_request_rule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[qj_weixin_response_content]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qj_weixin_response_content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[openid] [nvarchar](100) NULL,
	[request_type] [nvarchar](50) NULL,
	[request_content] [nvarchar](max) NULL,
	[response_type] [nvarchar](50) NULL,
	[reponse_content] [nvarchar](max) NULL,
	[create_time] [nvarchar](50) NULL,
	[xml_content] [nvarchar](max) NULL,
	[add_time] [datetime] NULL,
 CONSTRAINT [PK_qj_weixin_response_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[view_channel_case]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_case] as SELECT qj_article.* FROM qj_article_attribute_value INNER JOIN qj_article ON qj_article_attribute_value.article_id = qj_article.id WHERE qj_article.channel_id=4

GO
/****** Object:  View [dbo].[view_channel_danye]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_danye] as SELECT qj_article.* FROM qj_article_attribute_value INNER JOIN qj_article ON qj_article_attribute_value.article_id = qj_article.id WHERE qj_article.channel_id=8


GO
/****** Object:  View [dbo].[view_channel_news]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_news] as SELECT qj_article.* FROM qj_article_attribute_value INNER JOIN qj_article ON qj_article_attribute_value.article_id = qj_article.id WHERE qj_article.channel_id=7

GO
/****** Object:  View [dbo].[view_channel_product]    Script Date: 2019/8/7 14:22:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_channel_product] as SELECT qj_article.* FROM qj_article_attribute_value INNER JOIN qj_article ON qj_article_attribute_value.article_id = qj_article.id WHERE qj_article.channel_id=3

GO
SET IDENTITY_INSERT [dbo].[qj_article] ON 

INSERT [dbo].[qj_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [is_html], [user_name], [add_time], [update_time]) VALUES (4, 8, 0, N'about', N'公司简介', N'', N'', N'', N'', N'', N'', N'', N'<p>上海忠福焊接材料厂位于中国崇明建设镇三星牛路1005号，上海忠福焊接材料厂是一家铜焊条、铝焊丝、铸铁、银钎焊料、钴基焊丝等产品的专业生产的私营独资企业。上海忠福焊接材料厂经营的铜焊条、铝焊丝、铸铁、银钎焊料、钴基焊丝畅销消费者市场。</p><p>上海忠福焊接材料厂的产品在消费者当中享有较高的地位，公司与多家零售商和代理商建立了长期稳定的合作关系。</p><p>上海忠福焊接材料厂经销的铜焊条、铝焊丝、铸铁、银钎焊料、钴基焊丝品种齐全、价格合理。上海忠福焊接材料厂实力雄厚，重信用、守合同、产品质量，以多品种经营特色和薄利多销的原则，赢得了广大客户的信任。</p><p><br/></p>', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Qiju', CAST(N'2019-06-11 09:16:16.000' AS DateTime), CAST(N'2019-08-05 13:52:53.853' AS DateTime))
INSERT [dbo].[qj_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [is_html], [user_name], [add_time], [update_time]) VALUES (5, 8, 0, N'contact', N'联系我们', N'', N'', N'', N'', N'', N'', N'', N'<p>电话：59330895</p><p>手机：13601751926</p><p>传真：59330895</p><p>地址：上海市崇明县建设镇三星牛路1005号&nbsp;</p><p>Q&nbsp; Q: 1783149973</p>', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Qiju', CAST(N'2019-06-11 09:16:24.000' AS DateTime), CAST(N'2019-08-05 13:52:09.630' AS DateTime))
INSERT [dbo].[qj_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [is_html], [user_name], [add_time], [update_time]) VALUES (6, 8, 0, N'iabout', N'公司简介/首页', N'', N'/upload/201908/05/201908051353080177.jpg', N'', N'', N'', N'', N'', N'<p>上海忠福焊接材料厂位于中国崇明建设镇三星牛路1005号，上海忠福焊接材料厂是一家铜焊条、铝焊丝、铸铁、银钎焊料、钴基焊丝等产品的专业生产的私营独资企业。上海忠福焊接材料厂经营的铜焊条、铝焊丝、铸铁、银钎焊料、钴基焊丝畅销消费者市场。</p><p>上海忠福焊接材料厂的产品在消费者当中享有较高的地位，公司与多家零售商和代理商建立了长期稳定的合作关系。</p><p><br/></p>', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Qiju', CAST(N'2019-06-11 09:16:37.000' AS DateTime), CAST(N'2019-08-05 14:29:37.790' AS DateTime))
INSERT [dbo].[qj_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [is_html], [user_name], [add_time], [update_time]) VALUES (7, 8, 0, N'ilxwm', N'联系我们/首页', N'', N'', N'', N'', N'', N'', N'', N'<p style="white-space: normal;">电话：59330895</p><p style="white-space: normal;">手机：13601751926</p><p style="white-space: normal;">传真：59330895</p><p style="white-space: normal;">地址：上海市崇明县建设镇三星牛路1005号&nbsp;</p><p style="white-space: normal;">Q&nbsp; Q: 1783149973</p>', 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Qiju', CAST(N'2019-06-11 09:17:23.000' AS DateTime), CAST(N'2019-08-05 13:52:13.927' AS DateTime))
INSERT [dbo].[qj_article] ([id], [channel_id], [category_id], [call_index], [title], [link_url], [img_url], [seo_title], [seo_keywords], [seo_description], [tags], [zhaiyao], [content], [sort_id], [click], [status], [is_msg], [is_top], [is_red], [is_hot], [is_slide], [is_sys], [is_html], [user_name], [add_time], [update_time]) VALUES (8, 8, 0, N'clxwm', N'联系我们/侧栏', N'', N'', N'', N'', N'', N'', N'', N'<p style="white-space: normal;">电话：59330895</p><p style="white-space: normal;">手机：13601751926</p><p style="white-space: normal;">传真：59330895</p><p style="white-space: normal;">地址：上海市崇明县建设镇三星牛路1005号&nbsp;</p><p style="white-space: normal;">Q&nbsp; Q: 1783149973</p>', 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Qiju', CAST(N'2019-06-11 09:17:50.000' AS DateTime), CAST(N'2019-08-05 13:52:18.107' AS DateTime))
SET IDENTITY_INSERT [dbo].[qj_article] OFF
SET IDENTITY_INSERT [dbo].[qj_article_attribute_field] ON 

INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (1, N'sub_title', N'副标题', N'single-text', N'nvarchar(255)', 255, 0, NULL, NULL, 0, 0, 0, 0, N'可为空，最多255个字符', NULL, N's0-255', 99, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (2, N'source', N'信息来源', N'single-text', N'nvarchar(100)', 100, 0, NULL, N'本站', 0, 0, 0, 0, N'非必填，最多50个字符', NULL, N's0-50', 100, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (3, N'author', N'文章作者', N'single-text', N'nvarchar(50)', 50, 0, NULL, NULL, 0, 0, 0, 0, N'非必填，最多50个字符', NULL, N's0-50', 101, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (4, N'goods_no', N'商品货号', N'single-text', N'nvarchar(100)', 100, 0, NULL, NULL, 0, 0, 0, 0, N'允许字母、下划线，100个字符内', NULL, N's0-100', 102, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (5, N'stock_quantity', N'库存数量', N'number', N'int', 0, 0, NULL, N'0', 0, 0, 0, 0, N'库存数量为0时显示缺货状态', NULL, N'n', 103, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (6, N'market_price', N'市场价格', N'number', N'decimal(9,2)', 0, 2, NULL, N'0', 0, 0, 0, 0, N'市场的参与价格，不参与计算', NULL, N'/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/', 104, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (7, N'sell_price', N'销售价格', N'number', N'decimal(9,2)', 0, 2, NULL, N'0', 1, 0, 0, 0, N'*出售的实际交易价格', NULL, N'/^(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/', 105, 1)
INSERT [dbo].[qj_article_attribute_field] ([id], [name], [title], [control_type], [data_type], [data_length], [data_place], [item_option], [default_value], [is_required], [is_password], [is_html], [editor_type], [valid_tip_msg], [valid_error_msg], [valid_pattern], [sort_id], [is_sys]) VALUES (8, N'point', N'交易积分', N'number', N'int', 0, 0, NULL, N'0', 0, 0, 0, 0, N'*正为返还，负为消费积分', NULL, N'n', 106, 1)
SET IDENTITY_INSERT [dbo].[qj_article_attribute_field] OFF
INSERT [dbo].[qj_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [job_deions], [job_content], [job_request], [xinghao], [jianjie], [canshu], [chicun], [zhinan], [shipin], [testUeEditor1], [testUeEditor2], [testUeEditor3]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[qj_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [job_deions], [job_content], [job_request], [xinghao], [jianjie], [canshu], [chicun], [zhinan], [shipin], [testUeEditor1], [testUeEditor2], [testUeEditor3]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[qj_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [job_deions], [job_content], [job_request], [xinghao], [jianjie], [canshu], [chicun], [zhinan], [shipin], [testUeEditor1], [testUeEditor2], [testUeEditor3]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[qj_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [job_deions], [job_content], [job_request], [xinghao], [jianjie], [canshu], [chicun], [zhinan], [shipin], [testUeEditor1], [testUeEditor2], [testUeEditor3]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[qj_article_attribute_value] ([article_id], [sub_title], [source], [author], [goods_no], [stock_quantity], [market_price], [sell_price], [point], [job_deions], [job_content], [job_request], [xinghao], [jianjie], [canshu], [chicun], [zhinan], [shipin], [testUeEditor1], [testUeEditor2], [testUeEditor3]) VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[qj_channel] ON 

INSERT [dbo].[qj_channel] ([id], [site_id], [name], [title], [content_name], [category_name], [comment_name], [recom_type], [is_content], [content], [is_cover], [cover_url], [is_image], [is_albums], [is_attach], [is_spec], [is_comment], [is_category_call], [is_category_link], [is_category_abstract], [is_category_details], [is_category_seo], [is_category_layer], [is_category_price], [is_category_attributes], [is_category_images], [is_category_icon], [is_category_subtitle], [is_category_hot], [is_content_call], [is_content_link], [is_content_abstract], [is_content_details], [is_content_seo], [is_content_tags], [is_content_click], [is_content_audit], [is_content_related], [content_related_channel], [is_contents_move], [is_contents_copy], [is_contents_batch], [is_brand], [sort_id]) VALUES (3, 3, N'product', N'产品中心', N'内容管理', N'栏目类别', N'', N'isRed,', 0, N'', 0, N'', 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 0, 0, 1, 0, 1)
INSERT [dbo].[qj_channel] ([id], [site_id], [name], [title], [content_name], [category_name], [comment_name], [recom_type], [is_content], [content], [is_cover], [cover_url], [is_image], [is_albums], [is_attach], [is_spec], [is_comment], [is_category_call], [is_category_link], [is_category_abstract], [is_category_details], [is_category_seo], [is_category_layer], [is_category_price], [is_category_attributes], [is_category_images], [is_category_icon], [is_category_subtitle], [is_category_hot], [is_content_call], [is_content_link], [is_content_abstract], [is_content_details], [is_content_seo], [is_content_tags], [is_content_click], [is_content_audit], [is_content_related], [content_related_channel], [is_contents_move], [is_contents_copy], [is_contents_batch], [is_brand], [sort_id]) VALUES (4, 3, N'case', N'工程案例', N'内容管理', N'栏目类别', N'', N'isRed,', 0, N'', 0, N'', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, N'', 0, 0, 1, 0, 2)
INSERT [dbo].[qj_channel] ([id], [site_id], [name], [title], [content_name], [category_name], [comment_name], [recom_type], [is_content], [content], [is_cover], [cover_url], [is_image], [is_albums], [is_attach], [is_spec], [is_comment], [is_category_call], [is_category_link], [is_category_abstract], [is_category_details], [is_category_seo], [is_category_layer], [is_category_price], [is_category_attributes], [is_category_images], [is_category_icon], [is_category_subtitle], [is_category_hot], [is_content_call], [is_content_link], [is_content_abstract], [is_content_details], [is_content_seo], [is_content_tags], [is_content_click], [is_content_audit], [is_content_related], [content_related_channel], [is_contents_move], [is_contents_copy], [is_contents_batch], [is_brand], [sort_id]) VALUES (7, 3, N'news', N'新闻资讯', N'内容管理', N'栏目类别', N'', N'isRed,', 0, N'', 0, N'', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 3)
INSERT [dbo].[qj_channel] ([id], [site_id], [name], [title], [content_name], [category_name], [comment_name], [recom_type], [is_content], [content], [is_cover], [cover_url], [is_image], [is_albums], [is_attach], [is_spec], [is_comment], [is_category_call], [is_category_link], [is_category_abstract], [is_category_details], [is_category_seo], [is_category_layer], [is_category_price], [is_category_attributes], [is_category_images], [is_category_icon], [is_category_subtitle], [is_category_hot], [is_content_call], [is_content_link], [is_content_abstract], [is_content_details], [is_content_seo], [is_content_tags], [is_content_click], [is_content_audit], [is_content_related], [content_related_channel], [is_contents_move], [is_contents_copy], [is_contents_batch], [is_brand], [sort_id]) VALUES (8, 3, N'danye', N'单页管理', N'内容管理', N'栏目类别', N'', N'', 0, N'', 0, N'', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, N'', 0, 0, 0, 0, 99)
SET IDENTITY_INSERT [dbo].[qj_channel] OFF
SET IDENTITY_INSERT [dbo].[qj_channel_site] ON 

INSERT [dbo].[qj_channel_site] ([id], [title], [build_path], [templet_path], [domain], [name], [logo], [company], [address], [tel], [fax], [hotline], [qq], [email], [contact], [crod], [copyright], [seo_title], [seo_keyword], [seo_description], [is_mobile], [is_default], [sort_id]) VALUES (3, N'默认站点', N'main', N'demo', N'', N'qiju', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', 0, 1, 1)
SET IDENTITY_INSERT [dbo].[qj_channel_site] OFF
SET IDENTITY_INSERT [dbo].[qj_mail_template] ON 

INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (2, N'注册激活账户邮件', N'regverify', N'激活注册账户(请勿回复此邮件)', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp; 欢迎您成为{webname}会员用户，请点击如下的网址进行激活您的会员账户：
</p>
<p>
	&nbsp;&nbsp;&nbsp; <a href="{linkurl}" target="_blank">{linkurl}</a> 
</p>
<hr />
<p>
	此链接有效期为{valid}天，请在{valid}天内点击链接进行注册；如果您从未注册过本站会员，请忽略本邮件；此邮件为系统自动发出，请勿回复。<br />
任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (3, N'用户取回密码', N'getpassword', N'找回密码提示(请勿回复此邮件)', N'<strong>{username}，您好：</strong><br />
<p>
	您在<span style="color:#FF0000;">{webname}</span>点击了“忘记密码”找回申请，故系统自动为您发送了这封邮件。您可以点击以下链接修改您的密码：<br />
<a href="{linkurl}" target="_blank">{linkurl}</a> 
</p>
<hr />
<p>
	此链接有效期为{valid}天，请在{valid}天内点击链接进行修改。如果您不需要修改密码，或者您从未点击过“忘记密码”按钮，请忽略本邮件。<br />
任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (4, N'欢迎新用户邮件', N'welcomemsg', N'欢迎新用户(请勿回复此邮件)', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp; 您已成功注册并正式成为{webname}会员用户，请您注意保管好个人账户信息，防止丢失或泄漏。
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (5, N'订单确认通知', N'order_confirm', N'订单确认通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单已确认，订单号为：{orderno}，共计{amount}元，我们会尽快安排发货，请您耐心等待，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (6, N'订单发货通知', N'order_express', N'订单发货通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单已经发货，订单号为：{orderno}，共计{amount}元，请您注意查收，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (7, N'订单完成通知', N'order_complete', N'订单完成通知', N'<p>
	<strong>尊敬的{username}，您好：</strong> 
</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 您在{webname}的一笔订单交易完成，订单号为：{orderno}，共计{amount}元，期待您下次光临，祝您购物愉快！
</p>
<hr />
<p>
	此邮件为系统自动发出，请勿回复本邮件，任何疑问，请拨打客服热线咨询：{webtel}。谢谢您的支持！
</p>
<div style="text-align:right;">
	{webname} {weburl}
</div>', 1)
INSERT [dbo].[qj_mail_template] ([id], [title], [call_index], [maill_title], [content], [is_sys]) VALUES (8, N'在线留言', N'feedback', N'在线留言', N'<table border="0"><tbody><tr class="firstRow"><td>姓名：</td><td>{name}</td></tr><tr><td>电话：</td><td>{tel}</td></tr><tr><td>邮箱：</td><td>{mail}</td></tr><tr><td>内容：</td><td style="word-break: break-all;">{msg}(上海忠福焊接材料厂-在线留言)</td></tr></tbody></table><p><br/></p>', 1)
SET IDENTITY_INSERT [dbo].[qj_mail_template] OFF
SET IDENTITY_INSERT [dbo].[qj_manager] ON 

INSERT [dbo].[qj_manager] ([id], [role_id], [role_type], [user_name], [password], [salt], [real_name], [telephone], [email], [is_lock], [add_time]) VALUES (4, 2, 2, N'uid196', N'155B45A8CE94D207', N'F6ZNP0', N'网站管理员', N'', N'', 0, CAST(N'2019-06-10 13:56:49.000' AS DateTime))
INSERT [dbo].[qj_manager] ([id], [role_id], [role_type], [user_name], [password], [salt], [real_name], [telephone], [email], [is_lock], [add_time]) VALUES (5, 1, 1, N'Qiju', N'8044050B60FCCAC1BEA9927A05E941D5', N'P0XHJ6', N'.net', N'808', N'', 0, CAST(N'2019-06-10 14:15:16.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[qj_manager] OFF
SET IDENTITY_INSERT [dbo].[qj_manager_log] ON 

INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (1, 1, N'QiJu', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-06-10 11:54:16.663' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (2, 1, N'QiJu', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-06-10 13:09:56.990' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (3, 1, N'QiJu', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-10 13:28:30.453' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (4, 1, N'QiJu', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-10 13:32:14.583' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (5, 1, N'QiJu', 1, N'Delete', N'删除管理员1条，失败0条', N'127.0.0.1', CAST(N'2019-06-10 13:56:34.540' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (6, 1, N'QiJu', 1, N'Add', N'添加管理员:uid196', N'127.0.0.1', CAST(N'2019-06-10 13:56:49.903' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (7, 1, N'QiJu', 1, N'Edit', N'修改管理员:QiJu', N'127.0.0.1', CAST(N'2019-06-10 13:57:02.503' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (8, 1, N'QiJu', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-10 13:58:23.177' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (9, 1, N'QiJu', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-06-10 14:14:37.773' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (10, 1, N'QiJu', 1, N'Delete', N'删除管理员1条，失败0条', N'127.0.0.1', CAST(N'2019-06-10 14:15:07.507' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (11, 1, N'QiJu', 1, N'Add', N'添加管理员:Qiju', N'127.0.0.1', CAST(N'2019-06-10 14:15:16.920' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (12, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-06-11 09:09:46.013' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (13, 5, N'Qiju', 1, N'Edit', N'修改contact频道内容:联系我们', N'127.0.0.1', CAST(N'2019-06-11 09:09:56.530' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (14, 5, N'Qiju', 1, N'Edit', N'删除contact频道内容成功2条，失败0条', N'127.0.0.1', CAST(N'2019-06-11 09:09:58.907' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (15, 5, N'Qiju', 1, N'Edit', N'修改about频道内容:公司简介', N'127.0.0.1', CAST(N'2019-06-11 09:10:08.067' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (16, 5, N'Qiju', 1, N'Edit', N'删除about频道内容成功1条，失败0条', N'127.0.0.1', CAST(N'2019-06-11 09:10:10.917' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (17, 5, N'Qiju', 1, N'Delete', N'删除频道成功1条，失败0条', N'127.0.0.1', CAST(N'2019-06-11 09:10:21.377' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (18, 5, N'Qiju', 1, N'Delete', N'删除频道成功1条，失败0条', N'127.0.0.1', CAST(N'2019-06-11 09:10:24.730' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (19, 5, N'Qiju', 1, N'Delete', N'删除频道成功1条，失败0条', N'127.0.0.1', CAST(N'2019-06-11 09:10:27.693' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (20, 5, N'Qiju', 1, N'Edit', N'保存频道排序', N'127.0.0.1', CAST(N'2019-06-11 09:10:34.363' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (21, 5, N'Qiju', 1, N'Edit', N'修改频道产品展示', N'127.0.0.1', CAST(N'2019-06-11 09:11:35.400' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (22, 5, N'Qiju', 1, N'Edit', N'修改频道新闻资讯', N'127.0.0.1', CAST(N'2019-06-11 09:12:13.513' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (23, 5, N'Qiju', 1, N'Edit', N'修改频道新闻资讯', N'127.0.0.1', CAST(N'2019-06-11 09:13:45.930' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (24, 5, N'Qiju', 1, N'Add', N'添加频道单页管理', N'127.0.0.1', CAST(N'2019-06-11 09:14:55.910' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (25, 5, N'Qiju', 1, N'Edit', N'修改频道新闻资讯', N'127.0.0.1', CAST(N'2019-06-11 09:15:10.493' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (26, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:公司简介', N'127.0.0.1', CAST(N'2019-06-11 09:16:17.013' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (27, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:联系我们', N'127.0.0.1', CAST(N'2019-06-11 09:16:24.690' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (28, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:公司简介/首页', N'127.0.0.1', CAST(N'2019-06-11 09:16:37.647' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (29, 5, N'Qiju', 1, N'Edit', N'修改频道单页管理', N'127.0.0.1', CAST(N'2019-06-11 09:16:47.917' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (30, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:公司简介', N'127.0.0.1', CAST(N'2019-06-11 09:16:54.737' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (31, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:联系我们', N'127.0.0.1', CAST(N'2019-06-11 09:16:59.823' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (32, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:公司简介/首页', N'127.0.0.1', CAST(N'2019-06-11 09:17:04.590' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (33, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:联系我们/首页', N'127.0.0.1', CAST(N'2019-06-11 09:17:23.210' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (34, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:联系我们/侧栏', N'127.0.0.1', CAST(N'2019-06-11 09:17:50.767' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (35, 5, N'Qiju', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-11 09:19:01.900' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (36, 5, N'Qiju', 1, N'Edit', N'修改邮件模板:在线留言', N'127.0.0.1', CAST(N'2019-06-11 09:20:19.483' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (37, 5, N'Qiju', 1, N'Delete', N'删除管理日志0条', N'127.0.0.1', CAST(N'2019-06-11 09:22:04.253' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (38, 5, N'Qiju', 1, N'Edit', N'修改管理员:uid196', N'127.0.0.1', CAST(N'2019-06-11 09:23:52.443' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (39, 5, N'Qiju', 1, N'Edit', N'修改管理员:Qiju', N'127.0.0.1', CAST(N'2019-06-11 09:24:05.570' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (40, 5, N'Qiju', 1, N'Edit', N'修改管理员:Qiju', N'127.0.0.1', CAST(N'2019-06-11 09:24:19.407' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (41, 5, N'Qiju', 1, N'Edit', N'修改邮件模板:在线留言', N'127.0.0.1', CAST(N'2019-06-11 09:30:57.893' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (42, 5, N'Qiju', 1, N'Add', N'修改导航菜单:数据备份', N'127.0.0.1', CAST(N'2019-06-11 10:45:35.643' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (43, 5, N'Qiju', 1, N'Add', N'修改导航菜单:SEO优化', N'127.0.0.1', CAST(N'2019-06-11 10:46:16.627' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (44, 5, N'Qiju', 1, N'Add', N'修改导航菜单:热门搜索', N'127.0.0.1', CAST(N'2019-06-11 10:48:29.510' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (45, 5, N'Qiju', 1, N'Add', N'修改导航菜单:广告管理', N'127.0.0.1', CAST(N'2019-06-11 10:48:38.543' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (46, 5, N'Qiju', 1, N'Add', N'修改导航菜单:在线客服', N'127.0.0.1', CAST(N'2019-06-11 10:48:45.497' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (47, 5, N'Qiju', 1, N'Add', N'修改导航菜单:文件管理', N'127.0.0.1', CAST(N'2019-06-11 10:49:32.597' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (48, 5, N'Qiju', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-11 11:18:33.203' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (49, 5, N'Qiju', 1, N'Edit', N'修改优化关键词：seo', N'127.0.0.1', CAST(N'2019-06-11 14:01:06.960' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (50, 5, N'Qiju', 1, N'Delete', N'删除管理日志0条', N'127.0.0.1', CAST(N'2019-06-11 14:02:14.840' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (51, 5, N'Qiju', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-11 14:22:58.533' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (52, 5, N'Qiju', 1, N'Edit', N'修改频道产品展示', N'127.0.0.1', CAST(N'2019-06-11 16:06:30.627' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (53, 5, N'Qiju', 1, N'Edit', N'修改频道产品展示', N'127.0.0.1', CAST(N'2019-06-11 16:07:38.633' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (54, 5, N'Qiju', 1, N'Edit', N'修改频道工程案例', N'127.0.0.1', CAST(N'2019-06-11 16:08:01.180' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (55, 5, N'Qiju', 1, N'Edit', N'修改频道工程案例', N'127.0.0.1', CAST(N'2019-06-11 16:09:06.897' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (56, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-06-13 09:18:01.640' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (57, 5, N'Qiju', 1, N'Edit', N'修改系统权限信息', N'127.0.0.1', CAST(N'2019-06-13 09:18:52.087' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (58, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-06-13 09:18:58.383' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (59, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-07-12 15:00:43.297' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (60, 5, N'Qiju', 1, N'Edit', N'修改频道产品展示', N'127.0.0.1', CAST(N'2019-07-12 15:01:06.203' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (61, 5, N'Qiju', 1, N'Edit', N'修改频道工程案例', N'127.0.0.1', CAST(N'2019-07-12 15:01:22.427' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (62, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-07-16 11:38:37.450' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (63, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-07-16 11:42:57.267' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (64, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-07-16 11:43:40.350' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (65, 5, N'Qiju', 1, N'Edit', N'修改频道产品展示', N'127.0.0.1', CAST(N'2019-07-16 13:07:35.447' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (66, 5, N'Qiju', 1, N'Edit', N'修改频道成功案例', N'127.0.0.1', CAST(N'2019-07-16 13:08:19.163' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (67, 5, N'Qiju', 1, N'Edit', N'修改频道新闻动态', N'127.0.0.1', CAST(N'2019-07-16 13:08:49.547' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (68, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:ASO产品介绍', N'127.0.0.1', CAST(N'2019-07-16 13:21:32.740' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (69, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:SEO产品介绍', N'127.0.0.1', CAST(N'2019-07-16 13:21:37.700' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (70, 5, N'Qiju', 1, N'Add', N'添加product频道内容:SEO产品介绍', N'127.0.0.1', CAST(N'2019-07-16 13:26:17.623' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (71, 5, N'Qiju', 1, N'Edit', N'保存product频道内容排序', N'127.0.0.1', CAST(N'2019-07-16 13:26:21.210' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (72, 5, N'Qiju', 1, N'Edit', N'修改product频道内容:SEO产品介绍', N'127.0.0.1', CAST(N'2019-07-16 13:26:27.693' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (73, 5, N'Qiju', 1, N'Add', N'添加product频道内容:ASO产品介绍', N'127.0.0.1', CAST(N'2019-07-16 13:27:11.597' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (74, 5, N'Qiju', 1, N'Edit', N'保存product频道内容排序', N'127.0.0.1', CAST(N'2019-07-16 13:27:17.507' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (75, 5, N'Qiju', 1, N'Add', N'添加case频道栏目分类:成功案例', N'127.0.0.1', CAST(N'2019-07-16 13:27:36.483' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (76, 5, N'Qiju', 1, N'Add', N'添加news频道栏目分类:行业新闻', N'127.0.0.1', CAST(N'2019-07-16 13:28:05.343' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (77, 5, N'Qiju', 1, N'Add', N'添加news频道内容:从SEO到ASO：一切为了流量分发', N'127.0.0.1', CAST(N'2019-07-16 13:28:35.580' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (78, 5, N'Qiju', 1, N'Add', N'添加news频道内容:ASO是什么ASO与SEO有什么区别和联系', N'127.0.0.1', CAST(N'2019-07-16 13:29:15.380' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (79, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-07-23 09:52:24.730' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (80, 5, N'Qiju', 1, N'Edit', N'修改频道新闻动态', N'127.0.0.1', CAST(N'2019-07-23 09:52:55.780' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (81, 5, N'Qiju', 1, N'Edit', N'保存频道排序', N'127.0.0.1', CAST(N'2019-07-23 09:53:14.940' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (82, 5, N'Qiju', 1, N'Edit', N'修改频道新闻动态', N'127.0.0.1', CAST(N'2019-07-23 09:53:23.027' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (83, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-07-23 09:55:35.307' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (84, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-07-25 09:19:01.857' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (85, 5, N'Qiju', 1, N'Login', N'用户登录', N'127.0.0.1', CAST(N'2019-08-05 11:57:32.827' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (86, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-08-05 13:22:45.257' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (87, 5, N'Qiju', 1, N'Edit', N'修改频道产品中心', N'127.0.0.1', CAST(N'2019-08-05 13:24:04.967' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (88, 5, N'Qiju', 1, N'Edit', N'修改频道工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:24:20.037' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (89, 5, N'Qiju', 1, N'Edit', N'修改频道新闻资讯', N'127.0.0.1', CAST(N'2019-08-05 13:24:27.360' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (90, 5, N'Qiju', 1, N'Edit', N'修改频道工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:24:34.740' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (91, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:35:21.603' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (92, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:35:25.427' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (93, 5, N'Qiju', 1, N'Edit', N'删除case频道内容成功10条，失败0条', N'127.0.0.1', CAST(N'2019-08-05 13:35:35.657' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (94, 5, N'Qiju', 1, N'Edit', N'删除case频道内容成功2条，失败0条', N'127.0.0.1', CAST(N'2019-08-05 13:35:40.647' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (95, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:00.217' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (96, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:03.730' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (97, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:06.473' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (98, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:09.280' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (99, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:12.187' AS DateTime))
GO
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (100, 5, N'Qiju', 1, N'Edit', N'修改case频道内容:工程案例', N'127.0.0.1', CAST(N'2019-08-05 13:36:15.060' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (101, 5, N'Qiju', 1, N'Add', N'添加news频道栏目分类:行业资讯', N'127.0.0.1', CAST(N'2019-08-05 13:44:46.057' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (102, 5, N'Qiju', 1, N'Add', N'添加news频道内容:原材料疯涨，焊材经销商如何应对？', N'127.0.0.1', CAST(N'2019-08-05 13:45:26.303' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (103, 5, N'Qiju', 1, N'Add', N'添加news频道内容:焊材的储存、发放、回收，这些细节对焊接很重要！', N'127.0.0.1', CAST(N'2019-08-05 13:46:51.807' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (104, 5, N'Qiju', 1, N'Add', N'添加news频道内容:船舶制造过程中如何选用合适的焊材', N'127.0.0.1', CAST(N'2019-08-05 13:48:16.163' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (105, 5, N'Qiju', 1, N'Add', N'添加news频道内容:镍基焊条，国产品牌真的比国外差吗？有人做了试验对比', N'127.0.0.1', CAST(N'2019-08-05 13:49:37.360' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (106, 5, N'Qiju', 1, N'Add', N'添加news频道内容:焊材选用的基本原则', N'127.0.0.1', CAST(N'2019-08-05 13:50:35.080' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (107, 5, N'Qiju', 1, N'Add', N'添加news频道内容:焊材经销商不愿代理小品牌？如何识别小品牌的“黑马”才是盈利关键', N'127.0.0.1', CAST(N'2019-08-05 13:51:05.143' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (108, 5, N'Qiju', 1, N'Add', N'添加news频道内容:焊材的保管常识看这里！', N'127.0.0.1', CAST(N'2019-08-05 13:51:36.227' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (109, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:联系我们', N'127.0.0.1', CAST(N'2019-08-05 13:52:09.683' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (110, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:联系我们/首页', N'127.0.0.1', CAST(N'2019-08-05 13:52:13.933' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (111, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:联系我们/侧栏', N'127.0.0.1', CAST(N'2019-08-05 13:52:18.110' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (112, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:公司简介', N'127.0.0.1', CAST(N'2019-08-05 13:52:53.950' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (113, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:公司简介/首页', N'127.0.0.1', CAST(N'2019-08-05 13:53:09.023' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (114, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:30银焊条', N'127.0.0.1', CAST(N'2019-08-05 14:04:49.553' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (115, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:钴基焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:04:53.867' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (116, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:铝硅药芯焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:04:57.893' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (117, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:铝及铝合金焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:05:02.950' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (118, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:铜及铜合金焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:05:08.660' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (119, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:铜铝焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:05:15.427' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (120, 5, N'Qiju', 1, N'Add', N'添加product频道栏目分类:银焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:05:24.130' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (121, 5, N'Qiju', 1, N'Add', N'添加product频道内容:2%银磷铜焊丝L209', N'127.0.0.1', CAST(N'2019-08-05 14:07:39.570' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (122, 5, N'Qiju', 1, N'Add', N'添加product频道内容:25％银焊条 L302', N'127.0.0.1', CAST(N'2019-08-05 14:11:52.440' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (123, 5, N'Qiju', 1, N'Add', N'添加product频道内容:25%银锡焊丝L302', N'127.0.0.1', CAST(N'2019-08-05 14:13:22.723' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (124, 5, N'Qiju', 1, N'Edit', N'修改product频道内容:25%银锡焊丝L302', N'127.0.0.1', CAST(N'2019-08-05 14:13:48.310' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (125, 5, N'Qiju', 1, N'Edit', N'修改product频道内容:25%银锡焊丝L302', N'127.0.0.1', CAST(N'2019-08-05 14:14:21.763' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (126, 5, N'Qiju', 1, N'Edit', N'删除product频道内容成功2条，失败0条', N'127.0.0.1', CAST(N'2019-08-05 14:18:23.017' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (127, 5, N'Qiju', 1, N'Add', N'添加product频道内容:s213磷青铜焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:19:45.023' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (128, 5, N'Qiju', 1, N'Add', N'添加product频道内容:S215铝青铜焊丝 型号ERCUA1-A2 SCU6180', N'127.0.0.1', CAST(N'2019-08-05 14:20:12.800' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (129, 5, N'Qiju', 1, N'Add', N'添加product频道内容:ER4043铝硅焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:22:16.437' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (130, 5, N'Qiju', 1, N'Add', N'添加product频道内容:ER4047 铝硅焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:22:41.577' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (131, 5, N'Qiju', 1, N'Add', N'添加product频道内容:铝焊丝5356', N'127.0.0.1', CAST(N'2019-08-05 14:24:01.690' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (132, 5, N'Qiju', 1, N'Add', N'添加product频道内容:铝镁ER5356焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:24:33.080' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (133, 5, N'Qiju', 1, N'Add', N'添加product频道内容:铝镁焊丝ER5556', N'127.0.0.1', CAST(N'2019-08-05 14:24:55.753' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (134, 5, N'Qiju', 1, N'Add', N'添加product频道内容:铝青铜焊丝S215', N'127.0.0.1', CAST(N'2019-08-05 14:25:22.803' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (135, 5, N'Qiju', 1, N'Add', N'添加product频道内容:铝铜焊丝ER2319', N'127.0.0.1', CAST(N'2019-08-05 14:25:48.587' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (136, 5, N'Qiju', 1, N'Edit', N'修改频道产品中心', N'127.0.0.1', CAST(N'2019-08-05 14:26:54.537' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (137, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:30银焊条', N'127.0.0.1', CAST(N'2019-08-05 14:27:13.447' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (138, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:28:08.063' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (139, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:29:08.137' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (140, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:30银焊条', N'127.0.0.1', CAST(N'2019-08-05 14:29:22.663' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (141, 5, N'Qiju', 1, N'Edit', N'修改danye频道内容:公司简介/首页', N'127.0.0.1', CAST(N'2019-08-05 14:29:37.817' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (142, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:31:41.290' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (143, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:32:08.353' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (144, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:33:24.700' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (145, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:34:23.770' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (146, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:35:01.463' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (147, 5, N'Qiju', 1, N'Build', N'生成模板:demo', N'127.0.0.1', CAST(N'2019-08-05 14:35:16.780' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (148, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:钴基焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:36:24.120' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (149, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:铝硅药芯焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:36:33.670' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (150, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:铝及铝合金焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:36:47.483' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (151, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:铜及铜合金焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:37:00.383' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (152, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:铜铝焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:37:14.597' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (153, 5, N'Qiju', 1, N'Edit', N'修改product频道栏目分类:银焊丝', N'127.0.0.1', CAST(N'2019-08-05 14:37:29.050' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (154, 5, N'Qiju', 1, N'Edit', N'修改邮件模板:在线留言', N'127.0.0.1', CAST(N'2019-08-05 14:43:04.757' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (155, 5, N'Qiju', 1, N'Add', N'添加danye频道内容:11', N'127.0.0.1', CAST(N'2019-08-07 11:56:32.627' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (156, 5, N'Qiju', 1, N'Edit', N'删除danye频道内容成功1条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 11:56:35.477' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (157, 5, N'Qiju', 1, N'Add', N'添加product频道内容:33', N'127.0.0.1', CAST(N'2019-08-07 14:21:24.367' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (158, 5, N'Qiju', 1, N'Edit', N'删除product频道内容成功10条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 14:21:27.693' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (159, 5, N'Qiju', 1, N'Edit', N'删除product频道内容成功10条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 14:21:29.713' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (160, 5, N'Qiju', 1, N'Edit', N'删除product频道内容成功5条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 14:21:31.217' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (161, 5, N'Qiju', 1, N'Edit', N'删除product频道栏目分类数据', N'127.0.0.1', CAST(N'2019-08-07 14:21:33.483' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (162, 5, N'Qiju', 1, N'Edit', N'删除case频道内容成功6条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 14:21:36.173' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (163, 5, N'Qiju', 1, N'Edit', N'删除news频道内容成功7条，失败0条', N'127.0.0.1', CAST(N'2019-08-07 14:21:38.800' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (164, 5, N'Qiju', 1, N'Edit', N'删除news频道栏目分类数据', N'127.0.0.1', CAST(N'2019-08-07 14:21:40.950' AS DateTime))
INSERT [dbo].[qj_manager_log] ([id], [user_id], [user_name], [role_type], [action_type], [remark], [user_ip], [add_time]) VALUES (165, 5, N'Qiju', 1, N'Edit', N'修改系统配置信息', N'127.0.0.1', CAST(N'2019-08-07 14:22:03.990' AS DateTime))
SET IDENTITY_INSERT [dbo].[qj_manager_log] OFF
SET IDENTITY_INSERT [dbo].[qj_manager_role] ON 

INSERT [dbo].[qj_manager_role] ([id], [role_name], [role_type], [is_sys]) VALUES (1, N'超级管理组', 1, 1)
INSERT [dbo].[qj_manager_role] ([id], [role_name], [role_type], [is_sys]) VALUES (2, N'系统管理员', 2, 0)
SET IDENTITY_INSERT [dbo].[qj_manager_role] OFF
SET IDENTITY_INSERT [dbo].[qj_manager_role_value] ON 

INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (26, 2, N'sys_contents', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (27, 2, N'channel_main', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (28, 2, N'channel_home', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (29, 2, N'channel_home_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (30, 2, N'channel_home_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (31, 2, N'channel_home_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (32, 2, N'channel_about', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (33, 2, N'channel_about_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (34, 2, N'channel_about_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (35, 2, N'channel_about_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (36, 2, N'channel_material', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (37, 2, N'channel_material_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (38, 2, N'channel_material_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (39, 2, N'channel_material_list', N'Add')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (40, 2, N'channel_material_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (41, 2, N'channel_material_list', N'Delete')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (42, 2, N'channel_case', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (43, 2, N'channel_case_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (44, 2, N'channel_case_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (45, 2, N'channel_case_list', N'Add')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (46, 2, N'channel_case_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (47, 2, N'channel_case_list', N'Delete')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (48, 2, N'channel_recruitment', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (49, 2, N'channel_recruitment_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (50, 2, N'channel_recruitment_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (51, 2, N'channel_recruitment_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (52, 2, N'channel_contact', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (53, 2, N'channel_contact_list', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (54, 2, N'channel_contact_list', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (55, 2, N'channel_contact_list', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (56, 2, N'sys_application', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (57, 2, N'sys_plugin', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (58, 2, N'plugins_special_seo', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (59, 2, N'plugins_special_seo', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (60, 2, N'plugins_special_seo', N'Edit')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (61, 2, N'sys_controller', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (62, 2, N'sys_settings', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (63, 2, N'sys_config', N'Show')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (64, 2, N'sys_config', N'View')
INSERT [dbo].[qj_manager_role_value] ([id], [role_id], [nav_name], [action_type]) VALUES (65, 2, N'sys_config', N'Edit')
SET IDENTITY_INSERT [dbo].[qj_manager_role_value] OFF
SET IDENTITY_INSERT [dbo].[qj_navigation] ON 

INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (1, 0, 0, N'System', N'sys_contents', N'网站内容', N'站点', N'/qiju123/skin/default/nav/home.png', NULL, 99, 0, N'系统默认导航，不可更改导航ID', N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (2, 0, 0, N'System', N'sys_application', N'应用管理', N'应用', N'/qiju123/skin/default/nav/pus.png', NULL, 100, 0, N'系统默认导航，不可更改导航ID', N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (3, 0, 0, N'System', N'sys_users', N'会员管理', N'会员', N'/qiju123/skin/default/nav/user.png', NULL, 101, 0, N'系统默认导航，不可更改导航ID', N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (4, 0, 0, N'System', N'sys_orders', N'订单管理', N'订单', N'/qiju123/skin/default/nav/order.png', NULL, 102, 1, N'系统默认导航，不可更改导航ID', N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (5, 0, 0, N'System', N'sys_controller', N'控制面板', N'控制面板', N'/qiju123/skin/default/nav/sys.png', NULL, 103, 0, N'系统默认导航，不可更改导航ID', N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (6, 5, 0, N'System', N'sys_settings', N'系统管理', NULL, NULL, NULL, 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (7, 5, 0, N'System', N'sys_site_settings', N'站点设置', NULL, NULL, NULL, 100, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (8, 5, 0, N'System', N'sys_manager', N'系统用户', NULL, NULL, NULL, 101, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (9, 5, 0, N'System', N'sys_design', N'界面管理', NULL, NULL, NULL, 102, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (10, 2, 0, N'System', N'sys_plugin', N'工具插件', NULL, NULL, NULL, 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (11, 6, 0, N'System', N'sys_config', N'系统设置', NULL, NULL, N'settings/sys_config.aspx', 99, 0, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (12, 6, 0, N'System', N'sys_permissions', N'功能权限', NULL, NULL, N'settings/sys_permissions.aspx', 100, 0, NULL, N'Show,View,Edit', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (13, 6, 0, N'System', N'sys_url_rewrite', N'URL配置', NULL, NULL, N'settings/url_rewrite_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (14, 7, 0, N'System', N'sys_site_manage', N'站点管理', NULL, NULL, N'channel/site_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (15, 7, 0, N'System', N'sys_channel_manage', N'频道管理', NULL, NULL, N'channel/channel_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (16, 7, 0, N'System', N'sys_channel_field', N'扩展字段', NULL, NULL, N'channel/attribute_field_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (17, 7, 0, N'System', N'sys_goods_brands', N'商品品牌', NULL, NULL, N'channel/brand_list.aspx', 102, 1, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (18, 7, 0, N'System', N'sys_goods_spec', N'商品SKU', NULL, NULL, N'channel/spec_list.aspx', 103, 1, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (19, 7, 0, N'System', N'sys_article_tags', N'Tags标签', NULL, NULL, N'channel/tags_list.aspx', 104, 1, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (20, 8, 0, N'System', N'manager_role', N'角色管理', NULL, NULL, N'manager/role_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (21, 8, 0, N'System', N'manager_list', N'管理员管理', NULL, NULL, N'manager/manager_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (22, 8, 0, N'System', N'manager_log', N'管理日志', NULL, NULL, N'manager/manager_log.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (23, 9, 0, N'System', N'sys_site_templet', N'模板管理', NULL, NULL, N'settings/templet_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Build', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (24, 9, 0, N'System', N'sys_builder_html', N'生成静态', NULL, NULL, N'settings/builder_html.aspx', 100, 1, NULL, N'Show,View,Build', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (25, 9, 0, N'System', N'sys_navigation', N'后台导航', NULL, NULL, N'settings/nav_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (26, 10, 0, N'System', N'plugins_db_backup', N'数据备份', N'', N'', N'plugins/db_back.aspx', 99, 1, N'', N'Show,View,Delete,Back,Restore,Download,Compact', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (27, 10, 0, N'System', N'plugins_script_codes', N'统计代码', NULL, NULL, N'plugins/script_code_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (28, 10, 0, N'System', N'plugins_special_seo', N'SEO优化', N'', N'', N'plugins/special_seo.aspx', 101, 0, N'', N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (29, 10, 0, N'System', N'plugins_links', N'友情链接', NULL, NULL, N'plugins/link_list.aspx', 102, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (30, 10, 0, N'System', N'plugins_feedback', N'在线留言', NULL, NULL, N'plugins/feedback_list.aspx', 103, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (31, 10, 0, N'System', N'plugins_files', N'文件管理', N'', N'', N'plugins/files.aspx', 104, 1, N'', N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (32, 10, 0, N'System', N'plugins_search_keywords', N'热门搜索', N'', N'', N'plugins/search_keywords.aspx', 105, 1, N'', N'Show,View,Add,Edit,Delete', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (33, 10, 0, N'System', N'plugins_adverts', N'广告管理', N'', N'', N'', 106, 1, N'', N'Show', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (34, 33, 0, N'System', N'plugins_advert_group', N'广告位', NULL, NULL, N'plugins/advert_group.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (35, 33, 0, N'System', N'plugins_advert_list', N'广告列表', NULL, NULL, N'plugins/advert_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (36, 10, 0, N'System', N'plugins_online', N'在线客服', N'', N'', N'', 107, 1, N'', N'Show', 1, 0)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (37, 36, 0, N'System', N'plugins_online_group', N'客服分组', NULL, NULL, N'plugins/online_group.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (38, 36, 0, N'System', N'plugins_online_servers', N'客服列表', NULL, NULL, N'plugins/online_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (39, 3, 0, N'System', N'user_manage', N'会员管理', NULL, NULL, NULL, 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (40, 39, 0, N'System', N'user_group', N'会员组', NULL, NULL, N'users/group_list.aspx', 99, 1, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (41, 39, 0, N'System', N'user_list', N'会员列表', NULL, NULL, N'users/user_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (42, 39, 0, N'System', N'user_audit', N'审核会员', NULL, NULL, N'users/user_audit.aspx', 101, 0, NULL, N'Show,View,Audit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (43, 3, 0, N'System', N'user_log', N'会员日志', NULL, NULL, NULL, 100, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (44, 43, 0, N'System', N'user_sms', N'发送短信', NULL, NULL, N'users/user_sms.aspx', 99, 0, NULL, N'Show,View,Add', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (45, 43, 0, N'System', N'user_message', N'站内消息', NULL, NULL, N'users/message_list.aspx', 100, 0, NULL, N'Show,View,Add,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (46, 43, 0, N'System', N'user_recharge_log', N'充值记录', NULL, NULL, N'users/recharge_list.aspx', 101, 0, NULL, N'Show,View,Add,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (47, 43, 0, N'System', N'user_amount_log', N'消费记录', NULL, NULL, N'users/amount_log.aspx', 102, 1, NULL, N'Show,View,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (48, 43, 0, N'System', N'user_point_log', N'积分记录', NULL, NULL, N'users/point_log.aspx', 103, 1, NULL, N'Show,View,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (49, 3, 0, N'System', N'user_settings', N'会员设置', NULL, NULL, NULL, 101, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (50, 49, 0, N'System', N'user_config', N'参数设置', NULL, NULL, N'users/user_config.aspx', 99, 0, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (51, 49, 0, N'System', N'user_sms_template', N'短信模板', NULL, NULL, N'users/sms_template_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (52, 49, 0, N'System', N'user_mail_template', N'邮件模板', NULL, NULL, N'users/mail_template_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (53, 49, 0, N'System', N'user_oauth', N'OAuth设置', NULL, NULL, N'users/oauth_app_list.aspx', 102, 1, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (54, 4, 0, N'System', N'order_manage', N'订单管理', NULL, NULL, NULL, 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (55, 54, 0, N'System', N'order_list', N'所有订单', NULL, NULL, N'order/order_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Confirm,Cancel,Invalid', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (56, 54, 0, N'System', N'order_confirm', N'待确认订单', NULL, NULL, N'order/order_confirm.aspx', 100, 0, NULL, N'Show,View,Confirm', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (57, 54, 0, N'System', N'order_paypal', N'待支付订单', NULL, NULL, N'order/order_paypal.aspx', 101, 0, NULL, N'Show,View,Confirm', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (58, 54, 0, N'System', N'order_deliver', N'待发货订单', NULL, NULL, N'order/order_deliver.aspx', 102, 0, NULL, N'Show,View,Confirm', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (59, 54, 0, N'System', N'order_comment', N'待评价订单', NULL, NULL, N'order/order_comment.aspx', 103, 0, NULL, N'Show,View,Confirm', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (60, 54, 0, N'System', N'order_recycle', N'订单回收站', NULL, NULL, N'order/order_recycle.aspx', 104, 0, NULL, N'Show,View,Confirm', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (61, 4, 0, N'System', N'order_settings', N'订单设置', NULL, NULL, NULL, 100, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (62, 61, 0, N'System', N'order_config', N'订单参数设置', NULL, NULL, N'order/order_config.aspx', 99, 0, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (63, 61, 0, N'System', N'order_payment', N'支付方式设置', NULL, NULL, N'order/payment_list.aspx', 100, 1, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (64, 61, 0, N'System', N'order_express', N'配送方式设置', NULL, NULL, N'order/express_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (65, 2, 0, N'System', N'sys_weixin_message', N'微信平台', NULL, NULL, NULL, 100, 1, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (66, 65, 0, N'System', N'weixin_base_settings', N'基本设置', NULL, NULL, NULL, 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (67, 66, 0, N'System', N'weixin_account_manage', N'公众平台管理', NULL, NULL, N'weixin/account_edit.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (68, 66, 0, N'System', N'weixin_custom_menu', N'自定义菜单', NULL, NULL, N'weixin/menu_edit.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (69, 65, 0, N'System', N'weixin_message_manage', N'消息管理', NULL, NULL, NULL, 100, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (70, 69, 0, N'System', N'weixin_subscribe_subscribe', N'关注回复', NULL, NULL, N'weixin/subscribe_edit.aspx?action=subscribe', 99, 0, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (71, 69, 0, N'System', N'weixin_subscribe_default', N'默认回复', NULL, NULL, N'weixin/subscribe_edit.aspx?action=default', 100, 0, NULL, N'Show,View,Edit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (72, 69, 0, N'System', N'weixin_response_text', N'文本回复', NULL, NULL, N'weixin/text_list.aspx', 101, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (73, 69, 0, N'System', N'weixin_response_picture', N'图文回复', NULL, NULL, N'weixin/picture_list.aspx', 102, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (74, 69, 0, N'System', N'weixin_response_sound', N'语音回复', NULL, NULL, N'weixin/sound_list.aspx', 103, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (75, 69, 0, N'System', N'weixin_response_content', N'消息记录', NULL, NULL, N'weixin/response_list.aspx', 104, 0, NULL, N'Show,View,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (76, 1, 0, N'System', N'channel_main', N'默认站点', NULL, NULL, N'', 1, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (81, 76, 3, N'System', N'channel_product', N'产品中心', NULL, NULL, N'', 1, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (82, 81, 3, N'System', N'channel_product_list', N'内容管理', NULL, NULL, N'article/article_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Audit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (83, 76, 4, N'System', N'channel_case', N'工程案例', NULL, NULL, N'', 2, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (84, 83, 4, N'System', N'channel_case_list', N'内容管理', NULL, NULL, N'article/article_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Audit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (89, 76, 7, N'System', N'channel_news', N'新闻资讯', NULL, NULL, N'', 3, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (90, 89, 7, N'System', N'channel_news_list', N'内容管理', NULL, NULL, N'article/article_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Audit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (91, 81, 3, N'System', N'channel_product_category', N'栏目类别', NULL, NULL, N'article/category_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (92, 76, 8, N'System', N'channel_danye', N'单页管理', NULL, NULL, N'', 99, 0, NULL, N'Show', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (93, 92, 8, N'System', N'channel_danye_list', N'内容管理', NULL, NULL, N'article/article_list.aspx', 99, 0, NULL, N'Show,View,Add,Edit,Delete,Audit', 1, 1)
INSERT [dbo].[qj_navigation] ([id], [parent_id], [channel_id], [nav_type], [name], [title], [sub_title], [icon_url], [link_url], [sort_id], [is_lock], [remark], [action_type], [is_sys], [is_customer]) VALUES (94, 89, 7, N'System', N'channel_news_category', N'栏目类别', NULL, NULL, N'article/category_list.aspx', 100, 0, NULL, N'Show,View,Add,Edit,Delete', 1, 1)
SET IDENTITY_INSERT [dbo].[qj_navigation] OFF
SET IDENTITY_INSERT [dbo].[qj_payment] ON 

INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (1, N'货到付款', N'', N'收到商品后进行支付，支持现金和刷卡服务。', 2, 2, 0.0000, 99, 0, 0, 1, N'')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (2, N'账户余额', N'', N'账户余额是客户在您网站上的账户虚拟资金', 1, 2, 0.0000, 100, 0, 0, 0, N'balance')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (3, N'支付宝', N'', N'付款后立即到账，无预付/年费，单笔费率阶梯最低0.7%，无流量限制。<a href="https://www.alipay.com/himalayas/practicality_customer.htm?customer_external_id=C433530444855584111X&market_type=from_agent_contract&pro_codes=61F99645EC0DC4380ADE569DD132AD7A" target="_blank">立即申请</a>', 1, 2, 0.0000, 101, 1, 0, 0, N'alipaypc')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (4, N'财付通', N'', N'费率最低至<span style="color:#FF0000;font-weight: bold;">0.61%</span>，并赠送价值千元企业QQ。<a href="http://union.tenpay.com/mch/mch_register.shtml?sp_suggestuser=1202822001" target="_blank">中小商家签约入口</a>', 1, 2, 0.0000, 102, 1, 0, 0, N'tenpaypc')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (5, N'网银在线', N'', N'国内领先的电子支付解决方案提供商，专注于为各行业提供安全、便捷的综合电子支付服务。', 1, 2, 0.0000, 103, 1, 0, 0, N'chinabankpc')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (6, N'支付宝手机支付', NULL, N'支付宝手机网站支付主要应用于手机、掌上电脑等无线设备的网页上。', 1, 2, 0.0000, 104, 2, 0, 0, N'alipaymb')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (7, N'微信扫码支付', NULL, N'扫码支付是商户系统按微信支付协议生成支付二维码，用户再用微信“扫一扫”完成支付的模式。', 1, 2, 0.0000, 105, 1, 0, 0, N'wxnatpay')
INSERT [dbo].[qj_payment] ([id], [title], [img_url], [remark], [type], [poundage_type], [poundage_amount], [sort_id], [is_mobile], [is_lock], [is_license], [api_path]) VALUES (8, N'微信公众号支付', NULL, N'公众号支付是用户在微信中打开商户的H5页面，商户在H5页面调起微信的JSAPI接口完成支付。', 0, 2, 0.0000, 106, 2, 0, 0, N'wxapipay')
SET IDENTITY_INSERT [dbo].[qj_payment] OFF
SET IDENTITY_INSERT [dbo].[qj_seo_list] ON 

INSERT [dbo].[qj_seo_list] ([id], [call_index], [title], [seo_title], [seo_keywords], [seo_description]) VALUES (4, N'seo', N'seo', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[qj_seo_list] OFF
SET IDENTITY_INSERT [dbo].[qj_sms_template] ON 

INSERT [dbo].[qj_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (1, N'会员验证码短信', N'usercode', N'您的验证码为：{code}，{valid}分钟内有效。', 1)
INSERT [dbo].[qj_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (2, N'欢迎新用户短信', N'welcomemsg', N'欢迎成为{webname}会员，你的用户名为：{username}，注意保管好您的账户信息。', 1)
INSERT [dbo].[qj_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (3, N'订单确认通知', N'order_confirm', N'尊敬的{username}，您在{webname}的订单已确认，订单号为：{orderno}，共计{amount}元，我们会尽快安排发货。', 1)
INSERT [dbo].[qj_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (4, N'订单发货通知', N'order_express', N'尊敬的{username}，您在{webname}的订单已发货，订单号为：{orderno}，请注意查收。', 1)
INSERT [dbo].[qj_sms_template] ([id], [title], [call_index], [content], [is_sys]) VALUES (5, N'订单完成通知', N'order_complete', N'尊敬的{username}，您在{webname}的一笔订单交易完成，订单号为：{orderno}，期待下次光临，祝您购物愉快。', 1)
SET IDENTITY_INSERT [dbo].[qj_sms_template] OFF
SET IDENTITY_INSERT [dbo].[qj_user_oauth_app] ON 

INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (1, N'用QQ帐号登录', N'/images/oauth/qq.png', N'API Key', N'Secret Key', N'QQ互联开放平台', 99, 0, 0, N'qq')
INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (2, N'用新浪微博登录', N'/images/oauth/weibo.png', N'API Key', N'Secret Key', N'新浪微博开放平台', 100, 0, 0, N'sina')
INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (3, N'用淘宝账号登录', N'/images/oauth/taobao.png', N'API Key', N'Secret Key', N'淘宝开放平台', 101, 0, 0, N'taobao')
INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (4, N'用开心网帐号登录', N'/images/oauth/kaixin.png', N'API Key', N'Secret Key', N'开心网开放平台', 102, 0, 0, N'kaixin')
INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (5, N'用人人网帐号登录', N'/images/oauth/renren.png', N'API Key', N'Secret Key', N'人人网开放平台', 103, 0, 0, N'renren')
INSERT [dbo].[qj_user_oauth_app] ([id], [title], [img_url], [app_id], [app_key], [remark], [sort_id], [is_mobile], [is_lock], [api_path]) VALUES (6, N'用飞信账号登录', N'/images/oauth/feixin.png', N'API Key', N'Secret Key', N'中国移动飞信开放平台', 104, 0, 0, N'feixin')
SET IDENTITY_INSERT [dbo].[qj_user_oauth_app] OFF
