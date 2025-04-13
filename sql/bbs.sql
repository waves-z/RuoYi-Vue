-- 帖子分类表
create table bbs_category (
   category_id        bigint(20)      not null auto_increment    comment '分类ID',
   category_name      varchar(50)     not null                   comment '分类名称',
   status            char(1)         default '0'                comment '状态（0正常 1停用）',
   order_num         int(4)          default 0                  comment '显示顺序',
   create_by         varchar(64)     default ''                 comment '创建者',
   create_time       datetime                                   comment '创建时间',
   update_by         varchar(64)     default ''                 comment '更新者',
   update_time       datetime                                   comment '更新时间',
   remark            varchar(500)    default ''                 comment '备注',
   primary key (category_id)
) engine=innodb auto_increment=100 comment = '帖子分类表';

-- 帖子表
create table bbs_post (
   post_id           bigint(20)      not null auto_increment    comment '帖子ID',
   post_title        varchar(150)    not null                   comment '帖子标题',
   post_content      text            not null                   comment '帖子内容',
   category_id       bigint(20)      not null                   comment '分类ID',
   user_id           bigint(20)      not null                   comment '发布人ID',
   user_name         varchar(30)     not null                   comment '发布人名称',
   status            char(1)         default '1'                comment '状态（0已发布 1待审核 2审核不通过）',
   view_count        bigint(20)      default 0                  comment '浏览量',
   like_count        bigint(20)      default 0                  comment '点赞数',
   comment_count     bigint(20)      default 0                  comment '评论数',
   create_by         varchar(64)     default ''                 comment '创建者',
   create_time       datetime                                   comment '创建时间',
   update_by         varchar(64)     default ''                 comment '更新者',
   update_time       datetime                                   comment '更新时间',
   remark            varchar(500)    default ''                 comment '备注',
   primary key (post_id)
) engine=innodb auto_increment=100 comment = '帖子表';

-- 帖子评论表
create table bbs_comment (
   comment_id        bigint(20)      not null auto_increment    comment '评论ID',
   post_id           bigint(20)      not null                   comment '帖子ID',
   parent_id         bigint(20)      default 0                  comment '父评论ID',
   content           varchar(500)    not null                   comment '评论内容',
   user_id           bigint(20)      not null                   comment '评论人ID',
   user_name         varchar(30)     not null                   comment '评论人名称',
   status            char(1)         default '1'                comment '状态（0已发布 1待审核 2审核不通过）',
   like_count        bigint(20)      default 0                  comment '点赞数',
   create_by         varchar(64)     default ''                 comment '创建者',
   create_time       datetime                                   comment '创建时间',
   update_by         varchar(64)     default ''                 comment '更新者',
   update_time       datetime                                   comment '更新时间',
   remark            varchar(500)    default ''                 comment '备注',
   primary key (comment_id)
) engine=innodb auto_increment=100 comment = '帖子评论表';

-- 帖子点赞表
create table bbs_like (
   like_id           bigint(20)      not null auto_increment    comment '点赞ID',
   post_id           bigint(20)      not null                   comment '帖子ID',
   comment_id        bigint(20)      default 0                  comment '评论ID（0表示是帖子点赞）',
   user_id           bigint(20)      not null                   comment '用户ID',
   create_time       datetime                                   comment '创建时间',
   primary key (like_id),
   unique key idx_user_post_comment (user_id, post_id, comment_id)
) engine=innodb auto_increment=100 comment = '点赞表';

-- 初始化帖子分类数据
insert into bbs_category values(1, '通知公告', '0', 1, 'admin', sysdate(), '', null, '通知公告');
insert into bbs_category values(2, '交友板块', '0', 2, 'admin', sysdate(), '', null, '交友板块');
insert into bbs_category values(3, '风景分享', '0', 3, 'admin', sysdate(), '', null, '风景分享');
insert into bbs_category values(4, '技术交流', '0', 4, 'admin', sysdate(), '', null, '技术交流'); 