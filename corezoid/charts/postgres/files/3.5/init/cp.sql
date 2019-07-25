--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.6.3

-- Started on 2018-01-19 07:42:32 EET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 19601)
-- Name: charts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE charts (
    id character(24) NOT NULL,
    dashboard_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    settings text,
    series text,
    chart_type character varying(40) DEFAULT NULL::character varying
);


ALTER TABLE charts OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 19607)
-- Name: conveyor_params_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE conveyor_params_access (
    id bigint NOT NULL,
    from_conveyor_id integer NOT NULL,
    user_id integer NOT NULL,
    to_conveyor_id integer NOT NULL,
    ts integer NOT NULL,
    count integer NOT NULL,
    period integer NOT NULL
);


ALTER TABLE conveyor_params_access OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 19610)
-- Name: conveyor_params_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conveyor_params_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conveyor_params_access_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 190
-- Name: conveyor_params_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conveyor_params_access_id_seq OWNED BY conveyor_params_access.id;


--
-- TOC entry 232 (class 1259 OID 1105453584)
-- Name: node_commits_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE node_commits_history (
    id bigint NOT NULL,
    user_id integer,
    conveyor_id integer,
    node_id character(24),
    version integer,
    name character varying(255),
    condition text,
    description text,
    x integer,
    y integer,
    extra text,
    status integer,
    type smallint,
    create_time integer
);


ALTER TABLE node_commits_history OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 1105453582)
-- Name: node_commits_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE node_commits_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE node_commits_history_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 231
-- Name: node_commits_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE node_commits_history_id_seq OWNED BY node_commits_history.id;


--
-- TOC entry 191 (class 1259 OID 19612)
-- Name: nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nodes (
    id character(24) NOT NULL,
    conveyor_id integer NOT NULL,
    type smallint DEFAULT 1 NOT NULL,
    condition text,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    max_count integer DEFAULT 0 NOT NULL,
    max_time integer DEFAULT 0 NOT NULL,
    status smallint NOT NULL,
    x integer,
    y integer,
    extra text,
    version integer,
    condition_temp text,
    last_editor integer,
    last_change_time integer,
    name_temp character varying(255),
    description_temp text,
    extra_temp text,
    type_temp smallint DEFAULT 1 NOT NULL,
    x_temp integer,
    y_temp integer,
    status_temp smallint DEFAULT 1 NOT NULL
);


ALTER TABLE nodes OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 19626)
-- Name: nodes_transits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE nodes_transits (
    id integer NOT NULL,
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    to_conveyor_id integer NOT NULL,
    to_node_id character(24) NOT NULL,
    prioritet smallint,
    convert text,
    description character varying(255)
);


ALTER TABLE nodes_transits OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 19632)
-- Name: nodes_transits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nodes_transits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nodes_transits_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 193
-- Name: nodes_transits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nodes_transits_id_seq OWNED BY nodes_transits.id;


--
-- TOC entry 194 (class 1259 OID 19634)
-- Name: register_stream_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE register_stream_counters (
    id bigint NOT NULL,
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    ts integer NOT NULL,
    key character varying(100) NOT NULL,
    value numeric(50,5) NOT NULL,
    period integer NOT NULL
);


ALTER TABLE register_stream_counters OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 19637)
-- Name: register_stream_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE register_stream_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE register_stream_counters_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 195
-- Name: register_stream_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE register_stream_counters_id_seq OWNED BY register_stream_counters.id;


--
-- TOC entry 196 (class 1259 OID 19639)
-- Name: stream_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE stream_counters (
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    ts integer NOT NULL,
    in_count integer NOT NULL,
    out_count integer NOT NULL,
    period integer NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE stream_counters OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 19642)
-- Name: stream_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stream_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stream_counters_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 197
-- Name: stream_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stream_counters_id_seq OWNED BY stream_counters.id;


--
-- TOC entry 198 (class 1259 OID 19644)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasks (
    id character(24) NOT NULL,
    reference character varying(255),
    conveyor_id integer NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    user_id integer NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    node_id character(24) NOT NULL,
    node_prev_id character(24),
    data text,
    dynamic_timer integer DEFAULT 0 NOT NULL
);


ALTER TABLE tasks OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 19654)
-- Name: tasks_archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasks_archive (
    id bigint NOT NULL,
    reference character varying(255),
    conveyor_id integer NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    user_id integer NOT NULL,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    change_time integer DEFAULT (date_part('epoch'::text, now()))::integer,
    node_id character(24) NOT NULL,
    node_prev_id character(24),
    data text,
    task_id character(24)
);


ALTER TABLE tasks_archive OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 19663)
-- Name: tasks_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_archive_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 200
-- Name: tasks_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_archive_id_seq OWNED BY tasks_archive.id;


--
-- TOC entry 201 (class 1259 OID 19671)
-- Name: tasks_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tasks_history (
    id bigint NOT NULL,
    task_id character(24) NOT NULL,
    reference character varying(255),
    conveyor_id integer NOT NULL,
    conveyor_prev_id integer,
    node_id character(24) NOT NULL,
    user_id integer,
    create_time integer DEFAULT (date_part('epoch'::text, now()))::integer NOT NULL,
    node_prev_id character(24),
    status integer DEFAULT 1 NOT NULL,
    data text,
    prev_id integer DEFAULT 0
);


ALTER TABLE tasks_history OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 19680)
-- Name: tasks_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tasks_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_history_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 202
-- Name: tasks_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tasks_history_id_seq OWNED BY tasks_history.id;


--
-- TOC entry 203 (class 1259 OID 19682)
-- Name: user_group_privilegies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_group_privilegies (
    id integer NOT NULL,
    group_id integer NOT NULL,
    conveyor_id integer NOT NULL,
    node_id character(24) NOT NULL,
    type smallint NOT NULL,
    prioritet smallint
);


ALTER TABLE user_group_privilegies OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 19685)
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
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 204
-- Name: user_group_privilegies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_group_privilegies_id_seq OWNED BY user_group_privilegies.id;


--
-- TOC entry 3229 (class 2604 OID 19687)
-- Name: conveyor_params_access id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_params_access ALTER COLUMN id SET DEFAULT nextval('conveyor_params_access_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 1105453587)
-- Name: node_commits_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY node_commits_history ALTER COLUMN id SET DEFAULT nextval('node_commits_history_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 19688)
-- Name: nodes_transits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes_transits ALTER COLUMN id SET DEFAULT nextval('nodes_transits_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 19689)
-- Name: register_stream_counters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY register_stream_counters ALTER COLUMN id SET DEFAULT nextval('register_stream_counters_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 19690)
-- Name: stream_counters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stream_counters ALTER COLUMN id SET DEFAULT nextval('stream_counters_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 1848776749)
-- Name: tasks_archive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks_archive ALTER COLUMN id SET DEFAULT nextval('tasks_archive_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 19692)
-- Name: tasks_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks_history ALTER COLUMN id SET DEFAULT nextval('tasks_history_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 19693)
-- Name: user_group_privilegies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group_privilegies ALTER COLUMN id SET DEFAULT nextval('user_group_privilegies_id_seq'::regclass);


--
-- TOC entry 3256 (class 2606 OID 23192)
-- Name: charts charts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY charts
    ADD CONSTRAINT charts_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 1105453593)
-- Name: node_commits_history node_commits_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY node_commits_history
    ADD CONSTRAINT node_commits_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 23205)
-- Name: nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 23212)
-- Name: nodes_transits nodes_transits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nodes_transits
    ADD CONSTRAINT nodes_transits_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 3205666)
-- Name: conveyor_params_access pk_conveyor_params_access; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conveyor_params_access
    ADD CONSTRAINT pk_conveyor_params_access PRIMARY KEY (from_conveyor_id, to_conveyor_id, ts, user_id);


--
-- TOC entry 3269 (class 2606 OID 3200976)
-- Name: register_stream_counters pk_register_stream_counters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY register_stream_counters
    ADD CONSTRAINT pk_register_stream_counters PRIMARY KEY (conveyor_id, node_id, ts, key);


--
-- TOC entry 3272 (class 2606 OID 3197552)
-- Name: stream_counters pk_stream_counters; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stream_counters
    ADD CONSTRAINT pk_stream_counters PRIMARY KEY (conveyor_id, node_id, ts);


--
-- TOC entry 3284 (class 2606 OID 1848776751)
-- Name: tasks_archive tasks_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks_archive
    ADD CONSTRAINT tasks_archive_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 29351)
-- Name: tasks_history tasks_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks_history
    ADD CONSTRAINT tasks_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 28315)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 29368)
-- Name: user_group_privilegies user_group_privilegies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group_privilegies
    ADD CONSTRAINT user_group_privilegies_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 1259 OID 23193)
-- Name: charts_dashboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX charts_dashboard_id ON charts USING btree (dashboard_id);


--
-- TOC entry 3254 (class 1259 OID 23194)
-- Name: charts_id_dashboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX charts_id_dashboard_id ON charts USING btree (id, dashboard_id);


--
-- TOC entry 3292 (class 1259 OID 1105453594)
-- Name: conv_id_version_create_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX conv_id_version_create_time ON node_commits_history USING btree (conveyor_id, version, create_time);


--
-- TOC entry 3257 (class 1259 OID 3206376)
-- Name: ix_conveyor_params_access_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_conveyor_params_access_id ON conveyor_params_access USING btree (id);


--
-- TOC entry 3267 (class 1259 OID 3206602)
-- Name: ix_register_stream_counters_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_register_stream_counters_id ON register_stream_counters USING btree (id);


--
-- TOC entry 3270 (class 1259 OID 3206513)
-- Name: ix_stream_counters_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_stream_counters_id ON stream_counters USING btree (id);


--
-- TOC entry 3260 (class 1259 OID 23206)
-- Name: nodes_conveyor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nodes_conveyor_id ON nodes USING btree (conveyor_id);


--
-- TOC entry 3261 (class 1259 OID 23207)
-- Name: nodes_conveyor_id_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nodes_conveyor_id_type ON nodes USING btree (conveyor_id, type);


--
-- TOC entry 3264 (class 1259 OID 23213)
-- Name: nodes_transits_conveyor_id_to_conveyor_id_node_id_to_node_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX nodes_transits_conveyor_id_to_conveyor_id_node_id_to_node_id ON nodes_transits USING btree (conveyor_id, to_conveyor_id, node_id, to_node_id);


--
-- TOC entry 3279 (class 1259 OID 29246)
-- Name: tasks_archive_change_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_archive_change_time ON tasks_archive USING btree (change_time);


--
-- TOC entry 3280 (class 1259 OID 29247)
-- Name: tasks_archive_conveyor_id_node_id_change_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_archive_conveyor_id_node_id_change_time ON tasks_archive USING btree (conveyor_id, node_id, change_time) WHERE (node_id IS NOT NULL);


--
-- TOC entry 3281 (class 1259 OID 29248)
-- Name: tasks_archive_conveyor_id_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_archive_conveyor_id_reference ON tasks_archive USING btree (conveyor_id, reference) WHERE (reference IS NOT NULL);


--
-- TOC entry 3282 (class 1259 OID 29249)
-- Name: tasks_archive_conveyor_id_task_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_archive_conveyor_id_task_id ON tasks_archive USING btree (conveyor_id, task_id) WHERE (task_id IS NOT NULL);


--
-- TOC entry 3273 (class 1259 OID 28316)
-- Name: tasks_conveyor_id_node_id_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_conveyor_id_node_id_status ON tasks USING btree (conveyor_id, node_id, status);


--
-- TOC entry 3274 (class 1259 OID 28317)
-- Name: tasks_conveyor_id_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tasks_conveyor_id_reference ON tasks USING btree (conveyor_id, reference) WHERE (reference IS NOT NULL);


--
-- TOC entry 3285 (class 1259 OID 29352)
-- Name: tasks_history_conveyor_id_create_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_history_conveyor_id_create_time ON tasks_history USING btree (conveyor_id, create_time);


--
-- TOC entry 3286 (class 1259 OID 29353)
-- Name: tasks_history_conveyor_id_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_history_conveyor_id_reference ON tasks_history USING btree (conveyor_id, reference);


--
-- TOC entry 3287 (class 1259 OID 29354)
-- Name: tasks_history_conveyor_id_task_id_create_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_history_conveyor_id_task_id_create_time ON tasks_history USING btree (conveyor_id, task_id, create_time);


--
-- TOC entry 3275 (class 1259 OID 28318)
-- Name: tasks_node_id_change_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_node_id_change_time ON tasks USING btree (node_id, change_time);


--
-- TOC entry 3276 (class 1259 OID 28319)
-- Name: tasks_node_id_dynamic_timer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_node_id_dynamic_timer ON tasks USING btree (node_id, dynamic_timer);


-- Completed on 2018-01-19 07:42:48 EET

--
-- PostgreSQL database dump complete
--

