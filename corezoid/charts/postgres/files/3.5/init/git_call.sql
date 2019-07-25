DROP TABLE IF EXISTS "js-code-hub" CASCADE;
DROP TABLE IF EXISTS "js-code-hub-build" CASCADE;
DROP TABLE IF EXISTS "js-code-hub-dep-node" CASCADE;

DROP DOMAIN IF EXISTS NODE_ID CASCADE;
DROP TYPE IF EXISTS PACKAGE_STATUS;


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE DOMAIN NODE_ID AS VARCHAR(100) NOT NULL;

CREATE TYPE PACKAGE_STATUS AS ENUM ('new', 'error', 'installed', 'to-remove');

CREATE TABLE "js-code-hub" (
                               id                UUID PRIMARY KEY DEFAULT uuid_generate_v1(),
                               "user-id"         VARCHAR(100) NOT NULL,
                               owner             VARCHAR(200) NOT NULL,
                               name              VARCHAR(200) NOT NULL,
                               "commit-hash"     VARCHAR(200) NOT NULL,
                               device            VARCHAR(200) NOT NULL,
                               "build-command"   VARCHAR(200) NOT NULL,
                               "random-part"     VARCHAR(32) default md5(random()::text),
                               status            PACKAGE_STATUS default 'new'
);

ALTER TABLE "js-code-hub" ADD CONSTRAINT "unique-js-code-hub" UNIQUE (
                                                                      "user-id", owner, name, "commit-hash", "build-command"
    );

CREATE TABLE "js-code-hub-build" (
                                     id                    VARCHAR(500) NOT NULL UNIQUE,
                                     "container-id"        VARCHAR(100) NOT NULL,
                                     "created-at"          TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE "js-code-hub-dep-node" (
                                        "dep-id"   UUID NOT NULL,
                                        "node-id"  NODE_ID
);

ALTER TABLE "js-code-hub-dep-node" ADD CONSTRAINT "unique-js-code-hub-dep-node" UNIQUE ("dep-id", "node-id");








DROP TABLE IF EXISTS "js-script";
CREATE TABLE "js-script" (
                             id               VARCHAR(100) NOT NULL,
                             version          VARCHAR(100) NOT NULL,
                             source           TEXT,
                             dependencies     TEXT
);

ALTER TABLE "js-script" ADD CONSTRAINT "unique-js-script" UNIQUE (id, version);

















--
-- CREATE TYPE public.git_call_lang AS ENUM (
--     'js',
--     'py',
--     'erl',
--     'java'
-- );
--
-- CREATE DOMAIN public.node_id AS character varying(100) NOT NULL;
--
-- CREATE TYPE public.package_status AS ENUM (
--     'new',
--     'error',
--     'installed',
--     'to-remove'
-- );
--
-- SET default_tablespace = '';
--
-- SET default_with_oids = false;
--
-- CREATE TABLE public.compiled_deps (
--     conv_id integer NOT NULL,
--     node_id character varying(24) NOT NULL,
--     dep_id character varying(36) NOT NULL
-- );
--
-- CREATE TABLE public.git_call_src_temp (
--     id integer NOT NULL,
--     conv_id integer NOT NULL,
--     node_id character varying(24) NOT NULL,
--     src text,
--     deps text DEFAULT '{}'::text,
--     lang public.git_call_lang NOT NULL
-- );
--
-- CREATE SEQUENCE public.git_call_src_temp_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
--
-- ALTER SEQUENCE public.git_call_src_temp_id_seq OWNED BY public.git_call_src_temp.id;
--
-- CREATE TABLE public."js-code-hub" (
--     id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
--     owner character varying(200) NOT NULL,
--     name character varying(200) NOT NULL,
--     "commit-hash" character varying(200) NOT NULL,
--     device character varying(200) NOT NULL,
--     "build-command" character varying(200) NOT NULL,
--     "user-id" character varying(100) DEFAULT NULL::character varying,
--     "random-part" character varying(32) DEFAULT md5((random())::text),
--     status public.package_status DEFAULT 'new'::public.package_status
-- );
--
-- CREATE TABLE public."js-code-hub-build" (
--     id character varying(500) NOT NULL,
--     "container-id" character varying(100) NOT NULL,
--     "created-at" timestamp with time zone DEFAULT now() NOT NULL
-- );
--
-- CREATE TABLE public."js-code-hub-dep-node" (
--     "dep-id" uuid NOT NULL,
--     "node-id" public.node_id
-- );
--
-- CREATE TABLE public."js-script" (
--     id character varying(100) NOT NULL,
--     version character varying(100) NOT NULL,
--     source text,
--     dependencies text
-- );
--
-- ALTER TABLE ONLY public.git_call_src_temp ALTER COLUMN id SET DEFAULT nextval('public.git_call_src_temp_id_seq'::regclass);
--
-- ALTER TABLE ONLY public.compiled_deps
--     ADD CONSTRAINT compiled_deps_conv_id_node_id_dep_id_key UNIQUE (conv_id, node_id, dep_id);
--
-- ALTER TABLE ONLY public.git_call_src_temp
--     ADD CONSTRAINT git_call_src_temp_conv_id_node_id_key UNIQUE (conv_id, node_id);
--
-- ALTER TABLE ONLY public.git_call_src_temp
--     ADD CONSTRAINT git_call_src_temp_pkey PRIMARY KEY (id);
--
-- ALTER TABLE ONLY public."js-code-hub-build"
--     ADD CONSTRAINT "js-code-hub-build_id_key" UNIQUE (id);
--
-- ALTER TABLE ONLY public."js-code-hub"
--     ADD CONSTRAINT "js-code-hub_pkey" PRIMARY KEY (id);
--
-- ALTER TABLE ONLY public."js-code-hub"
--     ADD CONSTRAINT "unique-js-code-hub" UNIQUE ("user-id", owner, name, "commit-hash", "build-command");
--
-- ALTER TABLE ONLY public."js-code-hub-dep-node"
--     ADD CONSTRAINT "unique-js-code-hub-dep-node" UNIQUE ("dep-id", "node-id");
--
-- ALTER TABLE ONLY public."js-script"
--     ADD CONSTRAINT "unique-js-script" UNIQUE (id, version);
