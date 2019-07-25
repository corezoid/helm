INSERT INTO users ( name, lang ) VALUES ( 'system_timer', NULL ) returning id;
INSERT INTO logins ( login, type, hash1 ) VALUES ( 'admin@corezoid.loc', 7, '021b4a15cde3cf88c15cfbfc26c94df4ab2ab019' ) returning id;
INSERT INTO users ( name, lang ) VALUES ( 'Admin', NULL ) returning id;
INSERT INTO user_groups ( name, type ) VALUES ( 'root', 1 ) returning id;
INSERT INTO login_to_users ( user_id, login_id ) VALUES ( 1, 1 );
-- INSERT INTO user_to_user_groups ( user_id, user_group_id ) VALUES ( 1, 1 );
INSERT INTO user_groups ( name, type ) VALUES ( 'all', 0 ) returning id;



INSERT INTO user_groups (owner_user_id, name, type, company_id) VALUES (1, 'root_company', 12, 'i24759340') RETURNING id;
INSERT INTO companies (company_id, name, owner_user_id, last_editor_user_id) VALUES ('i24759340', 'CTRL', 1, 1);
INSERT INTO user_to_user_groups ( user_id, user_group_id ) VALUES ( 1, 1 );
INSERT INTO user_to_companies (user_id, company_id, role_id) VALUES (1, 'i24759340',1);


INSERT INTO folder_content (folder_id, obj_type, obj_id, id) VALUES (2, 1, 3, 1);
SELECT pg_catalog.setval('folder_content_id_seq', 1, true);
INSERT INTO folders (id, title, description, create_time, owner_id, type, change_time, user_id, status, company_id, project_id) VALUES (1, 'FavoriteFolder', 'FavoriteFolder', 1559815556, 1, 2, 1559815556, NULL, 1, NULL, NULL);
INSERT INTO folders (id, title, description, create_time, owner_id, type, change_time, user_id, status, company_id, project_id) VALUES (2, 'UserFolder', 'UserFolder', 1559815559, 1, 1, 1559815559, NULL, 1, NULL, NULL);
SELECT pg_catalog.setval('folders_id_seq', 2, true);
INSERT INTO history (obj_id, obj_type, user_id, change_time, title, action_type, id) VALUES (4, 6, 1, 1559815572, 'supergroup', 1, 1);
INSERT INTO history (obj_id, obj_type, user_id, change_time, title, action_type, id) VALUES (3, 9, 1, 1559815615, '1 system_timer change privs for object - 3', 11, 2);
SELECT pg_catalog.setval('folders_id_seq', 2, true);
INSERT INTO history (obj_id, obj_type, user_id, change_time, title, action_type, id) VALUES (4, 6, 1, 1559815572, 'supergroup', 1, 1);
INSERT INTO history (obj_id, obj_type, user_id, change_time, title, action_type, id) VALUES (3, 9, 1, 1559815615, '1 system_timer change privs for object - 3', 11, 2);
SELECT pg_catalog.setval('history_id_seq', 2, true);
INSERT INTO history_v2 (id, create_time, level, path, vsn, user_id, service, ip, request, response) VALUES (1, 1559815572, 'OK', '', 2, 1, 'cor', '89.28.206.250', '{"ops":[{"title":"supergroup","type":"create","obj":"group","obj_type":"admins"}]}', '[{"id":"","proc":"ok","obj":"group","obj_id":4}]');
INSERT INTO history_v2 (id, create_time, level, path, vsn, user_id, service, ip, request, response) VALUES (2, 1559815584, 'OK', '', 2, 1, 'cor', '89.28.206.250', '{"ops":[{"title":"superapi","logins":[{"type":"api"}],"type":"create","obj":"user"}]}', '[{"id":"","obj":"user","proc":"ok","users":[{"obj_id":3,"title":"superapi","logins":[{"type":"api","key":"NE4wzHnodH9sbTeEfNaxDx23scM0ZaLS76xBiSIBhqT7EL4M3e","obj_id":2}]}]}]');
INSERT INTO history_v2 (id, create_time, level, path, vsn, user_id, service, ip, request, response) VALUES (3, 1559815615, 'OK', '', 2, 1, 'cor', '89.28.206.250', '{"ops":[{"group_id":4,"obj_id":3,"obj":"user","type":"link","level":1}]}', '[{"id":"","proc":"ok","obj":"user","logins":[{"type":"api","login":"5cf8e5a08ce8910001000001","key":"NE4wzHnodH9sbTeEfNaxDx23scM0ZaLS76xBiSIBhqT7EL4M3e","obj_id":2}],"obj_id":3}]');
SELECT pg_catalog.setval('history_v2_id_seq', 3, true);
INSERT INTO history_v2_rows (id, history_id, severity, company_id, project_id, type, obj, obj_type, obj_id, obj_to, obj_to_id, request, response) VALUES (1, 1, 'INFO', NULL, NULL, 'create', 'group', 'group', 4, NULL, NULL, '{"title":"supergroup","type":"create","obj":"group","obj_type":"admins"}', '{"id":"","proc":"ok","obj":"group","obj_id":4}');
INSERT INTO history_v2_rows (id, history_id, severity, company_id, project_id, type, obj, obj_type, obj_id, obj_to, obj_to_id, request, response) VALUES (2, 2, 'INFO', NULL, NULL, 'create', 'user', NULL, NULL, NULL, NULL, '{"title":"superapi","logins":[{"type":"api"}],"type":"create","obj":"user"}', '{"id":"","obj":"user","proc":"ok","users":[{"obj_id":3,"title":"superapi","logins":[{"type":"api","key":"NE4wzHnodH9sbTeEfNaxDx23scM0ZaLS76xBiSIBhqT7EL4M3e","obj_id":2}]}]}');
INSERT INTO history_v2_rows (id, history_id, severity, company_id, project_id, type, obj, obj_type, obj_id, obj_to, obj_to_id, request, response) VALUES (3, 3, 'INFO', NULL, NULL, 'link', 'user', 'user', 3, 'group', 4, '{"group_id":4,"obj_id":3,"obj":"user","type":"link","level":1}', '{"id":"","proc":"ok","obj":"user","logins":[{"type":"api","login":"5cf8e5a08ce8910001000001","key":"NE4wzHnodH9sbTeEfNaxDx23scM0ZaLS76xBiSIBhqT7EL4M3e","obj_id":2}],"obj_id":3}');
SELECT pg_catalog.setval('history_v2_rows_id_seq', 3, true);
INSERT INTO login_to_users (user_id, login_id) VALUES (3, 2);
INSERT INTO logins (id, create_time, login, type, hash1, hash2) VALUES (2, 1559815584, '5cf8e5a08ce8910001000001', 4, 'NE4wzHnodH9sbTeEfNaxDx23scM0ZaLS76xBiSIBhqT7EL4M3e', NULL);
SELECT pg_catalog.setval('logins_id_seq', 2, true);
INSERT INTO user_groups (id, name, create_time, type, status, company_id, change_time, owner_user_id) VALUES (4, 'supergroup', 1559815572, 2, 1, NULL, 1559815572, 1);
INSERT INTO user_groups (id, name, create_time, type, status, company_id, change_time, owner_user_id) VALUES (5, 'root', 1559815584, 1, 1, NULL, 1559815584, NULL);
SELECT pg_catalog.setval('user_groups_id_seq', 5, true);
INSERT INTO user_to_user_groups (user_group_id, user_id) VALUES (5, 3);
INSERT INTO user_to_user_groups (user_group_id, user_id) VALUES (4, 3);
SELECT pg_catalog.setval('users_id_seq', 3, true);