--
-- PostgreSQL database dump
--

\restrict GAkraHD6BhXmldYVXH6isng5cIADBZtIk73ERLeMqG5VaqJwOad4afVGUrj3dlJ

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
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telefone character varying(20)
);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cliente_id_cliente_seq OWNED BY public.cliente.id_cliente;


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
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);


--
-- Name: cliente id_cliente; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.cliente_id_cliente_seq'::regclass);


--
-- Name: endereco id_endereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco ALTER COLUMN id_endereco SET DEFAULT nextval('public.endereco_id_endereco_seq'::regclass);


--
-- Name: item_pedido id_item; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_pedido ALTER COLUMN id_item SET DEFAULT nextval('public.item_pedido_id_item_seq'::regclass);


--
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- Name: pagamento id_pagamento; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento ALTER COLUMN id_pagamento SET DEFAULT nextval('public.pagamento_id_pagamento_seq'::regclass);


--
-- Name: pedido id_pedido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedido_id_pedido_seq'::regclass);


--
-- Name: produto id_prod; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto ALTER COLUMN id_prod SET DEFAULT nextval('public.produto_id_prod_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categoria (id_categoria, nome) FROM stdin;
1	consoles
2	jogos
3	perifericos
\.


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cliente (id_cliente, nome, email, telefone) FROM stdin;
\.


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.endereco (id_endereco, id_cliente, rua, numero, bairro, cidade, estado, cep) FROM stdin;
\.


--
-- Data for Name: item_pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.item_pedido (id_item, id_pedido, id_prod, quantidade, preco_unitario) FROM stdin;
\.


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
-- Data for Name: pagamento; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pagamento (id_pagamento, id_pedido, metodo, valor, status, data_pagamento) FROM stdin;
\.


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pedido (id_pedido, id_cliente, id_endereco, data_pedido, status) FROM stdin;
\.


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
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 3, true);


--
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cliente_id_cliente_seq', 1, false);


--
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.endereco_id_endereco_seq', 1, false);


--
-- Name: item_pedido_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.item_pedido_id_item_seq', 1, false);


--
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 1, false);


--
-- Name: pagamento_id_pagamento_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pagamento_id_pagamento_seq', 1, false);


--
-- Name: pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pedido_id_pedido_seq', 1, false);


--
-- Name: produto_id_prod_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.produto_id_prod_seq', 36, true);


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
-- Name: cliente cliente_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_email_key UNIQUE (email);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- Name: endereco endereco_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


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
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id_pedido);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_prod);


--
-- Name: endereco endereco_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.endereco
    ADD CONSTRAINT endereco_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cliente(id_cliente);


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
-- Name: pagamento pagamento_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pagamento
    ADD CONSTRAINT pagamento_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedido(id_pedido);


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

\unrestrict GAkraHD6BhXmldYVXH6isng5cIADBZtIk73ERLeMqG5VaqJwOad4afVGUrj3dlJ

