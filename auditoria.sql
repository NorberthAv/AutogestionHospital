/*
 Navicat Premium Data Transfer

 Source Server         : LocalNorberth
 Source Server Type    : PostgreSQL
 Source Server Version : 140005
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : auditoria

 Target Server Type    : PostgreSQL
 Target Server Version : 140005
 File Encoding         : 65001

 Date: 10/05/2023 18:05:01
*/


-- ----------------------------
-- Sequence structure for autenticaciones_exitosas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "auditoria"."autenticaciones_exitosas_id_seq";
CREATE SEQUENCE "auditoria"."autenticaciones_exitosas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for autenticaciones_fallidas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "auditoria"."autenticaciones_fallidas_id_seq";
CREATE SEQUENCE "auditoria"."autenticaciones_fallidas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for trazas_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "auditoria"."trazas_id_seq";
CREATE SEQUENCE "auditoria"."trazas_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for autenticaciones_exitosas
-- ----------------------------
DROP TABLE IF EXISTS "auditoria"."autenticaciones_exitosas";
CREATE TABLE "auditoria"."autenticaciones_exitosas" (
  "id" int8 NOT NULL DEFAULT nextval('"auditoria".autenticaciones_exitosas_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "role" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ip_ultimo_acceso" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" int4 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_at" timestamp(6)
)
;
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."id" IS 'Identificador de autenticaciones';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."name" IS 'Nombre autenticaciones';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."role" IS 'Rol  autenticaciones';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."ip_ultimo_acceso" IS 'Direccion ip autenticaciones';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."user_id" IS 'Identificador usuario';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "auditoria"."autenticaciones_exitosas"."updated_at" IS 'Actualizacion del registro en la tabla';

-- ----------------------------
-- Records of autenticaciones_exitosas
-- ----------------------------
INSERT INTO "auditoria"."autenticaciones_exitosas" VALUES (1, 'navilan', 'ADMINISTRADOR DEL SISTEMA', '127.0.0.1', 1, '2023-05-05 14:44:32', '2023-05-05 14:44:32');
INSERT INTO "auditoria"."autenticaciones_exitosas" VALUES (2, 'navilan', 'ADMINISTRADOR DEL SISTEMA', '127.0.0.1', 1, '2023-05-08 15:01:43', '2023-05-08 15:01:43');
INSERT INTO "auditoria"."autenticaciones_exitosas" VALUES (3, 'navilan', 'ADMINISTRADOR DEL SISTEMA', '127.0.0.1', 1, '2023-05-09 17:01:16', '2023-05-09 17:01:16');
INSERT INTO "auditoria"."autenticaciones_exitosas" VALUES (4, 'navilan', 'ADMINISTRADOR DEL SISTEMA', '127.0.0.1', 1, '2023-05-10 09:34:15', '2023-05-10 09:34:15');
INSERT INTO "auditoria"."autenticaciones_exitosas" VALUES (5, 'navilan', 'ADMINISTRADOR DEL SISTEMA', '127.0.0.1', 1, '2023-05-10 14:49:16', '2023-05-10 14:49:16');

-- ----------------------------
-- Table structure for autenticaciones_fallidas
-- ----------------------------
DROP TABLE IF EXISTS "auditoria"."autenticaciones_fallidas";
CREATE TABLE "auditoria"."autenticaciones_fallidas" (
  "id" int8 NOT NULL DEFAULT nextval('"auditoria".autenticaciones_fallidas_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "direccion_ip" varchar(255) COLLATE "pg_catalog"."default",
  "user_id" int8 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "updated_at" timestamp(6)
)
;
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."id" IS 'Identificador de autenticaciones fallida';
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."name" IS 'Nombre autenticaciones fallida';
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."direccion_ip" IS 'Direccion ip autenticaciones fallida';
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."user_id" IS 'Identificador usuario';
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."created_at" IS 'Creación del registro en la tabla';
COMMENT ON COLUMN "auditoria"."autenticaciones_fallidas"."updated_at" IS 'Actualizacion del registro en la tabla';

-- ----------------------------
-- Records of autenticaciones_fallidas
-- ----------------------------
INSERT INTO "auditoria"."autenticaciones_fallidas" VALUES (1, 'navilan', '127.0.0.1', 0, '2023-05-05 14:39:42', '2023-05-05 14:39:42');
INSERT INTO "auditoria"."autenticaciones_fallidas" VALUES (2, 'navilan', '127.0.0.1', 0, '2023-05-05 14:43:21', '2023-05-05 14:43:21');

-- ----------------------------
-- Table structure for trazas
-- ----------------------------
DROP TABLE IF EXISTS "auditoria"."trazas";
CREATE TABLE "auditoria"."trazas" (
  "id" int8 NOT NULL DEFAULT nextval('"auditoria".trazas_id_seq'::regclass),
  "schema" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "table" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "old_value" varchar COLLATE "pg_catalog"."default",
  "new_value" varchar COLLATE "pg_catalog"."default",
  "operation" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" int8,
  "user" varchar COLLATE "pg_catalog"."default",
  "op_timestamp" timestamp(6) NOT NULL DEFAULT now()
)
;
COMMENT ON COLUMN "auditoria"."trazas"."id" IS 'Identificador del registro de la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."schema" IS 'Esquema sobre el cual se realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."table" IS 'Tabla sobre la cual se realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."old_value" IS 'Valor anterior del registro en la tabla sobre la cual se realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."new_value" IS 'Nuevo valor del registro en la tabla sobre la cual se realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."operation" IS 'Operacion realizada: I=Insert, U=Update, D=Delete';
COMMENT ON COLUMN "auditoria"."trazas"."user_id" IS 'Identificador del usuario que realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."user" IS 'Usuario que realiza la operacion';
COMMENT ON COLUMN "auditoria"."trazas"."op_timestamp" IS 'Fecha y hora de realizacion de la operacion';
COMMENT ON TABLE "auditoria"."trazas" IS 'Registro de operaciones realizadas en el sistema para su auditoria';

-- ----------------------------
-- Records of trazas
-- ----------------------------

-- ----------------------------
-- Function structure for create_audit_estatus_planilla
-- ----------------------------
DROP FUNCTION IF EXISTS "auditoria"."create_audit_estatus_planilla"();
CREATE OR REPLACE FUNCTION "auditoria"."create_audit_estatus_planilla"()
  RETURNS "pg_catalog"."trigger" AS $BODY$

DECLARE



BEGIN

    IF (TG_OP = 'UPDATE' OR TG_OP = 'INSERT') THEN

        INSERT INTO "auditoria"."historico_estatus_planilla" ("planilla_id","user_id","estatus_planilla_id")

            VALUES (NEW.id, NEW.user_id, NEW.estatus_planilla_id);

        RETURN NULL;

    ELSE

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - Other action occurred: %, at %',TG_OP,now();

        RETURN NULL;

    END IF;

EXCEPTION

    WHEN data_exception THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [DATA EXCEPTION] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

    WHEN unique_violation THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [UNIQUE] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

    WHEN others THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [OTHER] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for create_audit_reg
-- ----------------------------
DROP FUNCTION IF EXISTS "auditoria"."create_audit_reg"();
CREATE OR REPLACE FUNCTION "auditoria"."create_audit_reg"()
  RETURNS "pg_catalog"."trigger" AS $BODY$

DECLARE

op char(1);

us integer;

usn character varying;

BEGIN

    IF (TG_OP IN ('UPDATE','INSERT')) THEN

	    IF (NEW.user_id IS NOT NULL) THEN

	        us = NEW.user_id;

            SELECT email INTO usn FROM seguridad.users WHERE id = NEW.user_id;

	    ELSE

	        us = NULL;

            usn = NULL;

        END IF;

    END IF;

    IF (TG_OP = 'UPDATE') THEN

        op = 'U';

        INSERT INTO "auditoria"."trazas" ("schema","table","old_value","new_value","operation","user_id","user")

            VALUES (TG_TABLE_SCHEMA::TEXT, TG_TABLE_NAME::TEXT, row_to_json(OLD)::TEXT, row_to_json(NEW)::TEXT, op, us, usn);

        RETURN NULL;

    ELSEIF (TG_OP = 'INSERT') THEN

        op = 'I';

        INSERT INTO "auditoria"."trazas" ("schema","table","new_value","operation","user_id","user")

            VALUES (TG_TABLE_SCHEMA::TEXT, TG_TABLE_NAME::TEXT, row_to_json(NEW)::TEXT, op, us, usn);

        RETURN NULL;

    ELSEIF (TG_OP = 'DELETE') THEN

        op='D';

        INSERT INTO "auditoria"."trazas" ("schema","table","old_value","operation")

            VALUES (TG_TABLE_SCHEMA::TEXT, TG_TABLE_NAME::TEXT, row_to_json(OLD)::TEXT, op);

        RETURN NULL;

    ELSE

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - Other action occurred: %, at %',TG_OP,now();

        RETURN NULL;

    END IF;

EXCEPTION

    WHEN data_exception THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [DATA EXCEPTION] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

    WHEN unique_violation THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [UNIQUE] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

    WHEN others THEN

        RAISE WARNING '[AUDIT.IF_MODIFIED_FUNC] - UDF ERROR [OTHER] - SQLSTATE: %, SQLERRM: %',SQLSTATE,SQLERRM;

        RETURN NULL;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for create_audit_trigger
-- ----------------------------
DROP FUNCTION IF EXISTS "auditoria"."create_audit_trigger"();
CREATE OR REPLACE FUNCTION "auditoria"."create_audit_trigger"()
  RETURNS "pg_catalog"."void" AS $BODY$

DECLARE

query character varying;

tg_name character varying;

tbl_name character varying;

i information_schema.tables%rowtype;

BEGIN

    FOR i IN (SELECT *

        FROM information_schema.tables

        WHERE table_schema IN ('public','seguridad')

        AND table_type = 'BASE TABLE')

    LOOP

        tg_name = 'tg_'||i.table_schema||'_'||i.table_name||'_audit';

        tbl_name = '"'||i.table_schema||'"."'||i.table_name||'"';

        query = 'DROP TRIGGER IF EXISTS '||tg_name||' ON '||tbl_name||';

        CREATE TRIGGER '||tg_name||' AFTER INSERT OR UPDATE OR DELETE ON '||tbl_name||' FOR EACH ROW EXECUTE PROCEDURE auditoria.create_audit_reg();';

    

        EXECUTE query;

    END LOOP;

END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "auditoria"."autenticaciones_exitosas_id_seq"
OWNED BY "auditoria"."autenticaciones_exitosas"."id";
SELECT setval('"auditoria"."autenticaciones_exitosas_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "auditoria"."autenticaciones_fallidas_id_seq"
OWNED BY "auditoria"."autenticaciones_fallidas"."id";
SELECT setval('"auditoria"."autenticaciones_fallidas_id_seq"', 3, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "auditoria"."trazas_id_seq"
OWNED BY "auditoria"."trazas"."id";
SELECT setval('"auditoria"."trazas_id_seq"', 1, false);

-- ----------------------------
-- Checks structure for table trazas
-- ----------------------------
ALTER TABLE "auditoria"."trazas" ADD CONSTRAINT "chk_operation" CHECK (operation = ANY (ARRAY['I'::bpchar, 'U'::bpchar, 'D'::bpchar]));
