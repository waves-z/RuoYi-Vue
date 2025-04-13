-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('论坛管理', '0', '1', 'bbs', null, 1, 0, 'M', '0', '0', '', 'el-icon-s-comment', 'admin', sysdate(), '', null, '论坛管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 帖子管理菜单
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子管理', @parentId, '1', 'post', 'bbs/post/index', 1, 0, 'C', '0', '0', 'bbs:post:list', 'el-icon-document', 'admin', sysdate(), '', null, '帖子管理菜单');

-- 帖子分类菜单
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子分类', @parentId, '2', 'category', 'bbs/category/index', 1, 0, 'C', '0', '0', 'bbs:category:list', 'el-icon-folder', 'admin', sysdate(), '', null, '帖子分类菜单');

-- 用户管理菜单
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用户管理', @parentId, '3', 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'el-icon-user', 'admin', sysdate(), '', null, '用户管理菜单');

-- 角色管理菜单
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('角色管理', @parentId, '4', 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'el-icon-s-custom', 'admin', sysdate(), '', null, '角色管理菜单');

-- 删除原有的系统管理下的用户管理和角色管理菜单
delete from sys_menu where menu_name in ('用户管理', '角色管理') and parent_id != @parentId;

-- 帖子管理按钮
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'bbs:post:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'bbs:post:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'bbs:post:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('帖子删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'bbs:post:remove',       '#', 'admin', sysdate(), '', null, ''); 