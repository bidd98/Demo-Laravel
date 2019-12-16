BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `watches` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`category_id`	integer NOT NULL,
	`name`	varchar NOT NULL,
	`image`	varchar NOT NULL,
	`price`	float NOT NULL,
	`discount`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`) on update cascade,
	FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`) on delete cascade
);
INSERT INTO `watches` VALUES (1,1,'Lux2.a','watches/6RZw8iWm5ydUgtBndu4Qp1oFh0i4tc0MMRUGUbsA.jpeg',20.0,40,NULL,NULL);
INSERT INTO `watches` VALUES (2,1,'Lux2.c','watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',21.0,45,NULL,NULL);
INSERT INTO `watches` VALUES (3,1,'Lux2.d','watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',25.0,50,NULL,NULL);
INSERT INTO `watches` VALUES (4,2,'Layya','watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',10.0,20,NULL,NULL);
INSERT INTO `watches` VALUES (5,2,'Layya-royal','watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',30.0,60,NULL,NULL);
INSERT INTO `watches` VALUES (6,3,'Luxxu','watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',25.0,80,NULL,NULL);
INSERT INTO `watches` VALUES (7,3,'fooly','watches/qjshi0cFtvZzIS84I3BF5bJK9TedrCjMetqDTxds.jpeg',30.0,20,NULL,NULL);
INSERT INTO `watches` VALUES (8,4,'Royallya','watches/MhEl5S0BhgbdoXbL2v9dasWO3zhSoU9RsBxvReqo.jpeg',20.0,10,NULL,NULL);
INSERT INTO `watches` VALUES (9,4,'Batterle','watches/qjshi0cFtvZzIS84I3BF5bJK9TedrCjMetqDTxds.jpeg',20.0,40,NULL,NULL);
CREATE TABLE IF NOT EXISTS `users` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar,
	`email`	varchar NOT NULL,
	`email_verified_at`	datetime,
	`password`	varchar NOT NULL,
	`remember_token`	varchar,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `users` VALUES (1,'hung','hungnl.qb98@gmail.com',NULL,'$2y$10$cdZoGjfJ4JLye7ikhVQII.MuDkvKGpqh3Gs8x7chn0dOOCwx1C9t.','XVV1RWyDz2ahHyp1j5pImhdPJQdUOZkKok1uTj6bmtphHM4z6rOewmJDMi7Y',NULL,'2019-12-15 23:43:32');
INSERT INTO `users` VALUES (2,'khanh','test2@gmail.com',NULL,'$2y$10$PDIKp9mp3YWd/kfvI7XtreWiZH50rRU2ag/KgkxJfDfwloO2RKe3i',NULL,NULL,NULL);
INSERT INTO `users` VALUES (3,'dung','test3@gmail.com',NULL,'$2y$10$5fi2v5RXH0qXI66y2l8WA.JHcwrwNl9OsxHPWLGOEng85LP08Xazq',NULL,NULL,NULL);
CREATE TABLE IF NOT EXISTS `user_infos` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`user_id`	integer NOT NULL,
	`first_name`	varchar NOT NULL,
	`last_name`	varchar NOT NULL,
	`address`	varchar NOT NULL,
	`phone`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on update cascade,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on delete cascade
);
CREATE TABLE IF NOT EXISTS `roles` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`descrition`	text,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `roles` VALUES (1,'Admin',NULL,NULL,NULL);
INSERT INTO `roles` VALUES (2,'Guest',NULL,NULL,NULL);
CREATE TABLE IF NOT EXISTS `role_user` (
	`user_id`	integer NOT NULL,
	`role_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`) on update cascade,
	FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`) on delete cascade,
	PRIMARY KEY(`user_id`,`role_id`),
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on update cascade,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on delete cascade
);
INSERT INTO `role_user` VALUES (1,1,NULL,NULL);
INSERT INTO `role_user` VALUES (1,2,NULL,NULL);
INSERT INTO `role_user` VALUES (2,2,NULL,NULL);
CREATE TABLE IF NOT EXISTS `permissions` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`controller`	varchar NOT NULL,
	`method`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `permissions` VALUES (1,'WatchController','index',NULL,NULL);
INSERT INTO `permissions` VALUES (2,'WatchController','create',NULL,NULL);
INSERT INTO `permissions` VALUES (3,'WatchController','store',NULL,NULL);
INSERT INTO `permissions` VALUES (4,'WatchController','show',NULL,NULL);
INSERT INTO `permissions` VALUES (5,'WatchController','edit',NULL,NULL);
INSERT INTO `permissions` VALUES (6,'WatchController','update',NULL,NULL);
INSERT INTO `permissions` VALUES (7,'WatchController','destroy',NULL,NULL);
INSERT INTO `permissions` VALUES (8,'CategoryController','index',NULL,NULL);
INSERT INTO `permissions` VALUES (9,'CategoryController','create',NULL,NULL);
INSERT INTO `permissions` VALUES (10,'CategoryController','store',NULL,NULL);
INSERT INTO `permissions` VALUES (11,'CategoryController','edit',NULL,NULL);
INSERT INTO `permissions` VALUES (12,'CategoryController','update',NULL,NULL);
INSERT INTO `permissions` VALUES (13,'CategoryController','destroy',NULL,NULL);
INSERT INTO `permissions` VALUES (14,'PaymentController','confirm',NULL,NULL);
INSERT INTO `permissions` VALUES (15,'PaymentController','create',NULL,NULL);
INSERT INTO `permissions` VALUES (16,'PaymentController','return',NULL,NULL);
INSERT INTO `permissions` VALUES (17,'UserOrderController','index',NULL,NULL);
INSERT INTO `permissions` VALUES (18,'UserOrderController','show',NULL,NULL);
INSERT INTO `permissions` VALUES (19,'UserOrderController','processOrder',NULL,NULL);
INSERT INTO `permissions` VALUES (20,'UserOrderController','export',NULL,NULL);
INSERT INTO `permissions` VALUES (21,'OrderController','index',NULL,NULL);
INSERT INTO `permissions` VALUES (22,'OrderController','export',NULL,NULL);
INSERT INTO `permissions` VALUES (23,'OrderController','show',NULL,NULL);
INSERT INTO `permissions` VALUES (24,'HomeController','index',NULL,NULL);
CREATE TABLE IF NOT EXISTS `permission_role` (
	`permission_id`	integer NOT NULL,
	`role_id`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`) on update cascade,
	FOREIGN KEY(`permission_id`) REFERENCES `permissions`(`id`) on delete cascade,
	PRIMARY KEY(`permission_id`,`role_id`),
	FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`) on update cascade,
	FOREIGN KEY(`role_id`) REFERENCES `roles`(`id`) on delete cascade
);
INSERT INTO `permission_role` VALUES (1,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (2,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (3,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (4,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (5,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (6,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (7,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (8,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (9,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (10,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (11,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (12,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (13,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (21,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (22,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (23,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (24,1,NULL,NULL);
INSERT INTO `permission_role` VALUES (14,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (15,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (16,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (17,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (18,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (19,2,NULL,NULL);
INSERT INTO `permission_role` VALUES (20,2,NULL,NULL);
CREATE TABLE IF NOT EXISTS `password_resets` (
	`email`	varchar NOT NULL,
	`token`	varchar NOT NULL,
	`created_at`	datetime
);
INSERT INTO `password_resets` VALUES ('hungnl.qb98@gmail.com','$2y$10$Cdq3Kd9qrr2KSC7lPogxzuUKxEFjUFUw9MHZXaY0mx0kBiumOSgUW','2019-12-16 02:25:05');
CREATE TABLE IF NOT EXISTS `orders` (
	`id`	integer NOT NULL,
	`user_id`	integer NOT NULL,
	`order_status`	varchar NOT NULL,
	`order_date`	datetime NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on update cascade,
	FOREIGN KEY(`user_id`) REFERENCES `users`(`id`) on delete cascade
);
INSERT INTO `orders` VALUES (20191216022830,1,'rejected','2019-12-16 02:28:30','2019-12-16 02:28:30','2019-12-16 13:41:01');
INSERT INTO `orders` VALUES (20191216142004,1,'rejected','2019-12-16 14:20:04','2019-12-16 14:20:04','2019-12-16 14:23:08');
CREATE TABLE IF NOT EXISTS `order_watch` (
	`order_id`	integer NOT NULL,
	`watch_id`	integer NOT NULL,
	`quantity`	integer NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`) on update cascade,
	FOREIGN KEY(`order_id`) REFERENCES `orders`(`id`) on delete cascade,
	FOREIGN KEY(`watch_id`) REFERENCES `watches`(`id`) on update cascade,
	FOREIGN KEY(`watch_id`) REFERENCES `watches`(`id`) on delete cascade
);
INSERT INTO `order_watch` VALUES (20191216022830,7,4,NULL,NULL);
INSERT INTO `order_watch` VALUES (20191216142004,8,2,NULL,NULL);
CREATE TABLE IF NOT EXISTS `migrations` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`migration`	varchar NOT NULL,
	`batch`	integer NOT NULL
);
INSERT INTO `migrations` VALUES (612,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` VALUES (613,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` VALUES (614,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` VALUES (615,'2019_12_06_065614_create_watches_table',1);
INSERT INTO `migrations` VALUES (616,'2019_12_06_065656_create_categories_table',1);
INSERT INTO `migrations` VALUES (617,'2019_12_06_065752_create_user_infos_table',1);
INSERT INTO `migrations` VALUES (618,'2019_12_06_065808_create_orders_table',1);
INSERT INTO `migrations` VALUES (619,'2019_12_06_065831_create_currencies_table',1);
INSERT INTO `migrations` VALUES (620,'2019_12_06_070239_create_role_user_pivot_table',1);
INSERT INTO `migrations` VALUES (621,'2019_12_06_070301_create_roles_table',1);
INSERT INTO `migrations` VALUES (622,'2019_12_06_070316_create_permissions_table',1);
INSERT INTO `migrations` VALUES (623,'2019_12_06_070359_create_permission_role_pivot_table',1);
INSERT INTO `migrations` VALUES (624,'2019_12_07_031511_create_images_table',1);
INSERT INTO `migrations` VALUES (625,'2019_12_08_124354_create_order_watch_pivot_table',1);
INSERT INTO `migrations` VALUES (626,'2019_12_09_070115_create_loggings_table',1);
CREATE TABLE IF NOT EXISTS `loggings` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	datetime NOT NULL,
	`client`	varchar NOT NULL,
	`method`	varchar NOT NULL,
	`url`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `loggings` VALUES (1,'2019-12-15 23:30:19','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:30:19','2019-12-15 23:30:19');
INSERT INTO `loggings` VALUES (2,'2019-12-15 23:30:20','127.0.0.1','GET','http://localhost:8000/login','2019-12-15 23:30:20','2019-12-15 23:30:20');
INSERT INTO `loggings` VALUES (3,'2019-12-15 23:30:33','127.0.0.1','POST','http://localhost:8000/login','2019-12-15 23:30:33','2019-12-15 23:30:33');
INSERT INTO `loggings` VALUES (4,'2019-12-15 23:30:33','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:30:33','2019-12-15 23:30:33');
INSERT INTO `loggings` VALUES (5,'2019-12-15 23:30:36','127.0.0.1','POST','http://localhost:8000/logout','2019-12-15 23:30:36','2019-12-15 23:30:36');
INSERT INTO `loggings` VALUES (6,'2019-12-15 23:30:36','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:30:36','2019-12-15 23:30:36');
INSERT INTO `loggings` VALUES (7,'2019-12-15 23:30:38','127.0.0.1','GET','http://localhost:8000/login','2019-12-15 23:30:38','2019-12-15 23:30:38');
INSERT INTO `loggings` VALUES (8,'2019-12-15 23:30:40','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:30:40','2019-12-15 23:30:40');
INSERT INTO `loggings` VALUES (9,'2019-12-15 23:30:45','127.0.0.1','POST','http://localhost:8000/password/email','2019-12-15 23:30:45','2019-12-15 23:30:45');
INSERT INTO `loggings` VALUES (10,'2019-12-15 23:32:06','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:32:06','2019-12-15 23:32:06');
INSERT INTO `loggings` VALUES (11,'2019-12-15 23:32:12','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:32:12','2019-12-15 23:32:12');
INSERT INTO `loggings` VALUES (12,'2019-12-15 23:32:13','127.0.0.1','POST','http://localhost:8000/password/email','2019-12-15 23:32:13','2019-12-15 23:32:13');
INSERT INTO `loggings` VALUES (13,'2019-12-15 23:32:17','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:32:17','2019-12-15 23:32:17');
INSERT INTO `loggings` VALUES (14,'2019-12-15 23:38:46','127.0.0.1','POST','http://localhost:8000/password/email','2019-12-15 23:38:46','2019-12-15 23:38:46');
INSERT INTO `loggings` VALUES (15,'2019-12-15 23:38:50','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:38:50','2019-12-15 23:38:50');
INSERT INTO `loggings` VALUES (16,'2019-12-15 23:42:19','127.0.0.1','GET','http://localhost:8000/login','2019-12-15 23:42:19','2019-12-15 23:42:19');
INSERT INTO `loggings` VALUES (17,'2019-12-15 23:42:33','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:33','2019-12-15 23:42:33');
INSERT INTO `loggings` VALUES (18,'2019-12-15 23:42:35','127.0.0.1','POST','http://localhost:8000/password/email','2019-12-15 23:42:35','2019-12-15 23:42:35');
INSERT INTO `loggings` VALUES (19,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (20,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (21,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (22,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (23,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (24,'2019-12-15 23:42:39','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-15 23:42:39','2019-12-15 23:42:39');
INSERT INTO `loggings` VALUES (25,'2019-12-15 23:43:12','127.0.0.1','GET','http://localhost:8000/password/reset/2e486be80cc8e8519a0b6e4b77eb0808022a7a31726e58f7f17f8f4df0e70f5d?email=hungnl.qb98%40gmail.com','2019-12-15 23:43:12','2019-12-15 23:43:12');
INSERT INTO `loggings` VALUES (26,'2019-12-15 23:43:32','127.0.0.1','POST','http://localhost:8000/password/reset','2019-12-15 23:43:32','2019-12-15 23:43:32');
INSERT INTO `loggings` VALUES (27,'2019-12-15 23:43:32','127.0.0.1','GET','http://localhost:8000/home','2019-12-15 23:43:32','2019-12-15 23:43:32');
INSERT INTO `loggings` VALUES (28,'2019-12-15 23:43:35','127.0.0.1','GET','http://localhost:8000/watches','2019-12-15 23:43:35','2019-12-15 23:43:35');
INSERT INTO `loggings` VALUES (29,'2019-12-15 23:43:36','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:43:36','2019-12-15 23:43:36');
INSERT INTO `loggings` VALUES (30,'2019-12-15 23:47:50','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-15 23:47:50','2019-12-15 23:47:50');
INSERT INTO `loggings` VALUES (31,'2019-12-15 23:47:50','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:50','2019-12-15 23:47:50');
INSERT INTO `loggings` VALUES (32,'2019-12-15 23:47:51','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-15 23:47:51','2019-12-15 23:47:51');
INSERT INTO `loggings` VALUES (33,'2019-12-15 23:47:51','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:51','2019-12-15 23:47:51');
INSERT INTO `loggings` VALUES (34,'2019-12-15 23:47:52','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-15 23:47:52','2019-12-15 23:47:52');
INSERT INTO `loggings` VALUES (35,'2019-12-15 23:47:52','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:52','2019-12-15 23:47:52');
INSERT INTO `loggings` VALUES (36,'2019-12-15 23:47:54','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-15 23:47:54','2019-12-15 23:47:54');
INSERT INTO `loggings` VALUES (37,'2019-12-15 23:47:54','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:54','2019-12-15 23:47:54');
INSERT INTO `loggings` VALUES (38,'2019-12-15 23:47:55','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-15 23:47:55','2019-12-15 23:47:55');
INSERT INTO `loggings` VALUES (39,'2019-12-15 23:47:55','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:55','2019-12-15 23:47:55');
INSERT INTO `loggings` VALUES (40,'2019-12-15 23:47:57','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-15 23:47:57','2019-12-15 23:47:57');
INSERT INTO `loggings` VALUES (41,'2019-12-15 23:47:57','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:57','2019-12-15 23:47:57');
INSERT INTO `loggings` VALUES (42,'2019-12-15 23:47:59','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-15 23:47:59','2019-12-15 23:47:59');
INSERT INTO `loggings` VALUES (43,'2019-12-15 23:47:59','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:47:59','2019-12-15 23:47:59');
INSERT INTO `loggings` VALUES (44,'2019-12-15 23:48:01','127.0.0.1','GET','http://localhost:8000/?page=2','2019-12-15 23:48:01','2019-12-15 23:48:01');
INSERT INTO `loggings` VALUES (45,'2019-12-15 23:48:03','127.0.0.1','GET','http://localhost:8000/?page=1','2019-12-15 23:48:03','2019-12-15 23:48:03');
INSERT INTO `loggings` VALUES (46,'2019-12-15 23:48:05','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:05','2019-12-15 23:48:05');
INSERT INTO `loggings` VALUES (47,'2019-12-15 23:48:06','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:06','2019-12-15 23:48:06');
INSERT INTO `loggings` VALUES (48,'2019-12-15 23:48:08','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:08','2019-12-15 23:48:08');
INSERT INTO `loggings` VALUES (49,'2019-12-15 23:48:08','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:08','2019-12-15 23:48:08');
INSERT INTO `loggings` VALUES (50,'2019-12-15 23:48:09','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:09','2019-12-15 23:48:09');
INSERT INTO `loggings` VALUES (51,'2019-12-15 23:48:09','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:09','2019-12-15 23:48:09');
INSERT INTO `loggings` VALUES (52,'2019-12-15 23:48:16','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:16','2019-12-15 23:48:16');
INSERT INTO `loggings` VALUES (53,'2019-12-15 23:48:16','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:16','2019-12-15 23:48:16');
INSERT INTO `loggings` VALUES (54,'2019-12-15 23:48:17','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:17','2019-12-15 23:48:17');
INSERT INTO `loggings` VALUES (55,'2019-12-15 23:48:17','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:17','2019-12-15 23:48:17');
INSERT INTO `loggings` VALUES (56,'2019-12-15 23:48:17','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:17','2019-12-15 23:48:17');
INSERT INTO `loggings` VALUES (57,'2019-12-15 23:48:18','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:18','2019-12-15 23:48:18');
INSERT INTO `loggings` VALUES (58,'2019-12-15 23:48:18','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:18','2019-12-15 23:48:18');
INSERT INTO `loggings` VALUES (59,'2019-12-15 23:48:21','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:21','2019-12-15 23:48:21');
INSERT INTO `loggings` VALUES (60,'2019-12-15 23:48:21','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:21','2019-12-15 23:48:21');
INSERT INTO `loggings` VALUES (61,'2019-12-15 23:48:21','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:21','2019-12-15 23:48:21');
INSERT INTO `loggings` VALUES (62,'2019-12-15 23:48:22','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:22','2019-12-15 23:48:22');
INSERT INTO `loggings` VALUES (63,'2019-12-15 23:48:22','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:22','2019-12-15 23:48:22');
INSERT INTO `loggings` VALUES (64,'2019-12-15 23:48:22','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:22','2019-12-15 23:48:22');
INSERT INTO `loggings` VALUES (65,'2019-12-15 23:48:26','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:26','2019-12-15 23:48:26');
INSERT INTO `loggings` VALUES (66,'2019-12-15 23:48:26','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:26','2019-12-15 23:48:26');
INSERT INTO `loggings` VALUES (67,'2019-12-15 23:48:26','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:26','2019-12-15 23:48:26');
INSERT INTO `loggings` VALUES (68,'2019-12-15 23:48:26','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:26','2019-12-15 23:48:26');
INSERT INTO `loggings` VALUES (69,'2019-12-15 23:48:29','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:29','2019-12-15 23:48:29');
INSERT INTO `loggings` VALUES (70,'2019-12-15 23:48:29','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:29','2019-12-15 23:48:29');
INSERT INTO `loggings` VALUES (71,'2019-12-15 23:48:30','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:30','2019-12-15 23:48:30');
INSERT INTO `loggings` VALUES (72,'2019-12-15 23:48:30','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:30','2019-12-15 23:48:30');
INSERT INTO `loggings` VALUES (73,'2019-12-15 23:48:31','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:31','2019-12-15 23:48:31');
INSERT INTO `loggings` VALUES (74,'2019-12-15 23:48:32','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:32','2019-12-15 23:48:32');
INSERT INTO `loggings` VALUES (75,'2019-12-15 23:48:36','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:36','2019-12-15 23:48:36');
INSERT INTO `loggings` VALUES (76,'2019-12-15 23:48:36','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:36','2019-12-15 23:48:36');
INSERT INTO `loggings` VALUES (77,'2019-12-15 23:48:36','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:36','2019-12-15 23:48:36');
INSERT INTO `loggings` VALUES (78,'2019-12-15 23:48:38','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:38','2019-12-15 23:48:38');
INSERT INTO `loggings` VALUES (79,'2019-12-15 23:48:38','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:38','2019-12-15 23:48:38');
INSERT INTO `loggings` VALUES (80,'2019-12-15 23:48:39','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:39','2019-12-15 23:48:39');
INSERT INTO `loggings` VALUES (81,'2019-12-15 23:48:39','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:39','2019-12-15 23:48:39');
INSERT INTO `loggings` VALUES (82,'2019-12-15 23:48:39','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:39','2019-12-15 23:48:39');
INSERT INTO `loggings` VALUES (83,'2019-12-15 23:48:41','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:41','2019-12-15 23:48:41');
INSERT INTO `loggings` VALUES (84,'2019-12-15 23:48:43','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:43','2019-12-15 23:48:43');
INSERT INTO `loggings` VALUES (85,'2019-12-15 23:48:43','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:43','2019-12-15 23:48:43');
INSERT INTO `loggings` VALUES (86,'2019-12-15 23:48:44','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:44','2019-12-15 23:48:44');
INSERT INTO `loggings` VALUES (87,'2019-12-15 23:48:44','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:44','2019-12-15 23:48:44');
INSERT INTO `loggings` VALUES (88,'2019-12-15 23:48:44','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:44','2019-12-15 23:48:44');
INSERT INTO `loggings` VALUES (89,'2019-12-15 23:48:46','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:46','2019-12-15 23:48:46');
INSERT INTO `loggings` VALUES (90,'2019-12-15 23:48:46','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:46','2019-12-15 23:48:46');
INSERT INTO `loggings` VALUES (91,'2019-12-15 23:48:48','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:48','2019-12-15 23:48:48');
INSERT INTO `loggings` VALUES (92,'2019-12-15 23:48:48','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:48','2019-12-15 23:48:48');
INSERT INTO `loggings` VALUES (93,'2019-12-15 23:48:49','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:49','2019-12-15 23:48:49');
INSERT INTO `loggings` VALUES (94,'2019-12-15 23:48:49','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:49','2019-12-15 23:48:49');
INSERT INTO `loggings` VALUES (95,'2019-12-15 23:48:49','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:49','2019-12-15 23:48:49');
INSERT INTO `loggings` VALUES (96,'2019-12-15 23:48:49','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:49','2019-12-15 23:48:49');
INSERT INTO `loggings` VALUES (97,'2019-12-15 23:48:50','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:50','2019-12-15 23:48:50');
INSERT INTO `loggings` VALUES (98,'2019-12-15 23:48:50','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:50','2019-12-15 23:48:50');
INSERT INTO `loggings` VALUES (99,'2019-12-15 23:48:50','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:50','2019-12-15 23:48:50');
INSERT INTO `loggings` VALUES (100,'2019-12-15 23:48:51','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:51','2019-12-15 23:48:51');
INSERT INTO `loggings` VALUES (101,'2019-12-15 23:48:52','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:52','2019-12-15 23:48:52');
INSERT INTO `loggings` VALUES (102,'2019-12-15 23:48:53','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:53','2019-12-15 23:48:53');
INSERT INTO `loggings` VALUES (103,'2019-12-15 23:48:54','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:54','2019-12-15 23:48:54');
INSERT INTO `loggings` VALUES (104,'2019-12-15 23:48:55','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:55','2019-12-15 23:48:55');
INSERT INTO `loggings` VALUES (105,'2019-12-15 23:48:55','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:55','2019-12-15 23:48:55');
INSERT INTO `loggings` VALUES (106,'2019-12-15 23:48:55','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:55','2019-12-15 23:48:55');
INSERT INTO `loggings` VALUES (107,'2019-12-15 23:48:56','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:56','2019-12-15 23:48:56');
INSERT INTO `loggings` VALUES (108,'2019-12-15 23:48:57','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:57','2019-12-15 23:48:57');
INSERT INTO `loggings` VALUES (109,'2019-12-15 23:48:57','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:57','2019-12-15 23:48:57');
INSERT INTO `loggings` VALUES (110,'2019-12-15 23:48:58','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:58','2019-12-15 23:48:58');
INSERT INTO `loggings` VALUES (111,'2019-12-15 23:48:58','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:58','2019-12-15 23:48:58');
INSERT INTO `loggings` VALUES (112,'2019-12-15 23:48:58','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:58','2019-12-15 23:48:58');
INSERT INTO `loggings` VALUES (113,'2019-12-15 23:48:59','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:59','2019-12-15 23:48:59');
INSERT INTO `loggings` VALUES (114,'2019-12-15 23:48:59','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:48:59','2019-12-15 23:48:59');
INSERT INTO `loggings` VALUES (115,'2019-12-15 23:49:07','127.0.0.1','POST','http://localhost:8000/search','2019-12-15 23:49:07','2019-12-15 23:49:07');
INSERT INTO `loggings` VALUES (116,'2019-12-15 23:59:54','127.0.0.1','GET','http://localhost:8000','2019-12-15 23:59:54','2019-12-15 23:59:54');
INSERT INTO `loggings` VALUES (117,'2019-12-15 23:59:56','127.0.0.1','GET','http://localhost:8000/watches/7','2019-12-15 23:59:56','2019-12-15 23:59:56');
INSERT INTO `loggings` VALUES (118,'2019-12-15 23:59:59','127.0.0.1','GET','http://localhost:8000/watches/1','2019-12-15 23:59:59','2019-12-15 23:59:59');
INSERT INTO `loggings` VALUES (119,'2019-12-16 00:00:02','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 00:00:02','2019-12-16 00:00:02');
INSERT INTO `loggings` VALUES (120,'2019-12-16 00:00:04','127.0.0.1','GET','http://localhost:8000/watches/3','2019-12-16 00:00:04','2019-12-16 00:00:04');
INSERT INTO `loggings` VALUES (121,'2019-12-16 00:00:06','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 00:00:06','2019-12-16 00:00:06');
INSERT INTO `loggings` VALUES (122,'2019-12-16 00:00:09','127.0.0.1','GET','http://localhost:8000/watches/5','2019-12-16 00:00:09','2019-12-16 00:00:09');
INSERT INTO `loggings` VALUES (123,'2019-12-16 00:00:12','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 00:00:12','2019-12-16 00:00:12');
INSERT INTO `loggings` VALUES (124,'2019-12-16 00:00:15','127.0.0.1','GET','http://localhost:8000/watches/7','2019-12-16 00:00:15','2019-12-16 00:00:15');
INSERT INTO `loggings` VALUES (125,'2019-12-16 00:00:18','127.0.0.1','GET','http://localhost:8000/?page=2','2019-12-16 00:00:18','2019-12-16 00:00:18');
INSERT INTO `loggings` VALUES (126,'2019-12-16 00:00:19','127.0.0.1','GET','http://localhost:8000/watches/9','2019-12-16 00:00:19','2019-12-16 00:00:19');
INSERT INTO `loggings` VALUES (127,'2019-12-16 00:00:22','127.0.0.1','GET','http://localhost:8000/watches/1','2019-12-16 00:00:22','2019-12-16 00:00:22');
INSERT INTO `loggings` VALUES (128,'2019-12-16 00:00:26','127.0.0.1','POST','http://localhost:8000/search','2019-12-16 00:00:26','2019-12-16 00:00:26');
INSERT INTO `loggings` VALUES (129,'2019-12-16 00:00:27','127.0.0.1','POST','http://localhost:8000/search','2019-12-16 00:00:27','2019-12-16 00:00:27');
INSERT INTO `loggings` VALUES (130,'2019-12-16 00:00:30','127.0.0.1','POST','http://localhost:8000/search','2019-12-16 00:00:30','2019-12-16 00:00:30');
INSERT INTO `loggings` VALUES (131,'2019-12-16 00:00:39','127.0.0.1','GET','http://localhost:8000/watches/7','2019-12-16 00:00:39','2019-12-16 00:00:39');
INSERT INTO `loggings` VALUES (132,'2019-12-16 00:00:42','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 00:00:42','2019-12-16 00:00:42');
INSERT INTO `loggings` VALUES (133,'2019-12-16 00:00:45','127.0.0.1','GET','http://localhost:8000','2019-12-16 00:00:45','2019-12-16 00:00:45');
INSERT INTO `loggings` VALUES (134,'2019-12-16 00:00:47','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 00:00:47','2019-12-16 00:00:47');
INSERT INTO `loggings` VALUES (135,'2019-12-16 00:00:50','127.0.0.1','GET','http://localhost:8000','2019-12-16 00:00:50','2019-12-16 00:00:50');
INSERT INTO `loggings` VALUES (136,'2019-12-16 00:00:51','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 00:00:51','2019-12-16 00:00:51');
INSERT INTO `loggings` VALUES (137,'2019-12-16 00:00:52','127.0.0.1','GET','http://localhost:8000/categories','2019-12-16 00:00:52','2019-12-16 00:00:52');
INSERT INTO `loggings` VALUES (138,'2019-12-16 00:00:53','127.0.0.1','GET','http://localhost:8000/categories?page=3','2019-12-16 00:00:53','2019-12-16 00:00:53');
INSERT INTO `loggings` VALUES (139,'2019-12-16 00:00:54','127.0.0.1','GET','http://localhost:8000/categories?page=4','2019-12-16 00:00:54','2019-12-16 00:00:54');
INSERT INTO `loggings` VALUES (140,'2019-12-16 00:00:59','127.0.0.1','GET','http://localhost:8000','2019-12-16 00:00:59','2019-12-16 00:00:59');
INSERT INTO `loggings` VALUES (141,'2019-12-16 00:01:00','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 00:01:00','2019-12-16 00:01:00');
INSERT INTO `loggings` VALUES (142,'2019-12-16 00:01:01','127.0.0.1','GET','http://localhost:8000/categories','2019-12-16 00:01:01','2019-12-16 00:01:01');
INSERT INTO `loggings` VALUES (143,'2019-12-16 00:01:02','127.0.0.1','GET','http://localhost:8000','2019-12-16 00:01:02','2019-12-16 00:01:02');
INSERT INTO `loggings` VALUES (144,'2019-12-16 00:01:04','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 00:01:04','2019-12-16 00:01:04');
INSERT INTO `loggings` VALUES (145,'2019-12-16 00:01:05','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 00:01:05','2019-12-16 00:01:05');
INSERT INTO `loggings` VALUES (146,'2019-12-16 02:23:14','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:23:14','2019-12-16 02:23:14');
INSERT INTO `loggings` VALUES (147,'2019-12-16 02:23:16','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:23:16','2019-12-16 02:23:16');
INSERT INTO `loggings` VALUES (148,'2019-12-16 02:23:19','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:23:19','2019-12-16 02:23:19');
INSERT INTO `loggings` VALUES (149,'2019-12-16 02:23:19','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:23:19','2019-12-16 02:23:19');
INSERT INTO `loggings` VALUES (150,'2019-12-16 02:23:20','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:23:20','2019-12-16 02:23:20');
INSERT INTO `loggings` VALUES (151,'2019-12-16 02:23:20','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:23:20','2019-12-16 02:23:20');
INSERT INTO `loggings` VALUES (152,'2019-12-16 02:23:21','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:23:21','2019-12-16 02:23:21');
INSERT INTO `loggings` VALUES (153,'2019-12-16 02:23:21','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:23:21','2019-12-16 02:23:21');
INSERT INTO `loggings` VALUES (154,'2019-12-16 02:23:22','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:23:22','2019-12-16 02:23:22');
INSERT INTO `loggings` VALUES (155,'2019-12-16 02:23:24','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-16 02:23:24','2019-12-16 02:23:24');
INSERT INTO `loggings` VALUES (156,'2019-12-16 02:23:25','127.0.0.1','GET','http://localhost:8000/register','2019-12-16 02:23:25','2019-12-16 02:23:25');
INSERT INTO `loggings` VALUES (157,'2019-12-16 02:24:16','127.0.0.1','GET','http://localhost:8000/register','2019-12-16 02:24:16','2019-12-16 02:24:16');
INSERT INTO `loggings` VALUES (158,'2019-12-16 02:24:17','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:24:17','2019-12-16 02:24:17');
INSERT INTO `loggings` VALUES (159,'2019-12-16 02:24:35','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:24:35','2019-12-16 02:24:35');
INSERT INTO `loggings` VALUES (160,'2019-12-16 02:24:40','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 02:24:40','2019-12-16 02:24:40');
INSERT INTO `loggings` VALUES (161,'2019-12-16 02:24:40','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:24:40','2019-12-16 02:24:40');
INSERT INTO `loggings` VALUES (162,'2019-12-16 02:24:43','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:24:43','2019-12-16 02:24:43');
INSERT INTO `loggings` VALUES (163,'2019-12-16 02:24:45','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:45','2019-12-16 02:24:45');
INSERT INTO `loggings` VALUES (164,'2019-12-16 02:24:47','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:24:47','2019-12-16 02:24:47');
INSERT INTO `loggings` VALUES (165,'2019-12-16 02:24:47','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:47','2019-12-16 02:24:47');
INSERT INTO `loggings` VALUES (166,'2019-12-16 02:24:48','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:24:48','2019-12-16 02:24:48');
INSERT INTO `loggings` VALUES (167,'2019-12-16 02:24:48','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:48','2019-12-16 02:24:48');
INSERT INTO `loggings` VALUES (168,'2019-12-16 02:24:50','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:24:50','2019-12-16 02:24:50');
INSERT INTO `loggings` VALUES (169,'2019-12-16 02:24:50','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:50','2019-12-16 02:24:50');
INSERT INTO `loggings` VALUES (170,'2019-12-16 02:24:51','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:24:51','2019-12-16 02:24:51');
INSERT INTO `loggings` VALUES (171,'2019-12-16 02:24:51','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:51','2019-12-16 02:24:51');
INSERT INTO `loggings` VALUES (172,'2019-12-16 02:24:53','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:24:53','2019-12-16 02:24:53');
INSERT INTO `loggings` VALUES (173,'2019-12-16 02:24:53','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:53','2019-12-16 02:24:53');
INSERT INTO `loggings` VALUES (174,'2019-12-16 02:24:54','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:24:54','2019-12-16 02:24:54');
INSERT INTO `loggings` VALUES (175,'2019-12-16 02:24:54','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:24:54','2019-12-16 02:24:54');
INSERT INTO `loggings` VALUES (176,'2019-12-16 02:24:55','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:24:55','2019-12-16 02:24:55');
INSERT INTO `loggings` VALUES (177,'2019-12-16 02:24:56','127.0.0.1','GET','http://localhost:8000/register','2019-12-16 02:24:56','2019-12-16 02:24:56');
INSERT INTO `loggings` VALUES (178,'2019-12-16 02:24:58','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:24:58','2019-12-16 02:24:58');
INSERT INTO `loggings` VALUES (179,'2019-12-16 02:25:00','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-16 02:25:00','2019-12-16 02:25:00');
INSERT INTO `loggings` VALUES (180,'2019-12-16 02:25:05','127.0.0.1','POST','http://localhost:8000/password/email','2019-12-16 02:25:05','2019-12-16 02:25:05');
INSERT INTO `loggings` VALUES (181,'2019-12-16 02:25:09','127.0.0.1','GET','http://localhost:8000/password/reset','2019-12-16 02:25:09','2019-12-16 02:25:09');
INSERT INTO `loggings` VALUES (182,'2019-12-16 02:25:30','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:25:30','2019-12-16 02:25:30');
INSERT INTO `loggings` VALUES (183,'2019-12-16 02:25:39','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:25:39','2019-12-16 02:25:39');
INSERT INTO `loggings` VALUES (184,'2019-12-16 02:25:43','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 02:25:43','2019-12-16 02:25:43');
INSERT INTO `loggings` VALUES (185,'2019-12-16 02:25:43','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:25:43','2019-12-16 02:25:43');
INSERT INTO `loggings` VALUES (186,'2019-12-16 02:25:46','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 02:25:46','2019-12-16 02:25:46');
INSERT INTO `loggings` VALUES (187,'2019-12-16 02:25:46','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:25:46','2019-12-16 02:25:46');
INSERT INTO `loggings` VALUES (188,'2019-12-16 02:25:55','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 02:25:55','2019-12-16 02:25:55');
INSERT INTO `loggings` VALUES (189,'2019-12-16 02:25:55','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 02:25:55','2019-12-16 02:25:55');
INSERT INTO `loggings` VALUES (190,'2019-12-16 02:25:58','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 02:25:58','2019-12-16 02:25:58');
INSERT INTO `loggings` VALUES (191,'2019-12-16 02:25:58','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:25:58','2019-12-16 02:25:58');
INSERT INTO `loggings` VALUES (192,'2019-12-16 02:26:05','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 02:26:05','2019-12-16 02:26:05');
INSERT INTO `loggings` VALUES (193,'2019-12-16 02:26:09','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 02:26:09','2019-12-16 02:26:09');
INSERT INTO `loggings` VALUES (194,'2019-12-16 02:26:10','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 02:26:10','2019-12-16 02:26:10');
INSERT INTO `loggings` VALUES (195,'2019-12-16 02:26:13','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:13','2019-12-16 02:26:13');
INSERT INTO `loggings` VALUES (196,'2019-12-16 02:26:14','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:26:14','2019-12-16 02:26:14');
INSERT INTO `loggings` VALUES (197,'2019-12-16 02:26:14','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:14','2019-12-16 02:26:14');
INSERT INTO `loggings` VALUES (198,'2019-12-16 02:26:19','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:26:19','2019-12-16 02:26:19');
INSERT INTO `loggings` VALUES (199,'2019-12-16 02:26:27','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 02:26:27','2019-12-16 02:26:27');
INSERT INTO `loggings` VALUES (200,'2019-12-16 02:26:28','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 02:26:28','2019-12-16 02:26:28');
INSERT INTO `loggings` VALUES (201,'2019-12-16 02:26:29','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:29','2019-12-16 02:26:29');
INSERT INTO `loggings` VALUES (202,'2019-12-16 02:26:30','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:26:30','2019-12-16 02:26:30');
INSERT INTO `loggings` VALUES (203,'2019-12-16 02:26:30','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:30','2019-12-16 02:26:30');
INSERT INTO `loggings` VALUES (204,'2019-12-16 02:26:31','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:26:31','2019-12-16 02:26:31');
INSERT INTO `loggings` VALUES (205,'2019-12-16 02:26:36','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 02:26:36','2019-12-16 02:26:36');
INSERT INTO `loggings` VALUES (206,'2019-12-16 02:26:37','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 02:26:37','2019-12-16 02:26:37');
INSERT INTO `loggings` VALUES (207,'2019-12-16 02:26:38','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:38','2019-12-16 02:26:38');
INSERT INTO `loggings` VALUES (208,'2019-12-16 02:26:39','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:26:39','2019-12-16 02:26:39');
INSERT INTO `loggings` VALUES (209,'2019-12-16 02:26:39','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:26:39','2019-12-16 02:26:39');
INSERT INTO `loggings` VALUES (210,'2019-12-16 02:27:28','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:28','2019-12-16 02:27:28');
INSERT INTO `loggings` VALUES (211,'2019-12-16 02:27:31','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:27:31','2019-12-16 02:27:31');
INSERT INTO `loggings` VALUES (212,'2019-12-16 02:27:31','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:31','2019-12-16 02:27:31');
INSERT INTO `loggings` VALUES (213,'2019-12-16 02:27:32','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:27:32','2019-12-16 02:27:32');
INSERT INTO `loggings` VALUES (214,'2019-12-16 02:27:32','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:32','2019-12-16 02:27:32');
INSERT INTO `loggings` VALUES (215,'2019-12-16 02:27:34','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:27:34','2019-12-16 02:27:34');
INSERT INTO `loggings` VALUES (216,'2019-12-16 02:27:34','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:34','2019-12-16 02:27:34');
INSERT INTO `loggings` VALUES (217,'2019-12-16 02:27:35','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:27:35','2019-12-16 02:27:35');
INSERT INTO `loggings` VALUES (218,'2019-12-16 02:27:35','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:35','2019-12-16 02:27:35');
INSERT INTO `loggings` VALUES (219,'2019-12-16 02:27:37','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:27:37','2019-12-16 02:27:37');
INSERT INTO `loggings` VALUES (220,'2019-12-16 02:27:37','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:37','2019-12-16 02:27:37');
INSERT INTO `loggings` VALUES (221,'2019-12-16 02:27:41','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:27:41','2019-12-16 02:27:41');
INSERT INTO `loggings` VALUES (222,'2019-12-16 02:27:41','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:41','2019-12-16 02:27:41');
INSERT INTO `loggings` VALUES (223,'2019-12-16 02:27:42','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:27:42','2019-12-16 02:27:42');
INSERT INTO `loggings` VALUES (224,'2019-12-16 02:27:42','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:42','2019-12-16 02:27:42');
INSERT INTO `loggings` VALUES (225,'2019-12-16 02:27:44','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:27:44','2019-12-16 02:27:44');
INSERT INTO `loggings` VALUES (226,'2019-12-16 02:27:44','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:44','2019-12-16 02:27:44');
INSERT INTO `loggings` VALUES (227,'2019-12-16 02:27:45','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:27:45','2019-12-16 02:27:45');
INSERT INTO `loggings` VALUES (228,'2019-12-16 02:27:45','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:27:45','2019-12-16 02:27:45');
INSERT INTO `loggings` VALUES (229,'2019-12-16 02:28:08','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:08','2019-12-16 02:28:08');
INSERT INTO `loggings` VALUES (230,'2019-12-16 02:28:10','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:28:10','2019-12-16 02:28:10');
INSERT INTO `loggings` VALUES (231,'2019-12-16 02:28:10','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:10','2019-12-16 02:28:10');
INSERT INTO `loggings` VALUES (232,'2019-12-16 02:28:11','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:28:11','2019-12-16 02:28:11');
INSERT INTO `loggings` VALUES (233,'2019-12-16 02:28:11','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:11','2019-12-16 02:28:11');
INSERT INTO `loggings` VALUES (234,'2019-12-16 02:28:12','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:28:12','2019-12-16 02:28:12');
INSERT INTO `loggings` VALUES (235,'2019-12-16 02:28:14','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 02:28:14','2019-12-16 02:28:14');
INSERT INTO `loggings` VALUES (236,'2019-12-16 02:28:14','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 02:28:14','2019-12-16 02:28:14');
INSERT INTO `loggings` VALUES (237,'2019-12-16 02:28:16','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:16','2019-12-16 02:28:16');
INSERT INTO `loggings` VALUES (238,'2019-12-16 02:28:18','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:28:18','2019-12-16 02:28:18');
INSERT INTO `loggings` VALUES (239,'2019-12-16 02:28:18','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:18','2019-12-16 02:28:18');
INSERT INTO `loggings` VALUES (240,'2019-12-16 02:28:20','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:28:20','2019-12-16 02:28:20');
INSERT INTO `loggings` VALUES (241,'2019-12-16 02:28:20','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:20','2019-12-16 02:28:20');
INSERT INTO `loggings` VALUES (242,'2019-12-16 02:28:22','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:28:22','2019-12-16 02:28:22');
INSERT INTO `loggings` VALUES (243,'2019-12-16 02:28:22','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:28:22','2019-12-16 02:28:22');
INSERT INTO `loggings` VALUES (244,'2019-12-16 02:28:25','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:28:25','2019-12-16 02:28:25');
INSERT INTO `loggings` VALUES (245,'2019-12-16 02:28:26','127.0.0.1','GET','http://localhost:8000/watches/7','2019-12-16 02:28:26','2019-12-16 02:28:26');
INSERT INTO `loggings` VALUES (246,'2019-12-16 02:28:30','127.0.0.1','POST','http://localhost:8000/payments/cf','2019-12-16 02:28:30','2019-12-16 02:28:30');
INSERT INTO `loggings` VALUES (247,'2019-12-16 02:38:33','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:38:33','2019-12-16 02:38:33');
INSERT INTO `loggings` VALUES (248,'2019-12-16 02:38:34','127.0.0.1','GET','http://localhost:8000/watches/2','2019-12-16 02:38:34','2019-12-16 02:38:34');
INSERT INTO `loggings` VALUES (249,'2019-12-16 02:38:35','127.0.0.1','GET','http://localhost:8000/watches/3','2019-12-16 02:38:35','2019-12-16 02:38:35');
INSERT INTO `loggings` VALUES (250,'2019-12-16 02:49:34','127.0.0.1','GET','http://localhost:8000/watches/1','2019-12-16 02:49:34','2019-12-16 02:49:34');
INSERT INTO `loggings` VALUES (251,'2019-12-16 02:49:35','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 02:49:35','2019-12-16 02:49:35');
INSERT INTO `loggings` VALUES (252,'2019-12-16 02:49:36','127.0.0.1','POST','http://localhost:8000/payments/cf','2019-12-16 02:49:36','2019-12-16 02:49:36');
INSERT INTO `loggings` VALUES (253,'2019-12-16 02:49:37','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 02:49:37','2019-12-16 02:49:37');
INSERT INTO `loggings` VALUES (254,'2019-12-16 02:49:39','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:49:39','2019-12-16 02:49:39');
INSERT INTO `loggings` VALUES (255,'2019-12-16 02:49:39','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 02:49:39','2019-12-16 02:49:39');
INSERT INTO `loggings` VALUES (256,'2019-12-16 02:49:39','127.0.0.1','POST','http://localhost:8000/payments/cf','2019-12-16 02:49:39','2019-12-16 02:49:39');
INSERT INTO `loggings` VALUES (257,'2019-12-16 02:49:39','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 02:49:39','2019-12-16 02:49:39');
INSERT INTO `loggings` VALUES (258,'2019-12-16 02:49:41','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:49:41','2019-12-16 02:49:41');
INSERT INTO `loggings` VALUES (259,'2019-12-16 02:49:41','127.0.0.1','GET','http://localhost:8000/watches/4','2019-12-16 02:49:41','2019-12-16 02:49:41');
INSERT INTO `loggings` VALUES (260,'2019-12-16 02:49:42','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:49:42','2019-12-16 02:49:42');
INSERT INTO `loggings` VALUES (261,'2019-12-16 02:49:43','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:49:43','2019-12-16 02:49:43');
INSERT INTO `loggings` VALUES (262,'2019-12-16 02:49:44','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:49:44','2019-12-16 02:49:44');
INSERT INTO `loggings` VALUES (263,'2019-12-16 02:49:45','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:49:45','2019-12-16 02:49:45');
INSERT INTO `loggings` VALUES (264,'2019-12-16 02:49:45','127.0.0.1','POST','http://localhost:8000/payments/cf','2019-12-16 02:49:45','2019-12-16 02:49:45');
INSERT INTO `loggings` VALUES (265,'2019-12-16 02:49:45','127.0.0.1','GET','http://localhost:8000/watches/6','2019-12-16 02:49:45','2019-12-16 02:49:45');
INSERT INTO `loggings` VALUES (266,'2019-12-16 02:49:47','127.0.0.1','GET','http://localhost:8000','2019-12-16 02:49:47','2019-12-16 02:49:47');
INSERT INTO `loggings` VALUES (267,'2019-12-16 02:49:49','127.0.0.1','GET','http://localhost:8000/home','2019-12-16 02:49:49','2019-12-16 02:49:49');
INSERT INTO `loggings` VALUES (268,'2019-12-16 02:49:49','127.0.0.1','GET','http://localhost:8000/watches','2019-12-16 02:49:49','2019-12-16 02:49:49');
INSERT INTO `loggings` VALUES (269,'2019-12-16 02:49:51','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:49:51','2019-12-16 02:49:51');
INSERT INTO `loggings` VALUES (270,'2019-12-16 02:49:52','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:49:52','2019-12-16 02:49:52');
INSERT INTO `loggings` VALUES (271,'2019-12-16 02:49:52','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:49:52','2019-12-16 02:49:52');
INSERT INTO `loggings` VALUES (272,'2019-12-16 02:49:56','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 02:49:56','2019-12-16 02:49:56');
INSERT INTO `loggings` VALUES (273,'2019-12-16 02:49:56','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:49:56','2019-12-16 02:49:56');
INSERT INTO `loggings` VALUES (274,'2019-12-16 02:49:57','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:49:57','2019-12-16 02:49:57');
INSERT INTO `loggings` VALUES (275,'2019-12-16 02:49:57','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:49:57','2019-12-16 02:49:57');
INSERT INTO `loggings` VALUES (276,'2019-12-16 02:49:59','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 02:49:59','2019-12-16 02:49:59');
INSERT INTO `loggings` VALUES (277,'2019-12-16 02:49:59','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:49:59','2019-12-16 02:49:59');
INSERT INTO `loggings` VALUES (278,'2019-12-16 02:50:00','127.0.0.1','POST','http://localhost:8000/watches/create','2019-12-16 02:50:00','2019-12-16 02:50:00');
INSERT INTO `loggings` VALUES (279,'2019-12-16 02:50:00','127.0.0.1','GET','http://localhost:8000/watches/create','2019-12-16 02:50:00','2019-12-16 02:50:00');
INSERT INTO `loggings` VALUES (280,'2019-12-16 06:49:38','127.0.0.1','GET','http://localhost:8000','2019-12-16 06:49:38','2019-12-16 06:49:38');
INSERT INTO `loggings` VALUES (281,'2019-12-16 06:49:40','127.0.0.1','GET','http://localhost:8000','2019-12-16 06:49:40','2019-12-16 06:49:40');
INSERT INTO `loggings` VALUES (282,'2019-12-16 06:53:12','127.0.0.1','GET','http://localhost:8000','2019-12-16 06:53:12','2019-12-16 06:53:12');
INSERT INTO `loggings` VALUES (283,'2019-12-16 13:39:45','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:39:45','2019-12-16 13:39:45');
INSERT INTO `loggings` VALUES (284,'2019-12-16 13:39:47','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 13:39:47','2019-12-16 13:39:47');
INSERT INTO `loggings` VALUES (285,'2019-12-16 13:39:47','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:39:47','2019-12-16 13:39:47');
INSERT INTO `loggings` VALUES (286,'2019-12-16 13:39:48','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:39:48','2019-12-16 13:39:48');
INSERT INTO `loggings` VALUES (287,'2019-12-16 13:39:51','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 13:39:51','2019-12-16 13:39:51');
INSERT INTO `loggings` VALUES (288,'2019-12-16 13:39:51','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:39:51','2019-12-16 13:39:51');
INSERT INTO `loggings` VALUES (289,'2019-12-16 13:39:54','127.0.0.1','GET','http://localhost:8000/languages/vn','2019-12-16 13:39:54','2019-12-16 13:39:54');
INSERT INTO `loggings` VALUES (290,'2019-12-16 13:39:54','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:39:54','2019-12-16 13:39:54');
INSERT INTO `loggings` VALUES (291,'2019-12-16 13:39:56','127.0.0.1','GET','http://localhost:8000/languages/en','2019-12-16 13:39:56','2019-12-16 13:39:56');
INSERT INTO `loggings` VALUES (292,'2019-12-16 13:39:56','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:39:56','2019-12-16 13:39:56');
INSERT INTO `loggings` VALUES (293,'2019-12-16 13:39:59','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 13:39:59','2019-12-16 13:39:59');
INSERT INTO `loggings` VALUES (294,'2019-12-16 13:39:59','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:39:59','2019-12-16 13:39:59');
INSERT INTO `loggings` VALUES (295,'2019-12-16 13:40:09','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 13:40:09','2019-12-16 13:40:09');
INSERT INTO `loggings` VALUES (296,'2019-12-16 13:40:09','127.0.0.1','GET','http://localhost:8000/login','2019-12-16 13:40:09','2019-12-16 13:40:09');
INSERT INTO `loggings` VALUES (297,'2019-12-16 13:40:12','127.0.0.1','POST','http://localhost:8000/login','2019-12-16 13:40:12','2019-12-16 13:40:12');
INSERT INTO `loggings` VALUES (298,'2019-12-16 13:40:12','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:40:12','2019-12-16 13:40:12');
INSERT INTO `loggings` VALUES (299,'2019-12-16 13:40:14','127.0.0.1','GET','http://localhost:8000/watches/1','2019-12-16 13:40:14','2019-12-16 13:40:14');
INSERT INTO `loggings` VALUES (300,'2019-12-16 13:40:16','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:40:16','2019-12-16 13:40:16');
INSERT INTO `loggings` VALUES (301,'2019-12-16 13:40:19','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 13:40:19','2019-12-16 13:40:19');
INSERT INTO `loggings` VALUES (302,'2019-12-16 13:40:20','127.0.0.1','GET','http://localhost:8000/user/order/finish/20191216022830','2019-12-16 13:40:20','2019-12-16 13:40:20');
INSERT INTO `loggings` VALUES (303,'2019-12-16 13:40:23','127.0.0.1','GET','http://localhost:8000/user/order/finish/20191216022830','2019-12-16 13:40:23','2019-12-16 13:40:23');
INSERT INTO `loggings` VALUES (304,'2019-12-16 13:40:43','127.0.0.1','POST','http://localhost:8000/payments/create','2019-12-16 13:40:43','2019-12-16 13:40:43');
INSERT INTO `loggings` VALUES (305,'2019-12-16 13:40:49','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:40:49','2019-12-16 13:40:49');
INSERT INTO `loggings` VALUES (306,'2019-12-16 13:40:50','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 13:40:50','2019-12-16 13:40:50');
INSERT INTO `loggings` VALUES (307,'2019-12-16 13:40:55','127.0.0.1','GET','http://localhost:8000/user/order/finish/20191216022830','2019-12-16 13:40:55','2019-12-16 13:40:55');
INSERT INTO `loggings` VALUES (308,'2019-12-16 13:40:57','127.0.0.1','GET','http://localhost:8000/user/order/finish/20191216022830','2019-12-16 13:40:57','2019-12-16 13:40:57');
INSERT INTO `loggings` VALUES (309,'2019-12-16 13:40:59','127.0.0.1','POST','http://localhost:8000/payments/create','2019-12-16 13:40:59','2019-12-16 13:40:59');
INSERT INTO `loggings` VALUES (310,'2019-12-16 13:41:01','127.0.0.1','GET','http://localhost:8000/payments/return?vnp_Amount=211200000&vnp_BankCode=VNPAY&vnp_CardType=QRCODE&vnp_OrderInfo=Description&vnp_PayDate=20191216204448&vnp_ResponseCode=24&vnp_SecureHash=f9ff63206d51913224878312377629b1d738b557cd99ba9065baab89502be015&vnp_SecureHashType=SHA256&vnp_TmnCode=D0WUXYPG&vnp_TransactionNo=0&vnp_TxnRef=20191216022830','2019-12-16 13:41:01','2019-12-16 13:41:01');
INSERT INTO `loggings` VALUES (311,'2019-12-16 13:41:02','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:41:02','2019-12-16 13:41:02');
INSERT INTO `loggings` VALUES (312,'2019-12-16 13:41:04','127.0.0.1','GET','http://localhost:8000/user/order','2019-12-16 13:41:04','2019-12-16 13:41:04');
INSERT INTO `loggings` VALUES (313,'2019-12-16 13:41:06','127.0.0.1','GET','http://localhost:8000/user/order/20191216022830','2019-12-16 13:41:06','2019-12-16 13:41:06');
INSERT INTO `loggings` VALUES (314,'2019-12-16 13:41:09','127.0.0.1','GET','http://localhost:8000/currencies/VND','2019-12-16 13:41:09','2019-12-16 13:41:09');
INSERT INTO `loggings` VALUES (315,'2019-12-16 13:41:09','127.0.0.1','GET','http://localhost:8000/user/order/20191216022830','2019-12-16 13:41:09','2019-12-16 13:41:09');
INSERT INTO `loggings` VALUES (316,'2019-12-16 13:41:13','127.0.0.1','GET','http://localhost:8000','2019-12-16 13:41:13','2019-12-16 13:41:13');
INSERT INTO `loggings` VALUES (317,'2019-12-16 14:10:32','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:10:32','2019-12-16 14:10:32');
INSERT INTO `loggings` VALUES (318,'2019-12-16 14:10:34','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:34','2019-12-16 14:10:34');
INSERT INTO `loggings` VALUES (319,'2019-12-16 14:10:38','172.19.0.1','GET','http://localhost:11400/languages/en','2019-12-16 14:10:38','2019-12-16 14:10:38');
INSERT INTO `loggings` VALUES (320,'2019-12-16 14:10:38','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:38','2019-12-16 14:10:38');
INSERT INTO `loggings` VALUES (321,'2019-12-16 14:10:39','172.19.0.1','GET','http://localhost:11400/languages/vn','2019-12-16 14:10:39','2019-12-16 14:10:39');
INSERT INTO `loggings` VALUES (322,'2019-12-16 14:10:39','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:39','2019-12-16 14:10:39');
INSERT INTO `loggings` VALUES (323,'2019-12-16 14:10:40','172.19.0.1','GET','http://localhost:11400/languages/en','2019-12-16 14:10:40','2019-12-16 14:10:40');
INSERT INTO `loggings` VALUES (324,'2019-12-16 14:10:40','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:40','2019-12-16 14:10:40');
INSERT INTO `loggings` VALUES (325,'2019-12-16 14:10:42','172.19.0.1','GET','http://localhost:11400/languages/vn','2019-12-16 14:10:42','2019-12-16 14:10:42');
INSERT INTO `loggings` VALUES (326,'2019-12-16 14:10:42','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:42','2019-12-16 14:10:42');
INSERT INTO `loggings` VALUES (327,'2019-12-16 14:10:43','172.19.0.1','GET','http://localhost:11400/languages/en','2019-12-16 14:10:43','2019-12-16 14:10:43');
INSERT INTO `loggings` VALUES (328,'2019-12-16 14:10:43','172.19.0.1','GET','http://localhost:11400/watches/2','2019-12-16 14:10:43','2019-12-16 14:10:43');
INSERT INTO `loggings` VALUES (329,'2019-12-16 14:10:44','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:10:44','2019-12-16 14:10:44');
INSERT INTO `loggings` VALUES (330,'2019-12-16 14:10:46','172.19.0.1','GET','http://localhost:11400/?page=2','2019-12-16 14:10:46','2019-12-16 14:10:46');
INSERT INTO `loggings` VALUES (331,'2019-12-16 14:15:55','172.19.0.1','GET','http://localhost:11400/?page=2','2019-12-16 14:15:55','2019-12-16 14:15:55');
INSERT INTO `loggings` VALUES (332,'2019-12-16 14:15:57','172.19.0.1','GET','http://localhost:11400/?page=1','2019-12-16 14:15:57','2019-12-16 14:15:57');
INSERT INTO `loggings` VALUES (333,'2019-12-16 14:15:58','172.19.0.1','GET','http://localhost:11400/watches/1','2019-12-16 14:15:58','2019-12-16 14:15:58');
INSERT INTO `loggings` VALUES (334,'2019-12-16 14:16:00','172.19.0.1','GET','http://localhost:11400/home','2019-12-16 14:16:00','2019-12-16 14:16:00');
INSERT INTO `loggings` VALUES (335,'2019-12-16 14:16:02','172.19.0.1','GET','http://localhost:11400/languages/en','2019-12-16 14:16:02','2019-12-16 14:16:02');
INSERT INTO `loggings` VALUES (336,'2019-12-16 14:16:02','172.19.0.1','GET','http://localhost:11400/home','2019-12-16 14:16:02','2019-12-16 14:16:02');
INSERT INTO `loggings` VALUES (337,'2019-12-16 14:16:02','172.19.0.1','GET','http://localhost:11400/categories','2019-12-16 14:16:02','2019-12-16 14:16:02');
INSERT INTO `loggings` VALUES (338,'2019-12-16 14:16:04','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:16:04','2019-12-16 14:16:04');
INSERT INTO `loggings` VALUES (339,'2019-12-16 14:16:06','172.19.0.1','GET','http://localhost:11400/watches/7','2019-12-16 14:16:06','2019-12-16 14:16:06');
INSERT INTO `loggings` VALUES (340,'2019-12-16 14:19:44','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:19:44','2019-12-16 14:19:44');
INSERT INTO `loggings` VALUES (341,'2019-12-16 14:19:45','172.19.0.1','GET','http://localhost:11400/watches/1','2019-12-16 14:19:45','2019-12-16 14:19:45');
INSERT INTO `loggings` VALUES (342,'2019-12-16 14:19:47','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:19:47','2019-12-16 14:19:47');
INSERT INTO `loggings` VALUES (343,'2019-12-16 14:19:49','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:49','2019-12-16 14:19:49');
INSERT INTO `loggings` VALUES (344,'2019-12-16 14:19:50','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:50','2019-12-16 14:19:50');
INSERT INTO `loggings` VALUES (345,'2019-12-16 14:19:51','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:51','2019-12-16 14:19:51');
INSERT INTO `loggings` VALUES (346,'2019-12-16 14:19:51','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:51','2019-12-16 14:19:51');
INSERT INTO `loggings` VALUES (347,'2019-12-16 14:19:52','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:52','2019-12-16 14:19:52');
INSERT INTO `loggings` VALUES (348,'2019-12-16 14:19:53','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:53','2019-12-16 14:19:53');
INSERT INTO `loggings` VALUES (349,'2019-12-16 14:19:53','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:53','2019-12-16 14:19:53');
INSERT INTO `loggings` VALUES (350,'2019-12-16 14:19:53','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:53','2019-12-16 14:19:53');
INSERT INTO `loggings` VALUES (351,'2019-12-16 14:19:54','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:54','2019-12-16 14:19:54');
INSERT INTO `loggings` VALUES (352,'2019-12-16 14:19:54','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:54','2019-12-16 14:19:54');
INSERT INTO `loggings` VALUES (353,'2019-12-16 14:19:54','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:54','2019-12-16 14:19:54');
INSERT INTO `loggings` VALUES (354,'2019-12-16 14:19:55','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:55','2019-12-16 14:19:55');
INSERT INTO `loggings` VALUES (355,'2019-12-16 14:19:55','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:55','2019-12-16 14:19:55');
INSERT INTO `loggings` VALUES (356,'2019-12-16 14:19:55','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:55','2019-12-16 14:19:55');
INSERT INTO `loggings` VALUES (357,'2019-12-16 14:19:57','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:57','2019-12-16 14:19:57');
INSERT INTO `loggings` VALUES (358,'2019-12-16 14:19:58','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:58','2019-12-16 14:19:58');
INSERT INTO `loggings` VALUES (359,'2019-12-16 14:19:58','172.19.0.1','POST','http://localhost:11400/search','2019-12-16 14:19:58','2019-12-16 14:19:58');
INSERT INTO `loggings` VALUES (360,'2019-12-16 14:20:00','172.19.0.1','GET','http://localhost:11400/watches/8','2019-12-16 14:20:00','2019-12-16 14:20:00');
INSERT INTO `loggings` VALUES (361,'2019-12-16 14:20:02','172.19.0.1','POST','http://localhost:11400/payments/cf','2019-12-16 14:20:02','2019-12-16 14:20:02');
INSERT INTO `loggings` VALUES (362,'2019-12-16 14:20:02','172.19.0.1','GET','http://localhost:11400/watches/8','2019-12-16 14:20:02','2019-12-16 14:20:02');
INSERT INTO `loggings` VALUES (363,'2019-12-16 14:20:04','172.19.0.1','POST','http://localhost:11400/payments/cf','2019-12-16 14:20:04','2019-12-16 14:20:04');
INSERT INTO `loggings` VALUES (364,'2019-12-16 14:20:06','172.19.0.1','POST','http://localhost:11400/payments/create','2019-12-16 14:20:06','2019-12-16 14:20:06');
INSERT INTO `loggings` VALUES (365,'2019-12-16 14:20:34','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:20:34','2019-12-16 14:20:34');
INSERT INTO `loggings` VALUES (366,'2019-12-16 14:20:35','172.19.0.1','GET','http://localhost:11400/user/order','2019-12-16 14:20:35','2019-12-16 14:20:35');
INSERT INTO `loggings` VALUES (367,'2019-12-16 14:20:37','172.19.0.1','GET','http://localhost:11400/user/order/finish/20191216142004','2019-12-16 14:20:37','2019-12-16 14:20:37');
INSERT INTO `loggings` VALUES (368,'2019-12-16 14:20:39','172.19.0.1','POST','http://localhost:11400/payments/create','2019-12-16 14:20:39','2019-12-16 14:20:39');
INSERT INTO `loggings` VALUES (369,'2019-12-16 14:20:48','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:20:48','2019-12-16 14:20:48');
INSERT INTO `loggings` VALUES (370,'2019-12-16 14:20:50','172.19.0.1','GET','http://localhost:11400/user/order','2019-12-16 14:20:50','2019-12-16 14:20:50');
INSERT INTO `loggings` VALUES (371,'2019-12-16 14:20:51','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:20:51','2019-12-16 14:20:51');
INSERT INTO `loggings` VALUES (372,'2019-12-16 14:23:01','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:23:01','2019-12-16 14:23:01');
INSERT INTO `loggings` VALUES (373,'2019-12-16 14:23:03','172.19.0.1','GET','http://localhost:11400/user/order','2019-12-16 14:23:03','2019-12-16 14:23:03');
INSERT INTO `loggings` VALUES (374,'2019-12-16 14:23:04','172.19.0.1','GET','http://localhost:11400/user/order/finish/20191216142004','2019-12-16 14:23:04','2019-12-16 14:23:04');
INSERT INTO `loggings` VALUES (375,'2019-12-16 14:23:05','172.19.0.1','POST','http://localhost:11400/payments/create','2019-12-16 14:23:05','2019-12-16 14:23:05');
INSERT INTO `loggings` VALUES (376,'2019-12-16 14:23:08','172.19.0.1','GET','http://localhost:11400/payments/return?vnp_Amount=79200000&vnp_BankCode=VNPAY&vnp_CardType=QRCODE&vnp_OrderInfo=Description&vnp_PayDate=20191216212656&vnp_ResponseCode=24&vnp_SecureHash=fef90107a6ea341041510a2da20eaffdd2ab63a7403f8b46e59a6dbae290d804&vnp_SecureHashType=SHA256&vnp_TmnCode=D0WUXYPG&vnp_TransactionNo=0&vnp_TxnRef=20191216142004','2019-12-16 14:23:08','2019-12-16 14:23:08');
INSERT INTO `loggings` VALUES (377,'2019-12-16 14:23:10','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:23:10','2019-12-16 14:23:10');
INSERT INTO `loggings` VALUES (378,'2019-12-16 14:23:11','172.19.0.1','GET','http://localhost:11400/user/order','2019-12-16 14:23:11','2019-12-16 14:23:11');
INSERT INTO `loggings` VALUES (379,'2019-12-16 14:43:59','172.19.0.1','GET','http://localhost:11400','2019-12-16 14:43:59','2019-12-16 14:43:59');
CREATE TABLE IF NOT EXISTS `images` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`watch_id`	integer NOT NULL,
	`path`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime,
	FOREIGN KEY(`watch_id`) REFERENCES `watches`(`id`) on update cascade,
	FOREIGN KEY(`watch_id`) REFERENCES `watches`(`id`) on delete cascade
);
INSERT INTO `images` VALUES (1,1,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (2,1,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (3,1,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (4,1,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (5,2,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (6,2,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (7,2,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (8,2,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (9,3,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (10,3,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (11,3,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (12,3,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (13,4,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (14,4,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (15,4,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (16,4,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (17,5,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (18,5,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (19,5,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (20,5,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (21,6,'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (22,6,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (23,6,'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',NULL,NULL);
INSERT INTO `images` VALUES (24,6,'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',NULL,NULL);
CREATE TABLE IF NOT EXISTS `failed_jobs` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`connection`	text NOT NULL,
	`queue`	text NOT NULL,
	`payload`	text NOT NULL,
	`exception`	text NOT NULL,
	`failed_at`	datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS `currencies` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`name`	varchar NOT NULL,
	`symbol`	varchar NOT NULL,
	`rate`	float NOT NULL,
	`shortcut`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `currencies` VALUES (1,'Dollar','USD',1.0,'$',NULL,NULL);
INSERT INTO `currencies` VALUES (2,'Vietnamdong','VND',22000.0,'đ',NULL,NULL);
CREATE TABLE IF NOT EXISTS `categories` (
	`id`	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	`brand`	varchar NOT NULL,
	`created_at`	datetime,
	`updated_at`	datetime
);
INSERT INTO `categories` VALUES (1,'Luxuc',NULL,NULL);
INSERT INTO `categories` VALUES (2,'Royal',NULL,NULL);
INSERT INTO `categories` VALUES (3,'Tulip',NULL,NULL);
INSERT INTO `categories` VALUES (4,'Sunny',NULL,NULL);
INSERT INTO `categories` VALUES (5,'Princess',NULL,NULL);
INSERT INTO `categories` VALUES (6,'Romance',NULL,NULL);
INSERT INTO `categories` VALUES (7,'Romance1',NULL,NULL);
INSERT INTO `categories` VALUES (8,'Romance2',NULL,NULL);
INSERT INTO `categories` VALUES (9,'Romance3',NULL,NULL);
INSERT INTO `categories` VALUES (10,'Romance4',NULL,NULL);
INSERT INTO `categories` VALUES (11,'Romance5',NULL,NULL);
INSERT INTO `categories` VALUES (12,'Romance6',NULL,NULL);
INSERT INTO `categories` VALUES (13,'Romance7',NULL,NULL);
INSERT INTO `categories` VALUES (14,'Romance8',NULL,NULL);
CREATE INDEX IF NOT EXISTS `watches_category_id_index` ON `watches` (
	`category_id`
);
CREATE UNIQUE INDEX IF NOT EXISTS `users_email_unique` ON `users` (
	`email`
);
CREATE INDEX IF NOT EXISTS `user_infos_user_id_index` ON `user_infos` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `role_user_user_id_index` ON `role_user` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `role_user_role_id_index` ON `role_user` (
	`role_id`
);
CREATE INDEX IF NOT EXISTS `permission_role_role_id_index` ON `permission_role` (
	`role_id`
);
CREATE INDEX IF NOT EXISTS `permission_role_permission_id_index` ON `permission_role` (
	`permission_id`
);
CREATE INDEX IF NOT EXISTS `password_resets_email_index` ON `password_resets` (
	`email`
);
CREATE INDEX IF NOT EXISTS `orders_user_id_index` ON `orders` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `order_watch_watch_id_index` ON `order_watch` (
	`watch_id`
);
CREATE INDEX IF NOT EXISTS `order_watch_order_id_index` ON `order_watch` (
	`order_id`
);
CREATE INDEX IF NOT EXISTS `images_watch_id_index` ON `images` (
	`watch_id`
);
COMMIT;
