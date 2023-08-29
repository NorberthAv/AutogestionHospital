/*
 Navicat Premium Data Transfer

 Source Server         : LocalNorberth
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 10/05/2023 17:06:01
*/


-- ----------------------------
-- Sequence structure for campania_correo_enviado_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."campania_correo_enviado_id_seq";
CREATE SEQUENCE "public"."campania_correo_enviado_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for configurations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."configurations_id_seq";
CREATE SEQUENCE "public"."configurations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for correo_enviado_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."correo_enviado_id_seq";
CREATE SEQUENCE "public"."correo_enviado_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for correo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."correo_id_seq";
CREATE SEQUENCE "public"."correo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for destinatarios_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."destinatarios_id_seq";
CREATE SEQUENCE "public"."destinatarios_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for entidad_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."entidad_id_seq";
CREATE SEQUENCE "public"."entidad_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for marca_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."marca_id_seq";
CREATE SEQUENCE "public"."marca_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for modelo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."modelo_id_seq";
CREATE SEQUENCE "public"."modelo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for municipio_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."municipio_id_seq";
CREATE SEQUENCE "public"."municipio_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for parroquia_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."parroquia_id_seq";
CREATE SEQUENCE "public"."parroquia_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for region_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."region_id_seq";
CREATE SEQUENCE "public"."region_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for tipo_vehiculo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."tipo_vehiculo_id_seq";
CREATE SEQUENCE "public"."tipo_vehiculo_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for campania_correo_enviado
-- ----------------------------
DROP TABLE IF EXISTS "public"."campania_correo_enviado";
CREATE TABLE "public"."campania_correo_enviado" (
  "id" int8 NOT NULL DEFAULT nextval('campania_correo_enviado_id_seq'::regclass),
  "correo_id" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_envio_campania" date,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "estatus" bool NOT NULL DEFAULT true,
  "user_id" int8,
  "nombre_campania" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of campania_correo_enviado
-- ----------------------------
INSERT INTO "public"."campania_correo_enviado" VALUES (2, '4', '2023-05-18', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 't', NULL, 'campañaajuste');

-- ----------------------------
-- Table structure for configurations
-- ----------------------------
DROP TABLE IF EXISTS "public"."configurations";
CREATE TABLE "public"."configurations" (
  "id" int8 NOT NULL DEFAULT nextval('configurations_id_seq'::regclass),
  "type" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL,
  "user_id" int8 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_at" timestamp(6),
  "deleted_at" timestamp(6)
)
;

-- ----------------------------
-- Records of configurations
-- ----------------------------

-- ----------------------------
-- Table structure for correo
-- ----------------------------
DROP TABLE IF EXISTS "public"."correo";
CREATE TABLE "public"."correo" (
  "id" int8 NOT NULL DEFAULT nextval('correo_id_seq'::regclass),
  "descripcion" text COLLATE "pg_catalog"."default",
  "asunto" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_envio" date,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "estatus" bool NOT NULL DEFAULT true,
  "user_id" int8,
  "campania" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of correo
-- ----------------------------
INSERT INTO "public"."correo" VALUES (4, '<p>dfffdsdgdsggsdgdssgddsggdsdsg</p>', 'prueba de carga correo', NULL, '2023-05-10 14:49:56', '2023-05-10 14:49:56', NULL, 't', 1, 'campañaajuste');

-- ----------------------------
-- Table structure for correo_enviado
-- ----------------------------
DROP TABLE IF EXISTS "public"."correo_enviado";
CREATE TABLE "public"."correo_enviado" (
  "id" int8 NOT NULL DEFAULT nextval('correo_enviado_id_seq'::regclass),
  "destinatario" varchar(255) COLLATE "pg_catalog"."default",
  "fecha_envio" date,
  "correo_id" int8,
  "enviado" bool DEFAULT false,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "estatus" bool NOT NULL DEFAULT true,
  "user_id" int8,
  "campania_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of correo_enviado
-- ----------------------------
INSERT INTO "public"."correo_enviado" VALUES (1308, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1309, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1310, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1311, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1312, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1313, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1314, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1315, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1316, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1317, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1318, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1319, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1320, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1321, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1322, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1323, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1324, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1325, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1326, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1327, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1328, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1329, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1330, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1331, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1332, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1333, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1334, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1335, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1336, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1337, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1338, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1339, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1340, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1341, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1342, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1343, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1344, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1345, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1346, 'Sai-222@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1347, 'Pepe-hhh@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1348, 'norberthavilan@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1349, 'mariaGarcia@gmail.com', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);
INSERT INTO "public"."correo_enviado" VALUES (1350, 'dfsfdsdfsdfs', '2023-05-18', 4, 'f', '2023-05-10 14:55:42', '2023-05-10 14:55:42', NULL, 'f', NULL, 2);

-- ----------------------------
-- Table structure for destinatarios
-- ----------------------------
DROP TABLE IF EXISTS "public"."destinatarios";
CREATE TABLE "public"."destinatarios" (
  "id" int8 NOT NULL DEFAULT nextval('destinatarios_id_seq'::regclass),
  "correo_id" int8,
  "direccion_destinatario" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_destinatario" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0),
  "estatus" bool NOT NULL DEFAULT true,
  "user_id" int8
)
;

-- ----------------------------
-- Records of destinatarios
-- ----------------------------

-- ----------------------------
-- Table structure for entidad
-- ----------------------------
DROP TABLE IF EXISTS "public"."entidad";
CREATE TABLE "public"."entidad" (
  "id" int8 NOT NULL DEFAULT nextval('entidad_id_seq'::regclass),
  "entidad" varchar(255) COLLATE "pg_catalog"."default",
  "region_id" int8,
  "codcne" int8,
  "created_at" timestamp(0) NOT NULL DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."entidad"."id" IS 'Identificador entidad';
COMMENT ON COLUMN "public"."entidad"."entidad" IS 'Nombre entidad';
COMMENT ON COLUMN "public"."entidad"."region_id" IS 'Identificador region';
COMMENT ON COLUMN "public"."entidad"."codcne" IS 'Codigo consejo nacional electoral';
COMMENT ON COLUMN "public"."entidad"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "public"."entidad"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."entidad"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of entidad
-- ----------------------------

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS "public"."marca";
CREATE TABLE "public"."marca" (
  "id" int8 NOT NULL DEFAULT nextval('marca_id_seq'::regclass),
  "descripcion" varchar(255) COLLATE "pg_catalog"."default",
  "tipo_vehiculo_id" int8,
  "estatus" bool DEFAULT true,
  "user_id" int8 NOT NULL DEFAULT 1,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."marca"."id" IS 'Identificador marca';
COMMENT ON COLUMN "public"."marca"."descripcion" IS 'Descripcion marca';
COMMENT ON COLUMN "public"."marca"."tipo_vehiculo_id" IS 'Identificador tipo vehiculo';
COMMENT ON COLUMN "public"."marca"."estatus" IS 'Estatus marca';
COMMENT ON COLUMN "public"."marca"."user_id" IS 'Identificador usuario';
COMMENT ON COLUMN "public"."marca"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "public"."marca"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."marca"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of marca
-- ----------------------------

-- ----------------------------
-- Table structure for modelo
-- ----------------------------
DROP TABLE IF EXISTS "public"."modelo";
CREATE TABLE "public"."modelo" (
  "id" int8 NOT NULL DEFAULT nextval('modelo_id_seq'::regclass),
  "marca_id" int8,
  "descripcion" varchar(255) COLLATE "pg_catalog"."default",
  "estatus" bool DEFAULT true,
  "user_id" int8 NOT NULL DEFAULT 1,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."modelo"."id" IS 'Identificador modelo';
COMMENT ON COLUMN "public"."modelo"."marca_id" IS 'Identificador marca';
COMMENT ON COLUMN "public"."modelo"."descripcion" IS 'Descripcion modelo';
COMMENT ON COLUMN "public"."modelo"."estatus" IS 'Estatus modelo';
COMMENT ON COLUMN "public"."modelo"."user_id" IS 'Identificador usuario';
COMMENT ON COLUMN "public"."modelo"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "public"."modelo"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."modelo"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of modelo
-- ----------------------------

-- ----------------------------
-- Table structure for municipio
-- ----------------------------
DROP TABLE IF EXISTS "public"."municipio";
CREATE TABLE "public"."municipio" (
  "id" int8 NOT NULL DEFAULT nextval('municipio_id_seq'::regclass),
  "entidad_id" int8 NOT NULL,
  "municipio" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "codcne" int8,
  "estatus" bool DEFAULT true,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."municipio"."id" IS 'Identificador municipio';
COMMENT ON COLUMN "public"."municipio"."entidad_id" IS 'Identificador entidad';
COMMENT ON COLUMN "public"."municipio"."municipio" IS 'Nombre municipio';
COMMENT ON COLUMN "public"."municipio"."codcne" IS 'Codigo consejo nacional electoral';
COMMENT ON COLUMN "public"."municipio"."estatus" IS 'Estatus municipio';
COMMENT ON COLUMN "public"."municipio"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "public"."municipio"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."municipio"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of municipio
-- ----------------------------

-- ----------------------------
-- Table structure for parroquia
-- ----------------------------
DROP TABLE IF EXISTS "public"."parroquia";
CREATE TABLE "public"."parroquia" (
  "id" int8 NOT NULL DEFAULT nextval('parroquia_id_seq'::regclass),
  "municipio_id" int8 NOT NULL,
  "parroquia" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "codcne" int8,
  "estatus" bool DEFAULT true,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."parroquia"."id" IS 'Identificador parroquia';
COMMENT ON COLUMN "public"."parroquia"."municipio_id" IS 'Identificador municipio';
COMMENT ON COLUMN "public"."parroquia"."parroquia" IS 'Nombre parroquia';
COMMENT ON COLUMN "public"."parroquia"."codcne" IS 'Codigo consejo nacional electoral';
COMMENT ON COLUMN "public"."parroquia"."estatus" IS 'Estatus parroquia';
COMMENT ON COLUMN "public"."parroquia"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "public"."parroquia"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."parroquia"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of parroquia
-- ----------------------------

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS "public"."region";
CREATE TABLE "public"."region" (
  "id" int8 NOT NULL DEFAULT nextval('region_id_seq'::regclass),
  "region" varchar(16) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."region"."id" IS 'Identificador region';
COMMENT ON COLUMN "public"."region"."region" IS 'Nombre region';

-- ----------------------------
-- Records of region
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_vehiculo
-- ----------------------------
DROP TABLE IF EXISTS "public"."tipo_vehiculo";
CREATE TABLE "public"."tipo_vehiculo" (
  "id" int8 NOT NULL DEFAULT nextval('tipo_vehiculo_id_seq'::regclass),
  "descripcion" varchar(255) COLLATE "pg_catalog"."default",
  "estatus" bool DEFAULT true,
  "user_id" int8 NOT NULL DEFAULT 1,
  "created_at" timestamp(0) DEFAULT now(),
  "updated_at" timestamp(0),
  "deleted_at" timestamp(0)
)
;
COMMENT ON COLUMN "public"."tipo_vehiculo"."id" IS 'Identificador tipo vehiculo';
COMMENT ON COLUMN "public"."tipo_vehiculo"."descripcion" IS 'Descripcion tipo vehiculo';
COMMENT ON COLUMN "public"."tipo_vehiculo"."estatus" IS 'Estatus tipo vehiculo';
COMMENT ON COLUMN "public"."tipo_vehiculo"."user_id" IS 'Identificador usuario';
COMMENT ON COLUMN "public"."tipo_vehiculo"."created_at" IS 'Creación del registro en la tabla ';
COMMENT ON COLUMN "public"."tipo_vehiculo"."updated_at" IS 'Actualizacion del registro en la tabla';
COMMENT ON COLUMN "public"."tipo_vehiculo"."deleted_at" IS 'Borrado del registro en la tabla';

-- ----------------------------
-- Records of tipo_vehiculo
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."campania_correo_enviado_id_seq"
OWNED BY "public"."campania_correo_enviado"."id";
SELECT setval('"public"."campania_correo_enviado_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."configurations_id_seq"
OWNED BY "public"."configurations"."id";
SELECT setval('"public"."configurations_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."correo_enviado_id_seq"
OWNED BY "public"."correo_enviado"."id";
SELECT setval('"public"."correo_enviado_id_seq"', 1350, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."correo_id_seq"
OWNED BY "public"."correo"."id";
SELECT setval('"public"."correo_id_seq"', 4, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."destinatarios_id_seq"
OWNED BY "public"."destinatarios"."id";
SELECT setval('"public"."destinatarios_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."entidad_id_seq"
OWNED BY "public"."entidad"."id";
SELECT setval('"public"."entidad_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."marca_id_seq"
OWNED BY "public"."marca"."id";
SELECT setval('"public"."marca_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."modelo_id_seq"
OWNED BY "public"."modelo"."id";
SELECT setval('"public"."modelo_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."municipio_id_seq"
OWNED BY "public"."municipio"."id";
SELECT setval('"public"."municipio_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."parroquia_id_seq"
OWNED BY "public"."parroquia"."id";
SELECT setval('"public"."parroquia_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."region_id_seq"
OWNED BY "public"."region"."id";
SELECT setval('"public"."region_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."tipo_vehiculo_id_seq"
OWNED BY "public"."tipo_vehiculo"."id";
SELECT setval('"public"."tipo_vehiculo_id_seq"', 1, false);

-- ----------------------------
-- Uniques structure for table campania_correo_enviado
-- ----------------------------
ALTER TABLE "public"."campania_correo_enviado" ADD CONSTRAINT "campania_id" UNIQUE ("id");
COMMENT ON CONSTRAINT "campania_id" ON "public"."campania_correo_enviado" IS 'unico';

-- ----------------------------
-- Foreign Keys structure for table correo_enviado
-- ----------------------------
ALTER TABLE "public"."correo_enviado" ADD CONSTRAINT "Campania_id_fkey_id" FOREIGN KEY ("campania_id") REFERENCES "public"."campania_correo_enviado" ("id") ON DELETE NO ACTION ON UPDATE CASCADE;
