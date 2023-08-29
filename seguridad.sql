/*
 Navicat Premium Data Transfer

 Source Server         : LocalNorberth
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : seguridad

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 10/05/2023 18:07:09
*/


-- ----------------------------
-- Sequence structure for menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."menu_id_seq";
CREATE SEQUENCE "seguridad"."menu_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permisos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."permisos_id_seq";
CREATE SEQUENCE "seguridad"."permisos_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permisos_menus_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."permisos_menus_id_seq";
CREATE SEQUENCE "seguridad"."permisos_menus_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permisos_roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."permisos_roles_id_seq";
CREATE SEQUENCE "seguridad"."permisos_roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for roles_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."roles_id_seq";
CREATE SEQUENCE "seguridad"."roles_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for sessions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."sessions_id_seq";
CREATE SEQUENCE "seguridad"."sessions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "seguridad"."users_id_seq";
CREATE SEQUENCE "seguridad"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."menu";
CREATE TABLE "seguridad"."menu" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".menu_id_seq'::regclass),
  "nombre" varchar(150) COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar(150) COLLATE "pg_catalog"."default",
  "menu_id" int8 DEFAULT 0,
  "url" varchar(100) COLLATE "pg_catalog"."default",
  "icono" varchar(50) COLLATE "pg_catalog"."default",
  "orden" int2 NOT NULL DEFAULT '0'::smallint,
  "es_titulo" bool NOT NULL DEFAULT false,
  "status" bool DEFAULT true,
  "user_id" int8 NOT NULL,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "can" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO "seguridad"."menu" VALUES (1, 'Parámetros', 'parametros', NULL, '#', 'fas fa-cogs', 1, 't', 't', 29, '2021-11-08 12:34:15', '2023-04-12 13:57:37', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (2, 'Configuración', 'configuracion', NULL, '#', 'fas fa-wrench', 8, 't', 't', 37, '2021-11-08 12:34:15', '2023-05-04 15:48:29', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (3, 'Seguridad', 'seguridad', NULL, '#', 'fas fa-shield-alt', 9, 't', 't', 1, '2021-11-12 01:52:11', '2023-05-04 15:48:29', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (4, 'Auditoria', 'auditoria', NULL, '#', 'fas fa-eye', 10, 't', 't', 1, '2021-11-08 12:34:15', '2023-05-04 15:48:29', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (5, 'Módulo', 'menus', 2, '/menus', 'fas fa-list-ol', 2, 'f', 't', 1, '2022-03-12 00:42:34', '2022-07-20 22:05:37', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (6, 'Sesiones Activas', NULL, 4, '/sesiones', 'fas fa-user-clock', 3, 'f', 't', 1, '2022-07-20 15:33:26', '2022-07-29 20:38:38', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (7, 'Cambio de contraseña', NULL, 3, '/cambioClave', 'fas fa-shield-alt', 2, 'f', 't', 1, '2022-07-20 04:52:45', '2022-07-26 13:55:51', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (8, 'Roles', 'roles', 2, '/roles', 'fas fa-users-cog', 2, 'f', 't', 1, '2022-03-13 16:08:39', '2022-07-21 21:10:39', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (9, 'Autenticaciones Exitosa', NULL, 4, '/autexitosas', 'fas fa-user-check', 2, 'f', 't', 1, '2022-07-20 15:35:46', '2022-07-29 20:55:48', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (10, 'Usuarios', 'usuarios', 3, '/usuarios', 'fas fa-users', 1, 'f', 't', 1, '2021-11-12 01:52:11', NULL, NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (11, 'Trazas', 'trazas', 4, '/trazas', 'fas fa-database', 4, 'f', 't', 1, '2021-11-12 01:52:11', '2022-07-29 20:54:35', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (12, 'Autenticaciones Fallidas', NULL, 4, '/autfallidas', 'fas fa-user-times', 1, 'f', 't', 1, '2022-11-16 21:15:13', NULL, NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (13, 'Permisos', NULL, 2, '/permisos', 'fas fa-tasks', 3, 'f', 't', 1, '2022-11-16 21:16:48', NULL, NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (14, 'Modelo', NULL, NULL, '#', 'fas fa-boxes', 1, 'f', 'f', 10, '2022-11-16 21:47:34', '2023-02-09 14:23:31', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (15, 'parametronew', NULL, 1, '/digitalizar', 'fas fa-tablet', 1, 'f', 't', 1, '2023-05-05 16:05:20', '2023-05-05 16:05:20', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (16, 'Mensajeria', NULL, NULL, '#', 'fas fa-envelope', 1, 't', 't', 1, '2023-05-08 15:04:01', '2023-05-08 15:04:01', NULL, NULL);
INSERT INTO "seguridad"."menu" VALUES (17, 'Correo', NULL, 16, '/correo', 'far fa-envelope', 1, 'f', 't', 1, '2023-05-08 15:04:38', '2023-05-08 15:05:44', NULL, NULL);

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."permisos";
CREATE TABLE "seguridad"."permisos" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".permisos_id_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre_mostrar" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8 NOT NULL,
  "activo" bool DEFAULT true,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "orden" int4,
  "requerido" bool DEFAULT false,
  "tipo_control" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO "seguridad"."permisos" VALUES (1, 'agregar', 'Agregar', 1, 't', '2021-11-07 06:22:04', NULL, NULL, NULL, 'f', NULL);
INSERT INTO "seguridad"."permisos" VALUES (2, 'editar', 'Editar', 1, 't', '2021-11-07 06:22:28', NULL, NULL, NULL, 'f', NULL);
INSERT INTO "seguridad"."permisos" VALUES (3, 'consultar', 'Consultar', 1, 't', '2021-11-07 06:22:47', NULL, NULL, NULL, 'f', NULL);
INSERT INTO "seguridad"."permisos" VALUES (4, 'eliminar', 'Eliminar', 1, 't', '2021-11-07 06:23:04', NULL, NULL, NULL, 'f', NULL);
INSERT INTO "seguridad"."permisos" VALUES (5, 'prueba', 'Pruebas', 1, 't', '2022-11-16 21:26:56', '2022-11-17 13:52:05', NULL, NULL, 'f', NULL);

-- ----------------------------
-- Table structure for permisos_menus
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."permisos_menus";
CREATE TABLE "seguridad"."permisos_menus" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".permisos_menus_id_seq'::regclass),
  "permiso_id" int8 NOT NULL,
  "menu_id" int8 NOT NULL,
  "submenu_id" int8 NOT NULL,
  "rol_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "activo" bool NOT NULL DEFAULT true,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "tamanio_campo" int4
)
;

-- ----------------------------
-- Records of permisos_menus
-- ----------------------------
INSERT INTO "seguridad"."permisos_menus" VALUES (61, 1, 4, 9, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (62, 3, 4, 9, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (63, 2, 4, 9, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (64, 4, 4, 9, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (65, 1, 4, 12, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (66, 3, 4, 12, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (67, 2, 4, 12, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (68, 1, 4, 6, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (69, 3, 4, 6, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (70, 2, 4, 6, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (71, 1, 4, 11, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (72, 3, 4, 11, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (73, 2, 4, 11, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (74, 1, 2, 5, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (75, 3, 2, 5, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (76, 2, 2, 5, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (77, 1, 2, 13, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (78, 3, 2, 13, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (79, 2, 2, 13, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (80, 1, 2, 8, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (81, 3, 2, 8, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (82, 2, 2, 8, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (83, 1, 16, 17, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (84, 3, 16, 17, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (85, 2, 16, 17, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (86, 4, 16, 17, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (87, 1, 1, 15, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (88, 3, 1, 15, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (89, 2, 1, 15, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (90, 4, 1, 15, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (91, 1, 3, 7, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (92, 3, 3, 7, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (93, 2, 3, 7, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (94, 1, 3, 10, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (95, 3, 3, 10, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);
INSERT INTO "seguridad"."permisos_menus" VALUES (96, 2, 3, 10, 1, 1, 't', '2023-05-08 15:05:03', '2023-05-08 15:05:03', NULL, NULL);

-- ----------------------------
-- Table structure for permisos_roles
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."permisos_roles";
CREATE TABLE "seguridad"."permisos_roles" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".permisos_roles_id_seq'::regclass),
  "permiso_id" int8 NOT NULL,
  "submenu_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "activo" bool NOT NULL DEFAULT true,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of permisos_roles
-- ----------------------------
INSERT INTO "seguridad"."permisos_roles" VALUES (1, 1, 5, 1, 't', '2023-05-05 15:07:44', '2023-05-05 15:07:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (2, 3, 5, 1, 't', '2023-05-05 15:07:44', '2023-05-05 15:07:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (3, 2, 5, 1, 't', '2023-05-05 15:07:44', '2023-05-05 15:07:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (4, 4, 5, 1, 't', '2023-05-05 15:07:44', '2023-05-05 15:07:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (5, 1, 12, 1, 't', '2023-05-05 15:08:08', '2023-05-05 15:08:08', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (6, 3, 12, 1, 't', '2023-05-05 15:08:08', '2023-05-05 15:08:08', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (7, 2, 12, 1, 't', '2023-05-05 15:08:08', '2023-05-05 15:08:08', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (8, 4, 12, 1, 't', '2023-05-05 15:08:08', '2023-05-05 15:08:08', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (9, 1, 9, 1, 't', '2023-05-05 15:08:19', '2023-05-05 15:08:19', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (10, 3, 9, 1, 't', '2023-05-05 15:08:19', '2023-05-05 15:08:19', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (11, 2, 9, 1, 't', '2023-05-05 15:08:19', '2023-05-05 15:08:19', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (12, 4, 9, 1, 't', '2023-05-05 15:08:19', '2023-05-05 15:08:19', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (13, 1, 6, 1, 't', '2023-05-05 15:08:32', '2023-05-05 15:08:32', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (14, 3, 6, 1, 't', '2023-05-05 15:08:32', '2023-05-05 15:08:32', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (15, 2, 6, 1, 't', '2023-05-05 15:08:32', '2023-05-05 15:08:32', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (16, 4, 6, 1, 't', '2023-05-05 15:08:32', '2023-05-05 15:08:32', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (17, 1, 11, 1, 't', '2023-05-05 15:08:44', '2023-05-05 15:08:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (18, 3, 11, 1, 't', '2023-05-05 15:08:44', '2023-05-05 15:08:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (19, 2, 11, 1, 't', '2023-05-05 15:08:44', '2023-05-05 15:08:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (20, 4, 11, 1, 't', '2023-05-05 15:08:44', '2023-05-05 15:08:44', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (21, 1, 8, 1, 't', '2023-05-05 15:08:54', '2023-05-05 15:08:54', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (22, 3, 8, 1, 't', '2023-05-05 15:08:54', '2023-05-05 15:08:54', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (23, 2, 8, 1, 't', '2023-05-05 15:08:54', '2023-05-05 15:08:54', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (24, 4, 8, 1, 't', '2023-05-05 15:08:54', '2023-05-05 15:08:54', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (25, 1, 13, 1, 't', '2023-05-05 15:09:29', '2023-05-05 15:09:29', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (26, 3, 13, 1, 't', '2023-05-05 15:09:29', '2023-05-05 15:09:29', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (27, 2, 13, 1, 't', '2023-05-05 15:09:29', '2023-05-05 15:09:29', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (28, 4, 13, 1, 't', '2023-05-05 15:09:29', '2023-05-05 15:09:29', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (29, 1, 7, 1, 't', '2023-05-05 15:09:39', '2023-05-05 15:09:39', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (30, 3, 7, 1, 't', '2023-05-05 15:09:39', '2023-05-05 15:09:39', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (31, 2, 7, 1, 't', '2023-05-05 15:09:39', '2023-05-05 15:09:39', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (32, 4, 7, 1, 't', '2023-05-05 15:09:39', '2023-05-05 15:09:39', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (33, 1, 10, 1, 't', '2023-05-05 15:09:50', '2023-05-05 15:09:50', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (34, 3, 10, 1, 't', '2023-05-05 15:09:50', '2023-05-05 15:09:50', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (35, 2, 10, 1, 't', '2023-05-05 15:09:50', '2023-05-05 15:09:50', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (36, 4, 10, 1, 't', '2023-05-05 15:09:50', '2023-05-05 15:09:50', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (37, 1, 1, 1, 't', '2023-05-05 15:11:42', '2023-05-05 15:11:42', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (38, 2, 1, 1, 't', '2023-05-05 15:11:42', '2023-05-05 15:11:42', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (39, 3, 1, 1, 't', '2023-05-05 15:11:42', '2023-05-05 15:11:42', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (40, 4, 1, 1, 't', '2023-05-05 15:11:42', '2023-05-05 15:11:42', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (45, 1, 15, 1, 't', '2023-05-05 16:07:14', '2023-05-05 16:07:14', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (46, 3, 15, 1, 't', '2023-05-05 16:07:14', '2023-05-05 16:07:14', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (47, 2, 15, 1, 't', '2023-05-05 16:07:14', '2023-05-05 16:07:14', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (48, 4, 15, 1, 't', '2023-05-05 16:07:14', '2023-05-05 16:07:14', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (49, 1, 17, 1, 't', '2023-05-08 15:04:38', '2023-05-08 15:04:38', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (50, 2, 17, 1, 't', '2023-05-08 15:04:38', '2023-05-08 15:04:38', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (51, 3, 17, 1, 't', '2023-05-08 15:04:38', '2023-05-08 15:04:38', NULL);
INSERT INTO "seguridad"."permisos_roles" VALUES (52, 4, 17, 1, 't', '2023-05-08 15:04:38', '2023-05-08 15:04:38', NULL);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."roles";
CREATE TABLE "seguridad"."roles" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".roles_id_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8 NOT NULL,
  "activo" bool DEFAULT true,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO "seguridad"."roles" VALUES (1, 'ADMINISTRADOR DEL SISTEMA', 1, 't', '2022-07-25 15:03:15', '2023-05-05 15:10:45', NULL);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."sessions";
CREATE TABLE "seguridad"."sessions" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".sessions_id_seq'::regclass),
  "user_id" int8,
  "ip_address" varchar(15) COLLATE "pg_catalog"."default",
  "access_date" timestamp(6) DEFAULT now(),
  "created_at" timestamp(6) DEFAULT now(),
  "updated_at" timestamp(6),
  "deleted_at" timestamp(6),
  "user_agent" text COLLATE "pg_catalog"."default",
  "payload" text COLLATE "pg_catalog"."default",
  "last_activity" int4
)
;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO "seguridad"."sessions" VALUES (1, 1, '127.0.0.1', '2023-05-05 14:44:32', '2023-05-05 14:44:32', '2023-05-08 15:01:38', '2023-05-08 15:01:38', NULL, 'Kj76q33XsiUrXFh2dCzrG8CvikVbOVKXLRGWWSGV', NULL);
INSERT INTO "seguridad"."sessions" VALUES (2, 1, '127.0.0.1', '2023-05-08 15:01:43', '2023-05-08 15:01:43', '2023-05-09 17:01:10', '2023-05-09 17:01:10', NULL, 'Owny3Vu3BYRQHKrL9nQUAqzstcJKHDViSzbGdfrJ', NULL);
INSERT INTO "seguridad"."sessions" VALUES (3, 1, '127.0.0.1', '2023-05-09 17:01:17', '2023-05-09 17:01:17', '2023-05-10 09:34:11', '2023-05-10 09:34:11', NULL, 'MoNHAkyj5XHUZ3R3XoZnTi3sXQJEknECBb2MIm0N', NULL);
INSERT INTO "seguridad"."sessions" VALUES (4, 1, '127.0.0.1', '2023-05-10 09:34:15', '2023-05-10 09:34:15', '2023-05-10 14:49:13', '2023-05-10 14:49:13', NULL, 'HFYfRV6NVqkhHvRModZhk4CFCA7JeGhh6GfdFL06', NULL);
INSERT INTO "seguridad"."sessions" VALUES (5, 1, '127.0.0.1', '2023-05-10 14:49:16', '2023-05-10 14:49:16', '2023-05-10 14:49:16', NULL, NULL, 'qvROWAbW4r6yxUeXCq2XaRgTxQTx3X4bKjUgCaz5', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "seguridad"."users";
CREATE TABLE "seguridad"."users" (
  "id" int8 NOT NULL DEFAULT nextval('"seguridad".users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email_verified_at" timestamp(0),
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "remember_token" varchar(100) COLLATE "pg_catalog"."default",
  "activated" bool,
  "activation_code" varchar(255) COLLATE "pg_catalog"."default",
  "activated_at" timestamp(6),
  "last_login" timestamp(6),
  "cedula" int8 NOT NULL,
  "primer_nombre" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "segundo_nombre" varchar(30) COLLATE "pg_catalog"."default",
  "primer_apellido" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "segundo_apellido" varchar(30) COLLATE "pg_catalog"."default",
  "telefono_local" varchar(20) COLLATE "pg_catalog"."default",
  "telefono_movil" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "direccion_habitacion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "direccion_trabajo" varchar(255) COLLATE "pg_catalog"."default",
  "estatus" bool NOT NULL DEFAULT true,
  "ruta_foto" varchar(255) COLLATE "pg_catalog"."default",
  "usuario_interno" bool NOT NULL,
  "user_id" int8,
  "created_at" timestamp(0),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "rol_id" int8 NOT NULL,
  "letra" varchar(1) COLLATE "pg_catalog"."default" NOT NULL,
  "testigo" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "seguridad"."users" VALUES (1, 'navilan', 'norberthavilan@gmail.com', NULL, '$2y$10$mqqRZABgFMmM6T64egTgvudnE5XzrqS7ZDvp83SIWTsL2XIP1VTd6', NULL, NULL, NULL, NULL, NULL, 25869623, 'NORBERTH', 'JOSE', 'AVILAN', 'ARRECHEDERA', '(0212) 681-44-16', '(0416) 413-50-60', 'LOS JARDINES DEL VALLE', NULL, 't', NULL, 't', 1, '2023-04-20 14:23:19', '2023-05-10 14:49:16', NULL, 1, 'V', 'f');

-- ----------------------------
-- View structure for v_menus
-- ----------------------------
DROP VIEW IF EXISTS "seguridad"."v_menus";
CREATE VIEW "seguridad"."v_menus" AS  WITH RECURSIVE cte AS (
         SELECT child.icono,
            child.id,
            child.nombre::character varying(100) AS nombre,
            child.menu_id::smallint AS menu_id,
            child.url,
            '->> '::character varying(100) AS lvl,
            child.id::character varying(100) AS hierarchy,
            child.orden::character varying AS val,
            child.status,
            child.es_titulo
           FROM seguridad.menu child
          WHERE (child.id IN ( SELECT menu.id
                   FROM seguridad.menu
                  WHERE menu.menu_id IS NULL))
        UNION ALL
         SELECT child.icono,
            child.id,
            ((parent.lvl::text || child.nombre::text))::character varying(100) AS nombre,
            child.menu_id::smallint AS menu_id,
            child.url,
            (('->> '::text || parent.lvl::text))::character varying(100) AS lvl,
            (((parent.hierarchy::text || ','::text) || child.id::character varying(100)::text))::character varying(100) AS hierarchy,
            (parent.val::text || row_number() OVER (ORDER BY child.orden)::text)::character varying AS val,
            child.status,
            child.es_titulo
           FROM cte parent
             JOIN seguridad.menu child ON child.menu_id = parent.id
        )
 SELECT cte.icono,
    cte.id,
    cte.nombre,
    cte.menu_id,
    cte.url,
    cte.lvl,
    cte.hierarchy,
    cte.val,
    cte.status,
    cte.es_titulo
   FROM cte
  ORDER BY cte.val;

-- ----------------------------
-- View structure for v_menus_rol
-- ----------------------------
DROP VIEW IF EXISTS "seguridad"."v_menus_rol";
CREATE VIEW "seguridad"."v_menus_rol" AS  SELECT menu.id,
    menu.nombre,
    menu.slug,
    menu.menu_id,
    menu.url,
    menu.icono,
    menu.orden,
    menu.es_titulo,
    menu.can,
    permisos_menus.rol_id
   FROM seguridad.menu
     JOIN seguridad.permisos_menus ON permisos_menus.menu_id = menu.id
  WHERE menu.status = true AND menu.deleted_at IS NULL
  GROUP BY menu.id, menu.nombre, menu.slug, menu.menu_id, menu.url, menu.icono, menu.orden, menu.es_titulo, menu.can, permisos_menus.rol_id
UNION ALL
 SELECT menu.id,
    menu.nombre,
    menu.slug,
    menu.menu_id,
    menu.url,
    menu.icono,
    menu.orden,
    menu.es_titulo,
    menu.can,
    permisos_menus.rol_id
   FROM seguridad.menu
     JOIN seguridad.permisos_menus ON permisos_menus.submenu_id = menu.id
  WHERE menu.status = true AND menu.deleted_at IS NULL
  GROUP BY menu.id, menu.nombre, menu.slug, menu.menu_id, menu.url, menu.icono, menu.orden, menu.es_titulo, menu.can, permisos_menus.rol_id;

-- ----------------------------
-- View structure for v_permisos_menus
-- ----------------------------
DROP VIEW IF EXISTS "seguridad"."v_permisos_menus";
CREATE VIEW "seguridad"."v_permisos_menus" AS  SELECT permisos_menus.id,
    permisos_menus.permiso_id,
    permisos_menus.menu_id,
    permisos_menus.submenu_id,
    permisos_menus.rol_id,
    permisos_menus.activo,
    permisos.nombre AS permiso,
    permisos.nombre_mostrar,
    menu.nombre AS nombre_menu,
    menu.url
   FROM seguridad.permisos_menus
     JOIN seguridad.permisos ON permisos_menus.permiso_id = permisos.id
     JOIN seguridad.menu ON permisos_menus.submenu_id = menu.id;

-- ----------------------------
-- View structure for v_permisos_roles
-- ----------------------------
DROP VIEW IF EXISTS "seguridad"."v_permisos_roles";
CREATE VIEW "seguridad"."v_permisos_roles" AS  SELECT permisos_roles.permiso_id AS id,
    permisos.nombre,
    permisos.nombre_mostrar,
    permisos_roles.submenu_id,
    permisos_roles.activo,
    permisos_roles.created_at,
    permisos_roles.user_id
   FROM seguridad.permisos_roles
     JOIN seguridad.permisos ON permisos_roles.permiso_id = permisos.id;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."menu_id_seq"
OWNED BY "seguridad"."menu"."id";
SELECT setval('"seguridad"."menu_id_seq"', 17, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."permisos_id_seq"
OWNED BY "seguridad"."permisos"."id";
SELECT setval('"seguridad"."permisos_id_seq"', 6, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."permisos_menus_id_seq"
OWNED BY "seguridad"."permisos_menus"."id";
SELECT setval('"seguridad"."permisos_menus_id_seq"', 96, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."permisos_roles_id_seq"
OWNED BY "seguridad"."permisos_roles"."id";
SELECT setval('"seguridad"."permisos_roles_id_seq"', 52, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."roles_id_seq"
OWNED BY "seguridad"."roles"."id";
SELECT setval('"seguridad"."roles_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."sessions_id_seq"
OWNED BY "seguridad"."sessions"."id";
SELECT setval('"seguridad"."sessions_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "seguridad"."users_id_seq"
OWNED BY "seguridad"."users"."id";
SELECT setval('"seguridad"."users_id_seq"', 2, false);
