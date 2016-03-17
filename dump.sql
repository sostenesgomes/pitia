--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.4.6
-- Started on 2016-03-17 01:35:49 BRT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE laravelauth;
--
-- TOC entry 2102 (class 1262 OID 16384)
-- Name: laravelauth; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE laravelauth WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE laravelauth OWNER TO postgres;

\connect laravelauth

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 11897)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 24752)
-- Name: api; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE api (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    url text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE api OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 24750)
-- Name: api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_id_seq OWNER TO postgres;

--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 183
-- Name: api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE api_id_seq OWNED BY api.id;


--
-- TOC entry 176 (class 1259 OID 24699)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profile (
    id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE profile OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 24697)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_id_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 175
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profile_id_seq OWNED BY profile.id;


--
-- TOC entry 180 (class 1259 OID 24715)
-- Name: profile_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profile_role (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE profile_role OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 24713)
-- Name: profile_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_role_id_seq OWNER TO postgres;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 179
-- Name: profile_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profile_role_id_seq OWNED BY profile_role.id;


--
-- TOC entry 178 (class 1259 OID 24707)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    key character varying(200) NOT NULL
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 24705)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_id_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 177
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- TOC entry 182 (class 1259 OID 24733)
-- Name: user_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_profile (
    id integer NOT NULL,
    profile_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE user_profile OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 24731)
-- Name: user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_profile_id_seq OWNER TO postgres;

--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_profile_id_seq OWNED BY user_profile.id;


--
-- TOC entry 174 (class 1259 OID 24686)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(60) NOT NULL,
    remember_token character varying(60),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 24684)
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
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 1958 (class 2604 OID 24755)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY api ALTER COLUMN id SET DEFAULT nextval('api_id_seq'::regclass);


--
-- TOC entry 1954 (class 2604 OID 24702)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile ALTER COLUMN id SET DEFAULT nextval('profile_id_seq'::regclass);


--
-- TOC entry 1956 (class 2604 OID 24718)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile_role ALTER COLUMN id SET DEFAULT nextval('profile_role_id_seq'::regclass);


--
-- TOC entry 1955 (class 2604 OID 24710)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- TOC entry 1957 (class 2604 OID 24736)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile ALTER COLUMN id SET DEFAULT nextval('user_profile_id_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 24689)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2097 (class 0 OID 24752)
-- Dependencies: 184
-- Data for Name: api; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO api (id, name, url, created_at, updated_at) VALUES (1, 'GitHub', 'https://api.github.com/users/defunkt', '2016-03-17 01:59:18', '2016-03-17 02:07:32');
INSERT INTO api (id, name, url, created_at, updated_at) VALUES (2, 'Youtube Api', 'https://youtube.com/api/test', '2016-03-17 03:51:30', '2016-03-17 03:51:41');


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 183
-- Name: api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('api_id_seq', 2, true);


--
-- TOC entry 2089 (class 0 OID 24699)
-- Dependencies: 176
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO profile (id, name) VALUES (1, 'Admin');


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 175
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_id_seq', 1, true);


--
-- TOC entry 2093 (class 0 OID 24715)
-- Dependencies: 180
-- Data for Name: profile_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO profile_role (id, profile_id, role_id) VALUES (1, 1, 1);
INSERT INTO profile_role (id, profile_id, role_id) VALUES (2, 1, 3);
INSERT INTO profile_role (id, profile_id, role_id) VALUES (3, 1, 4);
INSERT INTO profile_role (id, profile_id, role_id) VALUES (4, 1, 5);
INSERT INTO profile_role (id, profile_id, role_id) VALUES (5, 1, 6);


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 179
-- Name: profile_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_role_id_seq', 5, true);


--
-- TOC entry 2091 (class 0 OID 24707)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO role (id, name, key) VALUES (1, 'Admin System View', 'admin_system_view');
INSERT INTO role (id, name, key) VALUES (2, 'Admin System Edit', 'admin_system_edit');
INSERT INTO role (id, name, key) VALUES (3, 'Visualizar Home Admin', 'admin_index_view');
INSERT INTO role (id, name, key) VALUES (4, 'Visualizar API Admin', 'admin_api_view');
INSERT INTO role (id, name, key) VALUES (5, 'Editar API Admin', 'admin_api_edit');
INSERT INTO role (id, name, key) VALUES (6, 'Criar API Admin', 'admin_api_create');


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 177
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_id_seq', 6, true);


--
-- TOC entry 2095 (class 0 OID 24733)
-- Dependencies: 182
-- Data for Name: user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_profile (id, profile_id, user_id) VALUES (2, 1, 2);


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 181
-- Name: user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_profile_id_seq', 2, true);


--
-- TOC entry 2087 (class 0 OID 24686)
-- Dependencies: 174
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, name, email, password, remember_token, created_at, updated_at) VALUES (2, 'Sóstenes Gomes', 'sostenes@email.com', '$2y$10$ifGIMzG0zNvN1gJVfQB3Gu2Ut27DQHCZCL2WkhnLIBhJgs4bvSM0a', 'U2fBuVlheWvBZYSxPMoUBben0Fz0EGJMxN5ATlq7NF6fvvTtJ03mZE6wboWN', '2016-03-15 00:09:03', '2016-03-17 03:51:48');


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 173
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- TOC entry 1972 (class 2606 OID 24760)
-- Name: api_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY api
    ADD CONSTRAINT api_pkey PRIMARY KEY (id);


--
-- TOC entry 1964 (class 2606 OID 24704)
-- Name: profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 24720)
-- Name: profile_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profile_role
    ADD CONSTRAINT profile_role_pkey PRIMARY KEY (id);


--
-- TOC entry 1966 (class 2606 OID 24712)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 1970 (class 2606 OID 24738)
-- Name: user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 1960 (class 2606 OID 24696)
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 1962 (class 2606 OID 24694)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1973 (class 2606 OID 24721)
-- Name: profile_role_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile_role
    ADD CONSTRAINT profile_role_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES profile(id);


--
-- TOC entry 1974 (class 2606 OID 24726)
-- Name: profile_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profile_role
    ADD CONSTRAINT profile_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 1975 (class 2606 OID 24739)
-- Name: user_profile_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_profile_id_fkey FOREIGN KEY (profile_id) REFERENCES profile(id);


--
-- TOC entry 1976 (class 2606 OID 24744)
-- Name: user_profile_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_profile
    ADD CONSTRAINT user_profile_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-03-17 01:35:50 BRT

--
-- PostgreSQL database dump complete
--

