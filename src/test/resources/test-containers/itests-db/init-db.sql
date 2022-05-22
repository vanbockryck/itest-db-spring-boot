--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;



--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "itests" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: itests; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE itests WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE itests OWNER TO postgres;

\connect itests

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: itests; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA itests;


ALTER SCHEMA itests OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: itests; Type: TABLE; Schema: itests; Owner: postgres
--

CREATE TABLE itests.itests (
                               id integer NOT NULL,
                               name character varying NOT NULL
);


ALTER TABLE itests.itests OWNER TO postgres;

--
-- Name: itests_id_seq; Type: SEQUENCE; Schema: itests; Owner: postgres
--

CREATE SEQUENCE itests.itests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE itests.itests_id_seq OWNER TO postgres;

--
-- Name: itests_id_seq; Type: SEQUENCE OWNED BY; Schema: itests; Owner: postgres
--

ALTER SEQUENCE itests.itests_id_seq OWNED BY itests.itests.id;


--
-- Name: itests id; Type: DEFAULT; Schema: itests; Owner: postgres
--

ALTER TABLE ONLY itests.itests ALTER COLUMN id SET DEFAULT nextval('itests.itests_id_seq'::regclass);


--
-- Data for Name: itests; Type: TABLE DATA; Schema: itests; Owner: postgres
--

COPY itests.itests (id, name) FROM stdin;
\.


--
-- Name: itests_id_seq; Type: SEQUENCE SET; Schema: itests; Owner: postgres
--

SELECT pg_catalog.setval('itests.itests_id_seq', 1, false);


--
-- Name: itests itests_pk; Type: CONSTRAINT; Schema: itests; Owner: postgres
--

ALTER TABLE ONLY itests.itests
    ADD CONSTRAINT itests_pk PRIMARY KEY (id);


--
-- Name: itests_id_uindex; Type: INDEX; Schema: itests; Owner: postgres
--

CREATE UNIQUE INDEX itests_id_uindex ON itests.itests USING btree (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

-- INSERT INTO itests.itests (id, name) VALUES (1, 'test');
