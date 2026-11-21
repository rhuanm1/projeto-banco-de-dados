--
-- PostgreSQL database dump
--

\restrict PSgL0waojI4BPv8cok6Sb8ur9epoPQbWHUHPqS2x9SmVlBlLXQrzmsMKBYC4aev

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
-- Name: produto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.produto (
    id_prod integer NOT NULL,
    nome character varying(70) NOT NULL,
    preco numeric(7,2) NOT NULL,
    subcategoria character varying(50) NOT NULL,
    estoque integer NOT NULL,
    id_categoria integer NOT NULL,
    id_marca integer,
    CONSTRAINT produto_estoque_check CHECK ((estoque >= 0)),
    CONSTRAINT produto_preco_check CHECK ((preco > (0)::numeric))
);


--
-- Name: produto_id_prod_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.produto_id_prod_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: produto_id_prod_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.produto_id_prod_seq OWNED BY public.produto.id_prod;


--
-- Name: produto id_prod; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto ALTER COLUMN id_prod SET DEFAULT nextval('public.produto_id_prod_seq'::regclass);


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.produto (id_prod, nome, preco, subcategoria, estoque, id_categoria, id_marca) FROM stdin;
1	Grand Theft Auto VI	399.90	acao	200	2	1
2	Forza Horizon 6	299.90	corrida	200	2	2
3	Marvel Spider-Man 2	299.90	aventura	200	2	3
4	Hollow Knight Silksong	149.90	indie	200	2	4
5	Cyberpunk 2077	199.90	rpg	200	2	5
6	EA Sports FC 26	349.90	esportes	200	2	6
7	The Legend of Zelda	299.90	aventura	200	2	7
8	Super Mario Odyssey	279.90	aventura	200	2	7
9	Pokémon Scarlet	299.90	exploracao	200	2	7
10	Call of Duty: Modern Warfare II	229.90	fps	200	2	8
11	Subnautica	129.90	exploracao	200	2	9
12	Red Dead Redemption	229.90	aventura	200	2	1
13	Mortal Kombat	119.90	luta	200	2	14
14	Batman: Arkham Collection	129.90	colecao	200	2	10
15	Minecraft	129.90	criatividade	200	2	11
16	Hollow Knight	69.90	indie	200	2	4
17	The Elder Scrolls V: Skyrim	129.90	rpg	200	2	12
18	No Man Sky	159.90	exploracao	200	2	13
19	Nintend Switch 2	3799.90	nintendo	200	1	7
20	PlayStation 5 slim	3699.90	playstation	200	1	3
21	Xbox Series X	4299.90	xbox	200	1	2
22	Nintendo Switch OLED	2599.90	nintendo	200	1	7
23	Xbox Series s	2699.90	xbox	200	1	2
24	PlayStation 4	1899.90	playstation	200	1	3
25	Controle Dualsense	499.90	controle	200	3	3
26	Controle Xbox Wireless	449.90	controle	200	3	2
27	Controle Nintendo Switch 2	549.90	controle	200	3	7
28	Headset Sony	699.90	fone	200	3	3
29	Headset Xbox	749.90	fone	200	3	2
30	Mouse Gamer Redragon Naga RGB 32000 DPI	279.90	mouse	200	3	15
31	Headphone JBL	799.90	fone	200	3	16
32	Fone KZ Castor	189.90	fone	200	3	17
33	Mouse Gamer Redragon Viper Fly RGB 26000 DPI	239.90	mouse	200	3	15
34	Reclado Magnetico Redragon Nephrite Pro	649.90	teclado	200	3	15
35	Fone QCY N30 ANC	299.90	fone	200	3	18
36	Teclado Mecânico Corsair Clipper	569.90	teclado	200	3	19
\.


--
-- Name: produto_id_prod_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_id_prod_seq', 36, true);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_prod);


--
-- Name: produto fk_produto_categoria; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- Name: produto fk_produto_marca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_produto_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca);


--
-- PostgreSQL database dump complete
--

\unrestrict PSgL0waojI4BPv8cok6Sb8ur9epoPQbWHUHPqS2x9SmVlBlLXQrzmsMKBYC4aev

