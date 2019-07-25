--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;
--
-- TOC entry 697 (class 1247 OID 181007)
-- Name: history_v2_level; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE history_v2_level AS ENUM (
    'OK',
    'ERROR'
);


ALTER TYPE history_v2_level OWNER TO postgres;

--
-- TOC entry 700 (class 1247 OID 181012)
-- Name: history_v2_rows_severity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE history_v2_rows_severity AS ENUM (
    'INFO',
    'WARN',
    'ERROR'
);


ALTER TYPE history_v2_rows_severity OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_callbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE api_callbacks (
    conveyor_id integer NOT NULL,
    hash character(40) NOT NULL,
    data text
);


ALTER TABLE api_callbacks OWNER TO postgres;

--
-- Name: cce_exec_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cce_exec_time (
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    sum_time real NOT NULL,
    sum_count integer NOT NULL,
    ts integer NOT NULL,
    period integer NOT NULL
);


ALTER TABLE cce_exec_time OWNER TO postgres;

--
-- Name: channel_storage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE channel_storage (
    conveyor_id integer NOT NULL,
    channel character varying(100) NOT NULL,
    data text
);


ALTER TABLE channel_storage OWNER TO postgres;

--
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    owner_user_id integer NOT NULL,
    last_editor_user_id integer NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    server_id integer,
    company_id character varying(25) NOT NULL,
    status smallint DEFAULT 1
);


ALTER TABLE companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: conveyor_billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyor_billing (
    conveyor_id integer NOT NULL,
    user_id integer NOT NULL,
    ts integer NOT NULL,
    opers_count integer NOT NULL,
    tacts_count integer NOT NULL,
    tasks_bytes_size bigint NOT NULL,
    period integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE conveyor_billing OWNER TO postgres;

--
-- Name: conveyor_billing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conveyor_billing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conveyor_billing_id_seq OWNER TO postgres;

--
-- Name: conveyor_billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conveyor_billing_id_seq OWNED BY conveyor_billing.id;


--
-- Name: conveyor_called_timers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyor_called_timers (
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    called_count integer NOT NULL,
    ts integer NOT NULL,
    period integer NOT NULL
);


ALTER TABLE conveyor_called_timers OWNER TO postgres;

--
-- Name: conveyor_id_to_conveyor_ref; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyor_id_to_conveyor_ref (
    conveyor_ref character varying(255) NOT NULL,
    env character varying(10) NOT NULL,
    conveyor_id integer NOT NULL
);


ALTER TABLE conveyor_id_to_conveyor_ref OWNER TO postgres;

--
-- Name: conveyor_to_shard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyor_to_shard (
    conveyor_id integer NOT NULL,
    shard character varying(255) NOT NULL
);


ALTER TABLE conveyor_to_shard OWNER TO postgres;

--
-- Name: conveyors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    status smallint DEFAULT 1,
    params text,
    owner_id integer,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    user_id integer,
    esc_conv integer,
    conv_type smallint,
    company_id character varying(25),
    blocked_reason character varying(2000) DEFAULT NULL::character varying,
    project_id integer,
    version integer DEFAULT 1 NOT NULL
);


ALTER TABLE conveyors OWNER TO postgres;

--
-- Name: conveyors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conveyors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conveyors_id_seq OWNER TO postgres;

--
-- Name: conveyors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conveyors_id_seq OWNED BY conveyors.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    owner_id integer NOT NULL,
    data text,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    user_id integer,
    status smallint DEFAULT 1,
    company_id character varying(25),
    charts_order text,
    timerange text,
    grid text,
    project_id integer
);


ALTER TABLE dashboards OWNER TO postgres;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dashboards_id_seq OWNER TO postgres;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: esc_conv_to_convs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE esc_conv_to_convs (
    esc_conv integer NOT NULL,
    conv integer NOT NULL
);


ALTER TABLE esc_conv_to_convs OWNER TO postgres;

--
-- Name: folder_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE folder_content (
    folder_id integer NOT NULL,
    obj_type integer NOT NULL,
    obj_id integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE folder_content OWNER TO postgres;

--
-- Name: folder_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE folder_content_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE folder_content_id_seq OWNER TO postgres;

--
-- Name: folder_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE folder_content_id_seq OWNED BY folder_content.id;


--
-- Name: folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE folders (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    owner_id integer NOT NULL,
    type smallint DEFAULT 0,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    user_id integer,
    status smallint DEFAULT 1,
    company_id character varying(25),
    project_id integer
);


ALTER TABLE folders OWNER TO postgres;

--
-- Name: folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE folders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE folders_id_seq OWNER TO postgres;

--
-- Name: folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE folders_id_seq OWNED BY folders.id;


--
-- Name: group_to_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE group_to_group (
    parent_group_id integer NOT NULL,
    group_id integer NOT NULL,
    conveyor_id integer NOT NULL
);


ALTER TABLE group_to_group OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history (
    obj_id integer NOT NULL,
    obj_type smallint NOT NULL,
    user_id integer NOT NULL,
    change_time integer NOT NULL,
    title text,
    action_type smallint,
    id bigint NOT NULL
);


ALTER TABLE history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_id_seq OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- Name: history_v2; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history_v2 (
    id integer NOT NULL,
    create_time integer NOT NULL,
    level history_v2_level DEFAULT 'OK'::history_v2_level,
    path text,
    vsn integer,
    user_id integer,
    service character varying(50),
    ip character varying(39),
    request text NOT NULL,
    response text NOT NULL
);


ALTER TABLE history_v2 OWNER TO postgres;

--
-- Name: history_v2_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_v2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_v2_id_seq OWNER TO postgres;

--
-- Name: history_v2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE history_v2_id_seq OWNED BY history_v2.id;


--
-- Name: history_v2_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE history_v2_rows (
    id integer NOT NULL,
    history_id integer,
    severity history_v2_rows_severity DEFAULT 'INFO'::history_v2_rows_severity,
    company_id character varying(50) DEFAULT NULL::character varying,
    project_id integer,
    type character varying(50) NOT NULL,
    obj character varying(50) NOT NULL,
    obj_type character varying(50) DEFAULT NULL::character varying,
    obj_id integer,
    obj_to character varying(50) DEFAULT NULL::character varying,
    obj_to_id integer,
    request text NOT NULL,
    response text NOT NULL
);


ALTER TABLE history_v2_rows OWNER TO postgres;

--
-- Name: history_v2_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE history_v2_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE history_v2_rows_id_seq OWNER TO postgres;

--
-- Name: history_v2_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE history_v2_rows_id_seq OWNED BY history_v2_rows.id;


--
-- Name: login_to_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE login_to_users (
    user_id integer NOT NULL,
    login_id integer NOT NULL
);


ALTER TABLE login_to_users OWNER TO postgres;

--
-- Name: logins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE logins (
    id integer NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    login character varying(100) NOT NULL,
    type smallint NOT NULL,
    hash1 character varying(255),
    hash2 character varying(255)
);


ALTER TABLE logins OWNER TO postgres;

--
-- Name: logins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logins_id_seq OWNER TO postgres;

--
-- Name: logins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logins_id_seq OWNED BY logins.id;


--
-- Name: market_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE market_template (
    id integer NOT NULL,
    version character varying(20),
    title character varying(255) NOT NULL,
    description text,
    image character varying(500),
    repository_url character varying(500) NOT NULL,
    name character varying(255) NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    status smallint,
    category_id smallint,
    change_time integer,
    conveyor_params text,
    owner_id integer NOT NULL,
    last_editor_id integer NOT NULL
);


ALTER TABLE market_template OWNER TO postgres;

--
-- Name: market_template_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE market_template_history (
    id integer NOT NULL,
    market_template_id integer NOT NULL,
    description text,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    status smallint,
    last_editor_id integer
);


ALTER TABLE market_template_history OWNER TO postgres;

--
-- Name: market_template_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_template_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE market_template_history_id_seq OWNER TO postgres;

--
-- Name: market_template_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_template_history_id_seq OWNED BY market_template_history.id;


--
-- Name: market_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE market_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE market_template_id_seq OWNER TO postgres;

--
-- Name: market_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE market_template_id_seq OWNED BY market_template.id;


--
-- Name: oauth2_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_access (
    user_id integer NOT NULL,
    client_id integer NOT NULL,
    scope text
);


ALTER TABLE oauth2_access OWNER TO postgres;

--
-- Name: oauth2_client_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_client_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    privs text,
    description text,
    status integer DEFAULT 0
);


ALTER TABLE oauth2_client_groups OWNER TO postgres;

--
-- Name: oauth2_client_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_client_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_client_groups_id_seq OWNER TO postgres;

--
-- Name: oauth2_client_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_client_groups_id_seq OWNED BY oauth2_client_groups.id;


--
-- Name: oauth2_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_clients (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    logo character varying(1024),
    homepage character varying(1024),
    client_id character varying(255) NOT NULL,
    client_secret character varying(255) NOT NULL,
    redirect_uri character varying(1024) NOT NULL,
    notify_url character varying(1024),
    scope text,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL
);


ALTER TABLE oauth2_clients OWNER TO postgres;

--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_clients_id_seq OWNER TO postgres;

--
-- Name: oauth2_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_clients_id_seq OWNED BY oauth2_clients.id;


--
-- Name: oauth2_clients_to_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_clients_to_groups (
    id integer NOT NULL,
    client_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE oauth2_clients_to_groups OWNER TO postgres;

--
-- Name: oauth2_clients_to_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_clients_to_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_clients_to_groups_id_seq OWNER TO postgres;

--
-- Name: oauth2_clients_to_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_clients_to_groups_id_seq OWNED BY oauth2_clients_to_groups.id;


--
-- Name: oauth2_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_history (
    id integer NOT NULL,
    client_id integer NOT NULL,
    event_type character varying(255) NOT NULL,
    data text,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL
);


ALTER TABLE oauth2_history OWNER TO postgres;

--
-- Name: oauth2_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_history_id_seq OWNER TO postgres;

--
-- Name: oauth2_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2_history_id_seq OWNED BY oauth2_history.id;


--
-- Name: oauth2_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE oauth2_tokens (
    refresh_token character varying(255) NOT NULL,
    access_token character varying(255) NOT NULL,
    refresh_token_create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    access_token_create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    user_id integer NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE oauth2_tokens OWNER TO postgres;

--
-- Name: payment_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment_history (
    id integer NOT NULL,
    order_id character(24),
    user_id integer,
    "time" integer DEFAULT (date_part('epoch'::text, now()))::integer,
    status smallint,
    card character(4),
    amount smallint,
    plan_id smallint
);


ALTER TABLE payment_history OWNER TO postgres;

--
-- Name: payment_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_history_id_seq OWNER TO postgres;

--
-- Name: payment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_history_id_seq OWNED BY payment_history.id;


--
-- Name: payment_plans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payment_plans (
    id integer NOT NULL,
    title character(24),
    stripe_plan_id character(24),
    amount integer,
    tps integer,
    tacts bigint,
    currency character(3),
    "interval" character(10)
);


ALTER TABLE payment_plans OWNER TO postgres;

--
-- Name: payment_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_plans_id_seq OWNER TO postgres;

--
-- Name: payment_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE payment_plans_id_seq OWNED BY payment_plans.id;


--
-- Name: payments_history_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payments_history_id_pk_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payments_history_id_pk_seq OWNER TO postgres;

--
-- Name: payments_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payments_history (
    order_id character varying(255) NOT NULL,
    payplan_id integer NOT NULL,
    paytype smallint DEFAULT 0,
    date_start character varying(255) DEFAULT date_part('epoch'::text, now()),
    amount integer NOT NULL,
    tacts integer NOT NULL,
    user_id integer NOT NULL,
    "timestamp" integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    state smallint DEFAULT 1,
    payment_id character varying(255),
    id_pk integer DEFAULT nextval('payments_history_id_pk_seq'::regclass) NOT NULL
);


ALTER TABLE payments_history OWNER TO postgres;

--
-- Name: project_envs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE project_envs (
    id integer NOT NULL,
    project_id integer NOT NULL,
    type smallint DEFAULT 1,
    status smallint DEFAULT 1,
    folder_id integer,
    vsn_major smallint DEFAULT 0,
    vsn_minor smallint DEFAULT 0,
    vsn_patch smallint DEFAULT 0,
    active boolean DEFAULT false
);


ALTER TABLE project_envs OWNER TO postgres;

--
-- Name: project_envs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_envs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE project_envs_id_seq OWNER TO postgres;

--
-- Name: project_envs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE project_envs_id_seq OWNED BY project_envs.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(1024),
    create_time integer NOT NULL,
    change_time integer NOT NULL,
    owner_id integer NOT NULL,
    user_id integer NOT NULL,
    status smallint NOT NULL,
    company_id character varying(25) NOT NULL
);


ALTER TABLE projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    order_id character(24),
    plan_id integer,
    user_id integer,
    status smallint,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    cancel_time integer,
    customer_id text,
    subscription_id text
);


ALTER TABLE subscriptions OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subscriptions_id_seq OWNER TO postgres;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: user_billing_stats_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_billing_stats_id_pk_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_billing_stats_id_pk_seq OWNER TO postgres;

--
-- Name: user_billing_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_billing_stats (
    user_id integer NOT NULL,
    conveyor_id integer NOT NULL,
    conveyor_tacts bigint,
    "timestamp" integer,
    "interval" integer,
    operations bigint DEFAULT 0,
    id_pk integer DEFAULT nextval('user_billing_stats_id_pk_seq'::regclass) NOT NULL
);


ALTER TABLE user_billing_stats OWNER TO postgres;

--
-- Name: user_billing_tacts_id_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_billing_tacts_id_pk_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_billing_tacts_id_pk_seq OWNER TO postgres;

--
-- Name: user_billing_tacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_billing_tacts (
    user_id integer NOT NULL,
    tacts bigint NOT NULL,
    "timestamp" integer NOT NULL,
    "interval" integer NOT NULL,
    operations bigint DEFAULT 0,
    id_pk integer DEFAULT nextval('user_billing_tacts_id_pk_seq'::regclass) NOT NULL
);


ALTER TABLE user_billing_tacts OWNER TO postgres;

--
-- Name: user_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_dashboards (
    dashboard_id integer NOT NULL,
    group_id integer NOT NULL,
    level integer NOT NULL,
    privs text
);


ALTER TABLE user_dashboards OWNER TO postgres;

--
-- Name: user_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_folders (
    folder_id integer NOT NULL,
    group_id integer NOT NULL,
    level integer NOT NULL,
    privs text
);


ALTER TABLE user_folders OWNER TO postgres;

--
-- Name: user_group_privilegies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_group_privilegies (
    id integer NOT NULL,
    group_id integer NOT NULL,
    conveyor_id integer NOT NULL,
    node_id character(24),
    prioritet smallint,
    privs text
);


ALTER TABLE user_group_privilegies OWNER TO postgres;

--
-- Name: user_group_privilegies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_group_privilegies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_group_privilegies_id_seq OWNER TO postgres;

--
-- Name: user_group_privilegies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_group_privilegies_id_seq OWNED BY user_group_privilegies.id;


--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    status smallint DEFAULT 1,
    company_id character varying(25),
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    owner_user_id integer
);


ALTER TABLE user_groups OWNER TO postgres;

--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_groups_id_seq OWNER TO postgres;

--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_groups_id_seq OWNED BY user_groups.id;


--
-- Name: user_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_projects (
    project_id integer NOT NULL,
    group_id integer NOT NULL,
    privs text
);


ALTER TABLE user_projects OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    last_editor_user_id integer NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer
);


ALTER TABLE user_roles OWNER TO postgres;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_id_seq OWNER TO postgres;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- Name: user_to_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_to_companies (
    id integer NOT NULL,
    company_id character varying(25) NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE user_to_companies OWNER TO postgres;

--
-- Name: user_to_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_to_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_to_companies_id_seq OWNER TO postgres;

--
-- Name: user_to_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_to_companies_id_seq OWNED BY user_to_companies.id;


--
-- Name: user_to_payment_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_to_payment_plan (
    id integer NOT NULL,
    user_id integer,
    status smallint,
    card character(4),
    expire_date integer,
    plan_id integer
);


ALTER TABLE user_to_payment_plan OWNER TO postgres;

--
-- Name: user_to_payment_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_to_payment_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_to_payment_plan_id_seq OWNER TO postgres;

--
-- Name: user_to_payment_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_to_payment_plan_id_seq OWNED BY user_to_payment_plan.id;


--
-- Name: user_to_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_to_user_groups (
    user_group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE user_to_user_groups OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    status boolean DEFAULT true NOT NULL,
    data text,
    last_entrance integer DEFAULT (date_part('epoch'::text, now()))::integer,
    lang character varying(2)
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: web_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE web_settings (
    key character(50) NOT NULL,
    value text
);


ALTER TABLE web_settings OWNER TO postgres;

--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: conveyor_billing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_billing ALTER COLUMN id SET DEFAULT nextval('conveyor_billing_id_seq'::regclass);


--
-- Name: conveyors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyors ALTER COLUMN id SET DEFAULT nextval('conveyors_id_seq'::regclass);


--
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: folder_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folder_content ALTER COLUMN id SET DEFAULT nextval('folder_content_id_seq'::regclass);


--
-- Name: folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folders ALTER COLUMN id SET DEFAULT nextval('folders_id_seq'::regclass);


--
-- Name: history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- Name: history_v2 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_v2 ALTER COLUMN id SET DEFAULT nextval('history_v2_id_seq'::regclass);


--
-- Name: history_v2_rows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_v2_rows ALTER COLUMN id SET DEFAULT nextval('history_v2_rows_id_seq'::regclass);


--
-- Name: logins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logins ALTER COLUMN id SET DEFAULT nextval('logins_id_seq'::regclass);


--
-- Name: market_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_template ALTER COLUMN id SET DEFAULT nextval('market_template_id_seq'::regclass);


--
-- Name: market_template_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_template_history ALTER COLUMN id SET DEFAULT nextval('market_template_history_id_seq'::regclass);


--
-- Name: oauth2_client_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_client_groups ALTER COLUMN id SET DEFAULT nextval('oauth2_client_groups_id_seq'::regclass);


--
-- Name: oauth2_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients ALTER COLUMN id SET DEFAULT nextval('oauth2_clients_id_seq'::regclass);


--
-- Name: oauth2_clients_to_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients_to_groups ALTER COLUMN id SET DEFAULT nextval('oauth2_clients_to_groups_id_seq'::regclass);


--
-- Name: oauth2_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_history ALTER COLUMN id SET DEFAULT nextval('oauth2_history_id_seq'::regclass);


--
-- Name: payment_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_history ALTER COLUMN id SET DEFAULT nextval('payment_history_id_seq'::regclass);


--
-- Name: payment_plans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_plans ALTER COLUMN id SET DEFAULT nextval('payment_plans_id_seq'::regclass);


--
-- Name: project_envs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project_envs ALTER COLUMN id SET DEFAULT nextval('project_envs_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: user_group_privilegies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group_privilegies ALTER COLUMN id SET DEFAULT nextval('user_group_privilegies_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_groups ALTER COLUMN id SET DEFAULT nextval('user_groups_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles ALTER COLUMN id SET DEFAULT nextval('user_roles_id_seq'::regclass);


--
-- Name: user_to_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_to_companies ALTER COLUMN id SET DEFAULT nextval('user_to_companies_id_seq'::regclass);


--
-- Name: user_to_payment_plan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_to_payment_plan ALTER COLUMN id SET DEFAULT nextval('user_to_payment_plan_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: api_callbacks api_callbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api_callbacks
    ADD CONSTRAINT api_callbacks_pkey PRIMARY KEY (conveyor_id);


--
-- Name: channel_storage channel_storage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY channel_storage
    ADD CONSTRAINT channel_storage_pkey PRIMARY KEY (conveyor_id, channel);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: conveyor_id_to_conveyor_ref conveyor_id_to_conveyor_ref_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_id_to_conveyor_ref
    ADD CONSTRAINT conveyor_id_to_conveyor_ref_pkey PRIMARY KEY (conveyor_ref, env);


--
-- Name: conveyor_to_shard conveyor_to_shard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_to_shard
    ADD CONSTRAINT conveyor_to_shard_pkey PRIMARY KEY (conveyor_id);


--
-- Name: conveyors conveyors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyors
    ADD CONSTRAINT conveyors_pkey PRIMARY KEY (id);


--
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: esc_conv_to_convs esc_conv_to_convs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY esc_conv_to_convs
    ADD CONSTRAINT esc_conv_to_convs_pkey PRIMARY KEY (esc_conv, conv);


--
-- Name: folder_content folder_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folder_content
    ADD CONSTRAINT folder_content_pkey PRIMARY KEY (id);


--
-- Name: folders folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: group_to_group group_to_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_to_group
    ADD CONSTRAINT group_to_group_pkey PRIMARY KEY (parent_group_id, group_id, conveyor_id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: history_v2 history_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_v2
    ADD CONSTRAINT history_v2_pkey PRIMARY KEY (id);


--
-- Name: history_v2_rows history_v2_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY history_v2_rows
    ADD CONSTRAINT history_v2_rows_pkey PRIMARY KEY (id);


--
-- Name: login_to_users login_to_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login_to_users
    ADD CONSTRAINT login_to_users_pkey PRIMARY KEY (user_id, login_id);


--
-- Name: logins logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logins
    ADD CONSTRAINT logins_pkey PRIMARY KEY (id);


--
-- Name: market_template_history market_template_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_template_history
    ADD CONSTRAINT market_template_history_pkey PRIMARY KEY (id);


--
-- Name: market_template market_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY market_template
    ADD CONSTRAINT market_template_pkey PRIMARY KEY (id);


--
-- Name: oauth2_access oauth2_access_user_id_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_access
    ADD CONSTRAINT oauth2_access_user_id_client_id_key UNIQUE (user_id, client_id);


--
-- Name: oauth2_client_groups oauth2_client_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_client_groups
    ADD CONSTRAINT oauth2_client_groups_pkey PRIMARY KEY (id);


--
-- Name: oauth2_clients oauth2_clients_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients
    ADD CONSTRAINT oauth2_clients_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_clients oauth2_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients
    ADD CONSTRAINT oauth2_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth2_clients_to_groups oauth2_clients_to_groups_client_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients_to_groups
    ADD CONSTRAINT oauth2_clients_to_groups_client_id_group_id_key UNIQUE (client_id, group_id);


--
-- Name: oauth2_clients_to_groups oauth2_clients_to_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_clients_to_groups
    ADD CONSTRAINT oauth2_clients_to_groups_pkey PRIMARY KEY (id);


--
-- Name: oauth2_history oauth2_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_history
    ADD CONSTRAINT oauth2_history_pkey PRIMARY KEY (id);


--
-- Name: oauth2_tokens oauth2_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_pkey PRIMARY KEY (refresh_token);


--
-- Name: oauth2_tokens oauth2_tokens_user_id_client_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2_tokens
    ADD CONSTRAINT oauth2_tokens_user_id_client_id_key UNIQUE (user_id, client_id);


--
-- Name: payment_history payment_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_history
    ADD CONSTRAINT payment_history_pkey PRIMARY KEY (id);


--
-- Name: payment_plans payment_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payment_plans
    ADD CONSTRAINT payment_plans_pkey PRIMARY KEY (id);


--
-- Name: cce_exec_time pk_cce_exec_time; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cce_exec_time
    ADD CONSTRAINT pk_cce_exec_time PRIMARY KEY (conveyor_id, node_id, ts);


--
-- Name: conveyor_billing pk_conveyor_billing; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_billing
    ADD CONSTRAINT pk_conveyor_billing PRIMARY KEY (conveyor_id, user_id, ts);


--
-- Name: conveyor_called_timers pk_conveyor_called_timers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_called_timers
    ADD CONSTRAINT pk_conveyor_called_timers PRIMARY KEY (conveyor_id, node_id, ts);


--
-- Name: payments_history pk_payments_history; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_history
    ADD CONSTRAINT pk_payments_history PRIMARY KEY (id_pk);


--
-- Name: user_billing_stats pk_user_billing_stats; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_billing_stats
    ADD CONSTRAINT pk_user_billing_stats PRIMARY KEY (id_pk);


--
-- Name: user_billing_tacts pk_user_billing_tacts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_billing_tacts
    ADD CONSTRAINT pk_user_billing_tacts PRIMARY KEY (id_pk);


--
-- Name: project_envs projects_envs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project_envs
    ADD CONSTRAINT projects_envs_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: user_dashboards user_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_dashboards
    ADD CONSTRAINT user_dashboards_pkey PRIMARY KEY (group_id, dashboard_id, level);


--
-- Name: user_folders user_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_folders
    ADD CONSTRAINT user_folders_pkey PRIMARY KEY (group_id, folder_id, level);


--
-- Name: user_group_privilegies user_group_privilegies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group_privilegies
    ADD CONSTRAINT user_group_privilegies_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_projects user_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_projects
    ADD CONSTRAINT user_projects_pkey PRIMARY KEY (project_id, group_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user_to_companies user_to_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_to_companies
    ADD CONSTRAINT user_to_companies_pkey PRIMARY KEY (company_id, user_id);


--
-- Name: user_to_payment_plan user_to_payment_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_to_payment_plan
    ADD CONSTRAINT user_to_payment_plan_pkey PRIMARY KEY (id);


--
-- Name: user_to_user_groups user_to_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_to_user_groups
    ADD CONSTRAINT user_to_user_groups_pkey PRIMARY KEY (user_group_id, user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: web_settings web_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY web_settings
    ADD CONSTRAINT web_settings_pkey PRIMARY KEY (key);


--
-- Name: api_callbacks_hash_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX api_callbacks_hash_id ON api_callbacks USING btree (hash);


--
-- Name: companies_company_id_owner_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX companies_company_id_owner_user_id ON companies USING btree (id, owner_user_id);


--
-- Name: conveyor_called_timers_conv_id_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conveyor_called_timers_conv_id_ts ON conveyor_called_timers USING btree (conveyor_id, ts);


--
-- Name: conveyor_called_timers_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conveyor_called_timers_ts ON conveyor_called_timers USING btree (ts);


--
-- Name: conveyor_to_shard_conveyor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX conveyor_to_shard_conveyor_id ON conveyor_to_shard USING btree (conveyor_id, shard);


--
-- Name: conveyors_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conveyors_name ON conveyors USING btree (lower((name)::text) varchar_pattern_ops);


--
-- Name: conveyors_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conveyors_status ON conveyors USING btree (status);


--
-- Name: folder_content_folder_id_obj_type_obj_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX folder_content_folder_id_obj_type_obj_id ON folder_content USING btree (folder_id, obj_type, obj_id);


--
-- Name: folder_content_obj_id_obj_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folder_content_obj_id_obj_type ON folder_content USING btree (obj_type, obj_id);


--
-- Name: folder_content_obj_type_obj_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folder_content_obj_type_obj_id ON folder_content USING btree (obj_type, obj_id);


--
-- Name: folders_owner_id_type_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folders_owner_id_type_status ON folders USING btree (owner_id, type, status);


--
-- Name: folders_status_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX folders_status_type ON folders USING btree (status, type);


--
-- Name: history_obj_id_obj_type_change_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX history_obj_id_obj_type_change_time ON history USING btree (obj_id, obj_type, change_time);


--
-- Name: ix_conveyor_billing_conveyor_id_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_conveyor_billing_conveyor_id_ts ON conveyor_billing USING btree (conveyor_id, ts);


--
-- Name: ix_conveyor_billing_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_conveyor_billing_id ON conveyor_billing USING btree (id);


--
-- Name: ix_conveyor_billing_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_conveyor_billing_ts ON conveyor_billing USING btree (ts);


--
-- Name: ix_conveyor_billing_user_id_ts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_conveyor_billing_user_id_ts ON conveyor_billing USING btree (user_id, ts);


--
-- Name: logins_login_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX logins_login_type ON logins USING btree (login, type);


--
-- Name: obj_id_obj_type_history_v2_rows; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX obj_id_obj_type_history_v2_rows ON history_v2_rows USING btree (obj_id, obj_type);


--
-- Name: obj_to_obj_to_id_history_v2_rows; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX obj_to_obj_to_id_history_v2_rows ON history_v2_rows USING btree (obj_to, obj_to_id);


--
-- Name: owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX owner_id ON conveyors USING btree (owner_id);


--
-- Name: payment_history_order_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payment_history_order_by_user ON payments_history USING btree (user_id, order_id);


--
-- Name: payment_history_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payment_history_order_id ON payments_history USING btree (order_id);


--
-- Name: payment_history_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payment_history_user_id ON user_to_payment_plan USING btree (user_id);


--
-- Name: subscriptions_user_id_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_user_id_plan_id ON user_to_payment_plan USING btree (user_id, plan_id);


--
-- Name: user_billing_stats_user_to_conv_on_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_billing_stats_user_to_conv_on_timestamp ON user_billing_stats USING btree (user_id, conveyor_id, "timestamp");


--
-- Name: user_billing_tacts_user_to_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_billing_tacts_user_to_timestamp ON user_billing_stats USING btree (user_id, "timestamp");


--
-- Name: user_folders_folder_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_folders_folder_id ON user_folders USING btree (folder_id);


--
-- Name: user_group_privilegies_conveyor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_group_privilegies_conveyor_id ON user_group_privilegies USING btree (conveyor_id);


--
-- Name: user_group_privilegies_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_group_privilegies_group_id ON user_group_privilegies USING btree (group_id);


--
-- Name: user_group_privilegies_group_id_conveyor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_group_privilegies_group_id_conveyor_id ON user_group_privilegies USING btree (group_id, conveyor_id);


--
-- Name: user_group_privilegies_group_id_conveyor_id_node_id_prioritet; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_group_privilegies_group_id_conveyor_id_node_id_prioritet ON user_group_privilegies USING btree (group_id, conveyor_id, node_id, prioritet) WHERE (node_id IS NOT NULL);


--
-- Name: user_groups_owner_user_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_groups_owner_user_id_idx ON user_groups USING btree (owner_user_id);


--
-- Name: user_to_payment_plan_user_id_plan_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_to_payment_plan_user_id_plan_id ON user_to_payment_plan USING btree (user_id, plan_id);


--
-- Name: user_to_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_to_user_groups_user_id ON user_to_user_groups USING btree (user_id);
