--
-- PostgreSQL database dump
--

\restrict dptZd1j7jJPoDuWMLNiFd3EWdIrfitQWfxZ0qEgjKfaaXRPBHwARiMCugA6wWGF

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
-- Name: pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pedido (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    id_endereco integer NOT NULL,
    data_pedido timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(30) DEFAULT 'pendente'::character varying
);


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pedido_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pedido_id_pedido_seq OWNED BY public.pedido.id_pedido;


--
-- Name: pedido id_pedido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pedido (id_pedido, id_cliente, id_endereco, data_pedido, status) FROM stdin;
\.


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);


--
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- Name: pedido pedido_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


--
-- Name: pedido pedido_id_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_id_endereco_fkey FOREIGN KEY (id_endereco) REFERENCES public.endereco(id_endereco);


--
-- PostgreSQL database dump complete
--

\unrestrict dptZd1j7jJPoDuWMLNiFd3EWdIrfitQWfxZ0qEgjKfaaXRPBHwARiMCugA6wWGF

