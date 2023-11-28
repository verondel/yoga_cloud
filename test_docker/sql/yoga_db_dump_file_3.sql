--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: yoga_db
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO yoga_db;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: yoga_db
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO yoga_db;

--
-- Name: book; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.book (
    id integer NOT NULL,
    id_subscribe integer NOT NULL,
    id_lesson integer NOT NULL
);


ALTER TABLE public.book OWNER TO yoga_db;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO yoga_db;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.client (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    dt_birthday character varying(100) NOT NULL,
    passport character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.client OWNER TO yoga_db;

--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO yoga_db;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: hall; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.hall (
    id integer NOT NULL,
    capacity integer NOT NULL,
    inventory boolean
);


ALTER TABLE public.hall OWNER TO yoga_db;

--
-- Name: hall_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hall_id_seq OWNER TO yoga_db;

--
-- Name: hall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.hall_id_seq OWNED BY public.hall.id;


--
-- Name: lesson; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.lesson (
    id integer NOT NULL,
    id_hall integer NOT NULL,
    id_specialty_of_teacher integer NOT NULL,
    dt timestamp(6) without time zone NOT NULL,
    cmplx integer
);


ALTER TABLE public.lesson OWNER TO yoga_db;

--
-- Name: lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lesson_id_seq OWNER TO yoga_db;

--
-- Name: lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.lesson_id_seq OWNED BY public.lesson.id;


--
-- Name: specialty_of_teacher; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.specialty_of_teacher (
    id integer NOT NULL,
    id_tp_lesson integer NOT NULL,
    id_teacher integer NOT NULL
);


ALTER TABLE public.specialty_of_teacher OWNER TO yoga_db;

--
-- Name: specialty_of_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.specialty_of_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialty_of_teacher_id_seq OWNER TO yoga_db;

--
-- Name: specialty_of_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.specialty_of_teacher_id_seq OWNED BY public.specialty_of_teacher.id;


--
-- Name: subscribe; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.subscribe (
    id integer NOT NULL,
    id_client integer NOT NULL,
    dt_begin date,
    dt_end date,
    amount integer NOT NULL
);


ALTER TABLE public.subscribe OWNER TO yoga_db;

--
-- Name: subscribe_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.subscribe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscribe_id_seq OWNER TO yoga_db;

--
-- Name: subscribe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.subscribe_id_seq OWNED BY public.subscribe.id;


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.teacher (
    id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    experience text NOT NULL,
    education text NOT NULL,
    gender character varying(50) NOT NULL
);


ALTER TABLE public.teacher OWNER TO yoga_db;

--
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_seq OWNER TO yoga_db;

--
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;


--
-- Name: tp_lesson; Type: TABLE; Schema: public; Owner: yoga_db
--

CREATE TABLE public.tp_lesson (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    discription text NOT NULL,
    is_visible boolean NOT NULL,
    src_image character varying(100) NOT NULL
);


ALTER TABLE public.tp_lesson OWNER TO yoga_db;

--
-- Name: tp_lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: yoga_db
--

CREATE SEQUENCE public.tp_lesson_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tp_lesson_id_seq OWNER TO yoga_db;

--
-- Name: tp_lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yoga_db
--

ALTER SEQUENCE public.tp_lesson_id_seq OWNED BY public.tp_lesson.id;


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: hall id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.hall ALTER COLUMN id SET DEFAULT nextval('public.hall_id_seq'::regclass);


--
-- Name: lesson id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.lesson ALTER COLUMN id SET DEFAULT nextval('public.lesson_id_seq'::regclass);


--
-- Name: specialty_of_teacher id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.specialty_of_teacher ALTER COLUMN id SET DEFAULT nextval('public.specialty_of_teacher_id_seq'::regclass);


--
-- Name: subscribe id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.subscribe ALTER COLUMN id SET DEFAULT nextval('public.subscribe_id_seq'::regclass);


--
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);


--
-- Name: tp_lesson id; Type: DEFAULT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.tp_lesson ALTER COLUMN id SET DEFAULT nextval('public.tp_lesson_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
297ea2f5-1c58-4751-9400-31225853aef2	aa19d3f35d8f5f94cb8faac17c99720dfb6016cb8e5b2f11dda7bb2de24dc24a	2023-03-04 20:43:19.575157+06	20230221153938_change_to_int	\N	\N	2023-03-04 20:43:19.506008+06	1
db2ff7a6-f492-426e-ab05-35cdaad76060	f6eb743e366ded17f24953230da6be54dc7ea101d4dcef94be73e93f4dfe372b	2023-03-04 20:43:19.577783+06	20230221154352_change_to_new_int	\N	\N	2023-03-04 20:43:19.575771+06	1
e85a74a7-d283-4b6a-800d-8a233ae463c8	ead9356d06577b5b873729cc16fd07d642ea6abe6235e7aac842bca20b680b81	2023-03-04 20:44:02.578356+06	20230304144402_add_src_and_visible	\N	\N	2023-03-04 20:44:02.575341+06	1
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.book (id, id_subscribe, id_lesson) FROM stdin;
98	1	149
2	1	8
99	16	149
4	6	100
5	1	103
6	7	10
100	17	150
8	1	100
9	1	110
10	1	113
11	1	16
12	1	16
13	1	116
14	1	116
15	2	118
16	2	118
17	2	120
20	2	117
21	1	118
22	1	120
23	1	117
24	1	120
25	1	120
26	2	115
27	2	16
28	2	123
30	1	121
31	1	120
32	1	122
88	14	119
89	14	131
90	14	130
91	14	119
92	14	119
93	14	131
94	15	26
95	15	26
96	15	131
97	15	144
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.client (id, full_name, dt_birthday, passport, phone, email) FROM stdin;
2	Полюткина Екатерина Алексеевна	14.08.1991	4023 123123	+7(222)222-22-22	polut@gmail.com
1	Лебедева Ольга Игоревна	02.04.1995	4023 234233	+7(111)111-11-11	lebedev@gmail.com
15	Карпов Виктор Андреевич	23.11.1972	4023 131231	+7(333)333-33-33	karp@gmail.com
33	Скрыль Вера Андреевна	13.09.2003	4111 111111	+7(888)888-88-88	vera@mail.com
34	Девятый Девять Девятович	09.08.1962	1222 121221	+7(999)999-99-99	nine@mail.com
54	Дебора Астер	13.09.2003	1231 231232	+7(921)448-86-40	kari_na@mail.com
55	Скрыль Андрей Ростиславович	04.10.1973	4040 123123	+7(921)745-85-09	skrylandrey@mail.com
56	Фамил Им Отч	12.09.2000	1212 312312	+7(738)726-38-73	ivan@mail.com
57	Фамил Им Отч	22.03.2000	8765 434567	+7(098)765-46-78	kari_na@mail.com
\.


--
-- Data for Name: hall; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.hall (id, capacity, inventory) FROM stdin;
1	10	t
2	6	t
\.


--
-- Data for Name: lesson; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.lesson (id, id_hall, id_specialty_of_teacher, dt, cmplx) FROM stdin;
1	1	1	2023-08-01 21:00:00	1
2	1	1	2023-03-20 21:00:00	1
3	1	3	2023-04-02 16:03:47.926	1
4	1	3	2023-08-04 19:00:00	1
5	1	3	2023-04-04 08:35:00	1
6	1	3	2023-11-04 08:35:00	1
11	1	2	2023-09-04 10:00:00	2
12	1	1	2023-03-04 12:00:00	3
13	1	1	2023-03-04 15:00:00	3
14	2	3	2023-12-04 09:00:00	3
15	2	3	2023-12-04 09:00:00	3
16	1	3	2023-05-13 09:00:00	1
17	1	3	2023-05-13 09:00:00	1
143	1	2	2023-05-17 12:00:00	4
144	1	2	2023-05-18 12:00:00	4
20	2	2	2023-05-17 17:00:00	2
21	2	2	2023-05-17 17:00:00	2
22	2	2	2023-05-17 17:00:00	2
23	2	2	2023-05-17 17:00:00	2
24	1	4	2023-05-17 09:00:00	2
25	1	4	2023-05-17 09:00:00	2
26	1	4	2023-05-17 09:00:00	2
27	2	3	2024-03-06 11:00:00	5
28	2	3	2024-02-06 11:00:00	5
145	2	3	2023-05-20 20:00:00	0
146	2	3	2023-05-21 20:00:00	0
32	2	3	2024-03-07 11:00:00	5
34	2	3	2024-02-03 11:00:00	5
35	2	3	2024-02-03 11:00:00	5
36	2	3	2024-02-03 11:00:00	5
37	2	2	2024-02-03 12:01:00	2
38	2	2	2024-01-03 12:01:00	2
39	2	2	2023-04-12 12:02:00	4
40	2	2	2023-04-11 12:01:00	4
41	2	2	2023-04-13 12:03:00	4
42	2	2	2023-04-14 12:04:00	4
43	1	2	2023-04-14 12:02:00	4
44	1	2	2023-04-18 12:05:00	4
45	1	3	2023-04-13 09:02:00	4
46	1	3	2023-04-13 09:02:00	4
47	1	3	2023-04-13 09:02:00	4
48	1	3	2023-04-13 09:02:00	4
49	2	4	2023-04-15 13:02:00	5
50	2	4	2023-04-18 13:06:00	5
51	2	3	2023-04-18 09:02:00	4
52	2	3	2023-04-15 13:06:00	4
53	2	3	2023-04-18 09:02:00	2
54	2	3	2023-04-15 13:06:00	2
55	2	4	2023-04-10 08:00:00	1
56	2	2	2023-04-17 13:00:00	4
57	1	4	2023-04-18 10:00:00	4
58	1	4	2023-04-18 10:00:00	4
59	1	4	2023-04-15 09:00:00	4
60	1	4	2023-04-22 09:00:00	4
61	1	4	2023-04-15 09:00:00	4
62	1	4	2023-04-15 09:00:00	4
63	1	4	2023-04-22 09:00:00	4
64	1	4	2023-04-22 09:00:00	4
65	1	4	2023-04-15 09:00:00	4
66	1	4	2023-04-22 09:00:00	4
67	1	4	2023-04-15 09:00:00	4
68	1	4	2023-04-22 09:00:00	4
69	1	4	2023-04-15 09:00:00	4
70	1	4	2023-04-22 09:00:00	4
71	1	4	2023-04-15 09:00:00	4
72	1	4	2023-04-22 09:00:00	4
73	1	4	2023-04-15 09:00:00	4
74	1	2	2023-04-15 09:00:00	4
75	1	2	2023-04-16 10:00:00	4
76	1	2	2023-04-15 09:00:00	4
77	2	3	2023-04-16 09:00:00	1
78	1	2	2023-04-21 11:00:00	3
79	1	2	2023-04-22 12:00:00	3
80	1	4	2023-04-18 10:00:00	4
81	1	4	2023-04-14 09:00:00	4
82	1	4	2023-04-22 10:00:00	3
148	2	4	2023-05-16 20:00:00	2
119	2	2	2023-05-15 08:15:00	1
149	2	6	2023-05-24 08:30:00	4
150	2	6	2023-05-22 08:30:00	4
151	2	6	2023-05-26 08:30:00	4
152	1	1	2023-05-23 08:45:00	4
154	1	1	2023-05-27 08:45:00	4
155	1	1	2023-05-25 08:45:00	4
94	2	5	2023-04-25 09:00:00	3
111	2	5	2023-05-05 13:45:00	4
112	2	5	2023-05-01 13:15:00	4
96	1	6	2024-05-30 09:12:00	3
158	2	4	2023-05-25 11:00:00	2
98	1	3	2023-04-26 10:00:00	2
99	1	3	2023-04-27 11:00:00	2
95	2	5	2023-04-26 13:00:00	3
8	1	3	2023-05-04 08:00:00	1
7	2	4	2023-05-04 11:00:00	1
9	2	3	2023-05-02 09:00:00	1
113	1	3	2023-05-07 15:30:00	4
10	1	2	2023-05-06 09:00:00	5
100	1	4	2023-05-03 09:00:00	3
101	1	4	2023-05-05 09:00:00	3
103	1	4	2023-05-07 09:00:00	3
157	2	4	2023-05-22 10:45:00	2
159	2	5	2023-05-22 13:00:00	4
106	2	3	2023-05-07 18:00:00	4
108	2	3	2023-05-06 18:00:00	3
107	2	2	2023-05-04 17:45:00	2
160	2	5	2023-05-24 13:15:00	4
110	2	5	2023-05-03 13:30:00	4
161	2	5	2023-05-26 14:00:00	4
115	1	3	2023-05-08 19:00:00	4
116	1	3	2023-05-13 15:00:00	4
125	2	1	2023-05-13 10:45:00	2
162	2	5	2023-05-29 13:00:00	4
163	2	5	2023-05-31 13:15:00	4
118	2	6	2023-05-08 16:00:00	1
164	2	5	2023-06-02 14:00:00	4
102	1	6	2023-05-01 17:18:00	3
130	1	1	2023-05-19 18:00:00	3
33	2	4	2024-02-03 11:00:00	5
109	1	6	2023-05-01 20:00:00	4
117	2	6	2023-05-10 09:15:00	1
120	1	5	2023-05-09 09:15:00	4
121	1	5	2023-05-11 08:45:00	4
123	2	4	2023-05-10 11:00:00	3
126	2	2	2023-05-14 08:30:00	1
122	2	3	2023-05-12 08:30:00	4
129	1	4	2023-05-18 18:00:00	2
131	1	4	2023-05-18 08:45:00	3
19	2	1	2023-05-16 14:00:00	1
\.


--
-- Data for Name: specialty_of_teacher; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.specialty_of_teacher (id, id_tp_lesson, id_teacher) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	1	5
6	2	3
\.


--
-- Data for Name: subscribe; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.subscribe (id, id_client, dt_begin, dt_end, amount) FROM stdin;
6	33	2023-05-03	2023-06-03	6
7	34	2023-05-06	2023-05-06	0
14	54	2023-05-15	2023-06-15	2
2	15	2023-05-01	2023-07-01	5
15	55	2023-05-17	2023-06-17	1
1	1	2023-05-24	2023-06-24	3
16	56	2023-05-24	2023-05-24	0
17	56	2023-05-22	2023-05-22	0
\.


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.teacher (id, full_name, experience, education, gender) FROM stdin;
2	Шарова Клавдия Геласьевна	5 лет	Индийский институт	F
4	Носков Аскольд Лукьянович	4 года	Аграрный университет	M
3	Сидоров Велорий Олегович	6 лет 	Технологический 	M
5	Красцова Риана Федосеевна	8 лет	Технологии и дизайна	F
1	Кондратьева Мишель Ухлебовна	10 лет	СПБГУ	F
\.


--
-- Data for Name: tp_lesson; Type: TABLE DATA; Schema: public; Owner: yoga_db
--

COPY public.tp_lesson (id, name, discription, is_visible, src_image) FROM stdin;
2	Аштанга	<p>Аштанга-йога, также известная как аштанга-виньяса-йога, военная йога или оригинальная силовая йога, - это традиционная практика, уходящая корнями в Индию. Его истоки берут начало в 5000-летнем йогическом тексте "Йога Корунта", написанном Вамана Риши. Патанджали составил это древнее писание между 200 и 400 гг. до н.э. и создал "Йога-сутры".</p> <p>Аштанга-йога следует определенной философии и мудрости учения. Дословный перевод аштанги - восемь конечностей. Это практики, которые подсказывают, как сделать свою жизнь осмысленной с помощью морально-этических уроков о себе. Последовательность идет от внешнего к внутреннему.</p>  <p>Практика аштанга-йоги предлагает уникальную и мощную практику для тех, кто стремится улучшить свое физическое, психическое и духовное состояние.  Благодаря сочетанию силовых поз, дыхания и медитации, практикующие могут развивать самосознание, дисциплину и эмоциональное исцеление.</p> <p>Присоединяйтесь к нам на занятия аштанга-йогой и откройте для себя многочисленные преимущества этой преобразующей практики!</p>	t	./images/2.jpg
4	Хатха	Описание Хатхи	f	./images/1.png
3	Нидра	<p>Нидра в переводе с санскрита означает, буквально – сон. Yoga-nidrā – «йога сна». Пограничное состояние между сном и бодрствованием, которое имеет более широкое название – «психический сон». Исследованием этого феномена занимались американские ученые в 70-е годы. Было сделано удивительное открытие: благодаря тантрическим практикам, человек действительно может управлять своим сознанием и подсознанием, находясь при этом в физической фазе глубокого йогического сна.</p> <p>Основателем практики является Свами Сатьянанда Сарасвати, йогин, мастер тантры, автор одноименной книги «Йога-Нидра». Именно он популяризировал практики, совместив их с аутотренингом и уроками, стал основателем научно-исследовательского института йоги.</p> <p>Йога-нидра является методом расслабления, глубокой релаксации, посредством ухода в себя, в собственное подсознание. Практики доказывают, что один час йоги-нидры способен заменить четыре часа полноценного крепкого сна.</p>	t	./images/3.jpg
1	Кундалини	<p>Практика кундалини йоги развивает способность контролировать свои эмоции, мысли и желания.</p> <p>В Кундалини-йоге мы концентрируемся на активизации энергетических центров тела, известных как чакры, для достижения общего благополучия. Благодаря сочетанию физических движений, дыхания и медитации вы можете уменьшить стресс, повысить уровень энергии, улучшить ясность ума и сосредоточенность.</p> <p>Но Кундалини-йога - это не только физическая практика, но и глубоко духовная. Соединяясь с дыханием и движением, вы можете подключиться к чувству вселенского сознания, которое поможет вам расширить ваше осознание и пробудить ваш внутренний потенциал.</p> <p>Присоединяйтесь к нам на занятия кундалини-йогой и испытайте на себе преобразующую силу этой древней практики. В нашем сообществе поддерживающих и поднимающих настроение практикующих вы сможете воспитать в себе чувство внутренней силы, стойкости и радости, которое будет помогать вам во всех сферах вашей жизни.</p> <p>Попробуйте Кундалини-йогу и откройте для себя многочисленные преимущества этой мощной практики!</p>	t	./images/1.png
\.


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.book_id_seq', 100, true);


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.client_id_seq', 57, true);


--
-- Name: hall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.hall_id_seq', 2, true);


--
-- Name: lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.lesson_id_seq', 164, true);


--
-- Name: specialty_of_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.specialty_of_teacher_id_seq', 6, true);


--
-- Name: subscribe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.subscribe_id_seq', 17, true);


--
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.teacher_id_seq', 5, true);


--
-- Name: tp_lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yoga_db
--

SELECT pg_catalog.setval('public.tp_lesson_id_seq', 5, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: book book_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- Name: hall hall_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (id);


--
-- Name: lesson lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT lesson_pkey PRIMARY KEY (id);


--
-- Name: specialty_of_teacher specialty_of_teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.specialty_of_teacher
    ADD CONSTRAINT specialty_of_teacher_pkey PRIMARY KEY (id);


--
-- Name: subscribe subscribe_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.subscribe
    ADD CONSTRAINT subscribe_pkey PRIMARY KEY (id);


--
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id);


--
-- Name: tp_lesson tp_lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.tp_lesson
    ADD CONSTRAINT tp_lesson_pkey PRIMARY KEY (id);


--
-- Name: idx_book__id_lesson; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_book__id_lesson ON public.book USING btree (id_lesson);


--
-- Name: idx_book__id_subscribe; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_book__id_subscribe ON public.book USING btree (id_subscribe);


--
-- Name: idx_lesson__id_hall; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_lesson__id_hall ON public.lesson USING btree (id_hall);


--
-- Name: idx_lesson__id_specialty_of_teacher; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_lesson__id_specialty_of_teacher ON public.lesson USING btree (id_specialty_of_teacher);


--
-- Name: idx_specialty_of_teacher__id_teacher; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_specialty_of_teacher__id_teacher ON public.specialty_of_teacher USING btree (id_teacher);


--
-- Name: idx_specialty_of_teacher__id_tp_lesson; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_specialty_of_teacher__id_tp_lesson ON public.specialty_of_teacher USING btree (id_tp_lesson);


--
-- Name: idx_subscribe__id_client; Type: INDEX; Schema: public; Owner: yoga_db
--

CREATE INDEX idx_subscribe__id_client ON public.subscribe USING btree (id_client);


--
-- Name: book fk_book__id_lesson; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book__id_lesson FOREIGN KEY (id_lesson) REFERENCES public.lesson(id);


--
-- Name: book fk_book__id_subscribe; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT fk_book__id_subscribe FOREIGN KEY (id_subscribe) REFERENCES public.subscribe(id) ON DELETE CASCADE;


--
-- Name: lesson fk_lesson__id_hall; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson__id_hall FOREIGN KEY (id_hall) REFERENCES public.hall(id) ON DELETE CASCADE;


--
-- Name: lesson fk_lesson__id_specialty_of_teacher; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.lesson
    ADD CONSTRAINT fk_lesson__id_specialty_of_teacher FOREIGN KEY (id_specialty_of_teacher) REFERENCES public.specialty_of_teacher(id) ON DELETE CASCADE;


--
-- Name: specialty_of_teacher fk_specialty_of_teacher__id_teacher; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.specialty_of_teacher
    ADD CONSTRAINT fk_specialty_of_teacher__id_teacher FOREIGN KEY (id_teacher) REFERENCES public.teacher(id) ON DELETE CASCADE;


--
-- Name: specialty_of_teacher fk_specialty_of_teacher__id_tp_lesson; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.specialty_of_teacher
    ADD CONSTRAINT fk_specialty_of_teacher__id_tp_lesson FOREIGN KEY (id_tp_lesson) REFERENCES public.tp_lesson(id) ON DELETE CASCADE;


--
-- Name: subscribe fk_subscribe__id_client; Type: FK CONSTRAINT; Schema: public; Owner: yoga_db
--

ALTER TABLE ONLY public.subscribe
    ADD CONSTRAINT fk_subscribe__id_client FOREIGN KEY (id_client) REFERENCES public.client(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: yoga_db
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

