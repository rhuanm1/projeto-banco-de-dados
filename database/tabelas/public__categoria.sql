--
-- PostgreSQL database dump
--

\restrict qQhiK5hKJiXmeQJqAgtxy2fG0sC7znFr6Ei1MYyPFvf5Cpx8SzG7Oa33Lbtrt4K

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
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nome character varying(40) NOT NULL
);


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;


--
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categoria (id_categoria, nome) FROM stdin;
1	consoles
2	jogos
3	perifericos
\.


--
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 3, true);


--
-- Name: categoria categoria_nome_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nome_key UNIQUE (nome);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- PostgreSQL database dump complete
--

\unrestrict qQhiK5hKJiXmeQJqAgtxy2fG0sC7znFr6Ei1MYyPFvf5Cpx8SzG7Oa33Lbtrt4K

