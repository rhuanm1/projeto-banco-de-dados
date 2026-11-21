--
-- PostgreSQL database dump
--

\restrict oPblu0qtPbk8DQJqHcLPgIPKBEdmraLmUTrLBZasVGM7ry33EtVULpAyGDyxpMM

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
-- Name: pagamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pagamento (
    id_pagamento integer NOT NULL,
    id_pedido integer NOT NULL,
    metodo character varying(40) NOT NULL,
    valor numeric(10,2) NOT NULL,
    status character varying(30) DEFAULT 'pendente'::character varying,
    data_pagamento timestamp without time zone,
    CONSTRAINT pagamento_valor_check CHECK ((valor > (0)::numeric))
);


--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pagamento_id_pagamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pagamento_id_pagamento_seq OWNED BY public.pagamento.id_pagamento;


--
-- Name: pagamento id_pagamento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('public.pagamento_id_pagamento_seq'::regclass);


--
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pagamento (id_pagamento, id_pedido, metodo, valor, status, data_pagamento) FROM stdin;
\.


--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pagamento_id_pagamento_seq', 1, false);


--
-- Name: pagamento pagamento_id_pedido_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_id_pedido_key UNIQUE (id_pedido);


--
-- Name: pagamento pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_pkey PRIMARY KEY (id_pagamento);


--
-- Name: pagamento pagamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);


--
-- PostgreSQL database dump complete
--

\unrestrict oPblu0qtPbk8DQJqHcLPgIPKBEdmraLmUTrLBZasVGM7ry33EtVULpAyGDyxpMM

