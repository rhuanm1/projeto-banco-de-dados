--
-- PostgreSQL database dump
--

\restrict FwL64zX602NWZoHU0VTi02pNPSSpTgWSmawChPum9O1kXbzpjRgK6PD7J8MD3CR

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
-- Name: item_pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_pedido (
    id_item integer NOT NULL,
    id_pedido integer NOT NULL,
    id_prod integer NOT NULL,
    quantidade integer NOT NULL,
    preco_unitario numeric(10,2) NOT NULL,
    CONSTRAINT item_pedido_preco_unitario_check CHECK ((preco_unitario > (0)::numeric)),
    CONSTRAINT item_pedido_quantidade_check CHECK ((quantidade > 0))
);


--
-- Name: item_pedido_id_item_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_pedido_id_item_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_pedido_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.item_pedido_id_item_seq OWNED BY public.item_pedido.id_item;


--
-- Name: item_pedido id_item; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido ALTER COLUMN id_item SET DEFAULT nextval('public.item_pedido_id_item_seq'::regclass);


--
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_pedido (id_item, id_pedido, id_prod, quantidade, preco_unitario) FROM stdin;
\.


--
-- Name: item_pedido_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_pedido_id_item_seq', 1, false);


--
-- Name: item_pedido item_pedido_id_pedido_id_prod_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_id_pedido_id_prod_key UNIQUE (id_pedido, id_prod);


--
-- Name: item_pedido item_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_pkey PRIMARY KEY (id_item);


--
-- Name: item_pedido item_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);


--
-- Name: item_pedido item_pedido_id_prod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido
    ADD CONSTRAINT item_pedido_id_prod_fkey FOREIGN KEY (id_prod) REFERENCES public.produto(id_prod);


--
-- PostgreSQL database dump complete
--

\unrestrict FwL64zX602NWZoHU0VTi02pNPSSpTgWSmawChPum9O1kXbzpjRgK6PD7J8MD3CR

