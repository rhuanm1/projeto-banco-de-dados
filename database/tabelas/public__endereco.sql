--
-- PostgreSQL database dump
--

\restrict k1oBJiVWcD0rhXOUVJZzZ37IiZuB3o1GL9Cd29fv0NmsCN4vcPTnd7XZfgnPfTJ

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
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.endereco (
    id_endereco integer NOT NULL,
    id_cliente integer NOT NULL,
    rua character varying(100) NOT NULL,
    numero character varying(100) NOT NULL,
    bairro character varying(60) NOT NULL,
    cidade character varying(60) NOT NULL,
    estado character varying(2) NOT NULL,
    cep character varying(10) NOT NULL
);


--
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.endereco_id_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.endereco_id_endereco_seq OWNED BY public.endereco.id_endereco;


--
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.endereco (id_endereco, id_cliente, rua, numero, bairro, cidade, estado, cep) FROM stdin;
\.


--
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 1, false);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- Name: endereco endereco_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- PostgreSQL database dump complete
--

\unrestrict k1oBJiVWcD0rhXOUVJZzZ37IiZuB3o1GL9Cd29fv0NmsCN4vcPTnd7XZfgnPfTJ

