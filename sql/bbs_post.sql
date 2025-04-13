-- 帖子表
drop table if exists bbs_post;
create table bbs_post (
  post_id           bigint(20)      not null auto_increment    comment '帖子ID',
  post_title        varchar(255)    not null                   comment '帖子标题',
  post_content      text            not null                   comment '帖子内容',
  category_id       bigint(20)      not null                   comment '分类ID',
  category_name     varchar(50)                                comment '分类名称',
  author_id         bigint(20)      not null                   comment '作者ID',
  author_name       varchar(50)                                comment '作者名称',
  status            char(1)         default '1'                comment '状态（0已发布 1待审核 2审核不通过）',
  view_count        bigint(20)      default 0                  comment '浏览量',
  like_count        bigint(20)      default 0                  comment '点赞数',
  comment_count     bigint(20)      default 0                  comment '评论数',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time       datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark            varchar(500)    default null               comment '备注',
  primary key (post_id)
) engine=innodb auto_increment=100 comment = '帖子表'; 