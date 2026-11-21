--
-- PostgreSQL database dump
--

\restrict ugLFE0EKT0S2Wepjt0bAHXXSX9kLGb7romfX6HGjXQZJ7CbwrtHOKz0r1P2ywX5

-- Dumped from database version 18.7 (84da7d8)
-- Dumped by pg_dump version 18.7 (Debian 18.7-1.pgdg13+5)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: marca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nome character varying(70) NOT NULL
);


--
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marca_id_marca_seq OWNED BY public.marca.id_marca;


--
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.marca (id_marca, nome) FROM stdin;
1	Rockstar Games
2	Microsoft
3	Sony
4	Team Cherry
5	CD Projekt Red
6	Electronic Arts
7	Nintendo
8	Activision
9	Unknown Worlds
10	Warner Bros. Games
11	Mojang Studios
12	Bethesda
13	Hello Games
14	NetherRealm Studios
15	Redragon
16	JBL
17	KZ
18	QCY
19	Corsair
\.


--
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 1, false);


--
-- Name: marca marca_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_nome_key UNIQUE (nome);


--
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id_marca);


--
-- PostgreSQL database dump complete
--

\unrestrict ugLFE0EKT0S2Wepjt0bAHXXSX9kLGb7romfX6HGjXQZJ7CbwrtHOKz0r1P2ywX5

