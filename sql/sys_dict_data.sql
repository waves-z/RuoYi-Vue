-- 帖子状态字典数据
insert into sys_dict_data values(100, 'bbs_post_status',  '已发布',  '0', 'bbs_post_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, '帖子状态：已发布');
insert into sys_dict_data values(101, 'bbs_post_status',  '待审核',  '1', 'bbs_post_status',   '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, '帖子状态：待审核');
insert into sys_dict_data values(102, 'bbs_post_status',  '审核不通过',  '2', 'bbs_post_status',   '',   'danger',  'Y', '0', 'admin', sysdate(), '', null, '帖子状态：审核不通过'); 