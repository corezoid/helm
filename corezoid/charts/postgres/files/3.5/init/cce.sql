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


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: cce_src_lang; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cce_src_lang AS ENUM (
    'erl',
    'js',
    'lua'
);


ALTER TYPE public.cce_src_lang OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cce_src; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cce_src (
    conv text NOT NULL,
    node text NOT NULL,
    src text,
    lang public.cce_src_lang
);


ALTER TABLE public.cce_src OWNER TO postgres;

--
-- Name: cce_src_temp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cce_src_temp (
    id integer NOT NULL,
    conv text,
    node text,
    src text,
    lang public.cce_src_lang
);


ALTER TABLE public.cce_src_temp OWNER TO postgres;

--
-- Name: cce_src_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cce_src_temp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cce_src_temp_id_seq OWNER TO postgres;

--
-- Name: cce_src_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cce_src_temp_id_seq OWNED BY public.cce_src_temp.id;


--
-- Name: cce_src_temp id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cce_src_temp ALTER COLUMN id SET DEFAULT nextval('public.cce_src_temp_id_seq'::regclass);


--
-- Name: cce_src_temp cce_src_temp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cce_src_temp
    ADD CONSTRAINT cce_src_temp_pkey PRIMARY KEY (id);


--
-- Name: cce_src my_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cce_src
    ADD CONSTRAINT my_index PRIMARY KEY (conv, node);


--
-- Name: conv_node_cce_src_temp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX conv_node_cce_src_temp ON public.cce_src_temp USING btree (conv, node);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE cce_src; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.cce_src FROM PUBLIC;
REVOKE ALL ON TABLE public.cce_src FROM postgres;
GRANT ALL ON TABLE public.cce_src TO postgres;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cce_src TO appusers;
GRANT SELECT ON TABLE public.cce_src TO viewers;


--
-- Name: TABLE cce_src_temp; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.cce_src_temp FROM PUBLIC;
REVOKE ALL ON TABLE public.cce_src_temp FROM postgres;
GRANT ALL ON TABLE public.cce_src_temp TO postgres;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cce_src_temp TO appusers;
GRANT SELECT ON TABLE public.cce_src_temp TO viewers;


--
-- Name: SEQUENCE cce_src_temp_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE public.cce_src_temp_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE public.cce_src_temp_id_seq FROM postgres;
GRANT ALL ON SEQUENCE public.cce_src_temp_id_seq TO postgres;
GRANT SELECT,UPDATE ON SEQUENCE public.cce_src_temp_id_seq TO appusers;
GRANT SELECT ON SEQUENCE public.cce_src_temp_id_seq TO viewers;


--
-- PostgreSQL database dump complete
--

