--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: admin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: benefit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.benefit (
    id bigint NOT NULL,
    category character varying(255),
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE public.benefit OWNER TO postgres;

--
-- Name: benefit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.benefit_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.benefit_seq OWNER TO postgres;

--
-- Name: chat_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_message (
    id bigint NOT NULL,
    content character varying(255) NOT NULL,
    "timestamp" timestamp(6) without time zone NOT NULL,
    recipient_id bigint NOT NULL,
    sender_id bigint NOT NULL
);


ALTER TABLE public.chat_message OWNER TO postgres;

--
-- Name: chat_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_message_id_seq OWNER TO postgres;

--
-- Name: chat_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_message_id_seq OWNED BY public.chat_message.id;


--
-- Name: departemnt_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departemnt_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departemnt_seq OWNER TO postgres;

--
-- Name: department_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_seq OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id bigint NOT NULL,
    account_type character varying(255),
    address character varying(255),
    created_at timestamp(6) with time zone,
    department character varying(255),
    email character varying(255),
    first_name character varying(255),
    job character varying(255),
    last_name character varying(255),
    password character varying(255),
    phone_number integer NOT NULL,
    updated_at timestamp(6) with time zone,
    state character varying(255),
    username character varying(255)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_seq OWNER TO postgres;

--
-- Name: equipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipments (
    id bigint NOT NULL,
    category character varying(255),
    created_at timestamp(6) with time zone,
    maintenance_status character varying(255),
    manufactuer character varying(255),
    model character varying(255),
    name character varying(255),
    price integer,
    quantity integer,
    state character varying(255),
    type character varying(255),
    updated_at timestamp(6) with time zone,
    benefit_id bigint,
    reservation_id bigint,
    reservation_state character varying(255),
    description character varying(255),
    returned character varying(255),
    taken character varying(255)
);


ALTER TABLE public.equipments OWNER TO postgres;

--
-- Name: equipments_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipments_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipments_seq OWNER TO postgres;

--
-- Name: notificationn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificationn (
    id bigint NOT NULL,
    created_at timestamp(6) with time zone,
    date_envoi character varying(255),
    date_reception character varying(255),
    heure character varying(255),
    id_employee bigint,
    message character varying(255),
    receiver character varying(255),
    statut_lecture character varying(255),
    titre character varying(255),
    type character varying(255),
    updated_at timestamp(6) with time zone
);


ALTER TABLE public.notificationn OWNER TO postgres;

--
-- Name: notificationn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificationn_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificationn_seq OWNER TO postgres;

--
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_token (
    id bigint NOT NULL,
    expiry_date timestamp(6) without time zone NOT NULL,
    token character varying(255) NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public.password_reset_token OWNER TO postgres;

--
-- Name: password_reset_token_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_reset_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_reset_token_id_seq OWNER TO postgres;

--
-- Name: password_reset_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_reset_token_id_seq OWNED BY public.password_reset_token.id;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id bigint NOT NULL,
    category character varying(255),
    created_at timestamp(6) with time zone,
    depart_date character varying(255),
    depart_hour character varying(255),
    equipments_id bigint,
    name character varying(255),
    return_hour character varying(255),
    rooms_id bigint,
    state character varying(255),
    sub_category character varying(255),
    updated_at timestamp(6) with time zone,
    employee_id bigint,
    username character varying(255),
    equipments_status character varying(255),
    rooms_status character varying(255),
    benefit_status character varying(255)
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: reservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservation_seq OWNER TO postgres;

--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    capacity integer,
    category character varying(255),
    created_at timestamp(6) with time zone,
    location character varying(255),
    maintenance_status character varying(255),
    name character varying(255),
    state character varying(255),
    type character varying(255),
    updated_at timestamp(6) with time zone,
    benefit_id bigint,
    reservation_id bigint,
    description character varying(255),
    reservation_state character varying(255),
    free character varying(255),
    occupied character varying(255)
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: rooms_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_seq OWNER TO postgres;

--
-- Name: chat_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message ALTER COLUMN id SET DEFAULT nextval('public.chat_message_id_seq'::regclass);


--
-- Name: password_reset_token id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token ALTER COLUMN id SET DEFAULT nextval('public.password_reset_token_id_seq'::regclass);


--
-- Data for Name: benefit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.benefit (id, category, created_at, updated_at) FROM stdin;
1	Equipments	2024-04-19 18:00:33.207367+01	2024-04-19 18:00:33.20881+01
2	Rooms	2024-04-19 18:00:44.756476+01	2024-04-19 18:00:44.756476+01
\.


--
-- Data for Name: chat_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_message (id, content, "timestamp", recipient_id, sender_id) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, account_type, address, created_at, department, email, first_name, job, last_name, password, phone_number, updated_at, state, username) FROM stdin;
1208	Employee	23 rue kalaa sghiraa, sousse	2024-04-25 16:12:24.993764+01	web	khalil@gmail.com	khalil	Software	mokded	$2a$10$M5lha9XVxjC8eX2sIzGmO.Bo9an0A6kbG7GWj9.10I60dWANWA8AW	54439814	2024-05-07 10:08:43.164041+01	Active	Khalil Mokdad
1207	Employee	23 rue mseken, sousse	2024-04-25 16:11:21.123775+01	security	mohamedali@gmail.com	mohamed ali	Security	belchikh	$2a$10$AqStrbwdG17Ng17H2wXaWOEnH2xn.FJ6iAlBZTgOXgN.MPCkCekTa	54488814	2024-05-07 10:09:25.089129+01	Inactive	Med Ali
1252	Employee	22 rue mohamed ali	2024-04-30 14:03:38.16496+01	web	fathi@gmail.com	fathi	Data Analysist	mehrez	$2a$10$IkJirw6lE7yxS0zcTcScbeGmV4AWYrrg7pmZiSeFY1EG9M2DIJEty	99877362	2024-05-07 10:11:04.043085+01	Active	Fathi Mehrez
1202	Employee	22 rue khaled ben el walid	2024-04-25 15:22:19.606033+01	web	asma@gmail.com	asma	web developer	berkaya	$2a$10$gbR1QHUGeBly9aFbY/MugOad1TdRqsfEzaDRcfGypsqjgvldv7r/2	54439814	2024-06-03 13:29:58.948809+01	Active	Asmouma
1552	Employee	rue el basatin	2024-05-24 19:31:30.100255+01	web	mazench@gmail.com	mazen	it	chouchene	$2a$10$1MDwzsinR05/CnYClmUbdOtWINTsSb4U87wqbgj6MNZlV9sSFpsU.	24615230	2024-05-24 19:31:30.100255+01	Active	mazen
1408	Employee	302 rue mohamed khali , sousse	2024-05-13 22:44:59.496827+01	web	safwene@gmail.com	Safwene	angular developer	Hog	$2a$10$i/YXG0CrabMj0qDTsD8NjeroPIobknRd3AV/0YUuIhMPFL.X4x.He	93594060	2024-05-14 14:33:54.719179+01	Inactive	safwene hog
1206	Employee	23 rue sahloul, sousse	2024-04-25 16:10:40.10817+01	web	houssem@gmail.com	houssem	frontend 	wardeni	$2a$10$UEnqqm2gWfW8wwd03rLTD.oiGF4JFHvGMPrHHnav29cnZxAVNv7oW	54466123	2024-05-07 10:02:13.161747+01	Active	Houssem Wardeni
1602	Employee	rue 	2024-05-24 19:43:36.97893+01	Web	nabil@gmail.com	nabil	it	ben mahmoud	$2a$10$PsSwrrQJ2N0XmSwQPs7I/ePzA0KpnZ1EKuMmImLqZUcWLXTQrAq72	58835307	2024-05-27 10:22:41.30208+01	Active	nabil
1204	Employee	23 rue bouhsina , sousse	2024-04-25 16:08:31.462864+01	mobile	ahmed@gmail.com	ahmed	flutter dev	bouraoui	$2a$10$a.JGisAyG4l6dzp.7tLf1uHVywkwlccPa4T1l5ZSMzy5Vu0o33jwG	99154123	2024-05-07 10:05:48.279177+01	Active	Ahmed Bouraoui
1406	Employee	5 rue mohamed , sousse	2024-05-13 22:41:14.967186+01	mobile	najla@gmail.com	Najla	Software developer	Mahfouth	$2a$10$oVOW/J1u4PhOVBjFzh.BWOePEEyxDJxXuaUlt4CGKcBUUYFyaEA6W	55612478	2024-05-13 22:41:14.967186+01	Active	najla mahfouth
1452	Technician	22 rue khaled ben el walid	2024-05-16 21:36:33.254896+01	Security	kheliltasnime@gmail.com	Nawres	security	Berkaya	$2a$10$DBif0iB97ly5jY2ojyQMRu1OrWs/NttYoxpFtbbmxnUTS.OZCh/Y6	95561452	2024-05-19 20:27:56.361581+01	Active	nawres bekeya
1852	Employee	50 rue biaa,hammem sousse	2024-06-05 16:52:07.912245+01	Finance	aziz@gmail.com	Aziz	finance	Ben amor	$2a$10$4uxZywQGltYRkQI60OoCOeak1h1SOpn8h6OH9qiu6GOVQE0OvZQyy	99123456	2024-06-05 16:52:07.912245+01	Active	aziz ben amor
1302	Admin	22 rue boujafer madian , sousse	2024-05-02 10:38:25.235074+01	web	lobna@gmail.com	lobna	Manager	wardeni	$2a$10$gcGYe68lSX/sjjIGSgSSnur8yPkBy/Sroam38QaepUd7ie5fHHUra	52446702	2024-05-29 19:04:37.859385+01	Active	Lobna
1902	Employee	22 rue khaled ben el walid	2024-06-06 11:27:06.543027+01	web	imene.nasr@gmail.com	imen	it	nasr	$2a$10$5lNcXbkzlqLYj7BJ9SLtEeR/iHqC2oCBf3RXtps74Z.LsoW28vCTK	54439814	2024-06-06 11:29:59.544036+01	Active	imen
1802	Employee	rue yassmine 8070 klorba	2024-06-03 13:34:15.657047+01	Design	marassemkhelil@gmail.com	marassem	ui/ux	khelil	$2a$10$duwsHAxmp.krfT4snrrjJOKkO/0x/DGmcNMlQo5uJ./CmhmxEbzca	55461111	2024-06-11 11:39:48.495566+01	Active	marassem
1952	Employee	22 rue asafaa ben el walid	2024-06-11 11:54:03.891556+01	mobile	asma.benrekya@gmail.com	Betool	flutter dev	Bellamin	$2a$10$espDvqtyjCGtmzoMQpUbGutgSoz.CCQtzQFzGQSaBpF75/reWwn86	28052543	2024-06-11 11:54:03.891556+01	Active	Betool
\.


--
-- Data for Name: equipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipments (id, category, created_at, maintenance_status, manufactuer, model, name, price, quantity, state, type, updated_at, benefit_id, reservation_id, reservation_state, description, returned, taken) FROM stdin;
360	Equipments	2024-05-14 18:48:37.709092+01	under maintenance	APPLE	MK2K3ZA/A	iPad	1349	2	Enabled	Computer Equipments	2024-05-24 15:49:34.058677+01	1	\N	\N	\N	\N	\N
355	Equipments	2024-05-14 16:01:32.825917+01	operational	BENQ	MX536	vedio project	3000	5	Enabled	Production Equipments	2024-05-29 15:20:14.29347+01	1	\N	\N	\N	\N	\N
304	Equipments	2024-05-07 13:11:52.169266+01	operational	HP	AC89LaPtoP	pc hp	3000	10	Enabled	Computer Equipments	2024-05-29 15:20:27.149401+01	1	\N	\N	\N	\N	\N
302	Equipments	2024-05-07 13:11:11.588573+01	under maintenance	DELL	AC25PC46	pc dell	2500	5	Enabled	Computer Equipments	2024-05-19 20:47:08.684343+01	1	\N	\N	\N	\N	\N
357	Equipments	2024-05-14 18:44:07.030673+01	operational	HP	6D8G2AA	screen HP	349	2	Enabled	Computer Equipments	2024-05-29 15:20:45.647199+01	1	\N	\N	\N	\N	\N
404	Equipments	2024-05-27 09:14:30.161556+01	operational	LENOVO	82RK014XFG-8G	PC LENOVO	995	2	Enabled	Computer Equipments	2024-05-29 15:28:31.459728+01	1	\N	\N	\N	\N	\N
359	Equipments	2024-05-14 18:46:03.748566+01	operational	DELL	SE2222H-3Y	screen DELL	335	3	Enabled	Computer Equipments	2024-05-29 15:08:36.37609+01	1	\N	\N	\N	\N	\N
405	Equipments	2024-05-27 09:16:08.906682+01	operational	msi	 GF63-12UDX-214XFR-16G	msi PC	2759	1	Enabled	Computer Equipments	2024-05-29 15:08:47.754751+01	1	\N	\N	\N	\N	\N
306	Equipments	2024-05-07 13:14:27.342503+01	operational	CANON	BCANON15	Camera	3000	3	Enabled	Production Equipments	2024-05-30 08:59:56.035022+01	1	\N	\N	\N	\N	\N
407	Equipments	2024-05-27 09:19:35.26586+01	operational	msi	G244F-E2	screen msi	499	1	Enabled	Computer Equipments	2024-05-29 15:09:03.012252+01	1	\N	\N	\N	\N	\N
408	Equipments	2024-05-27 09:21:59.774284+01	operational	WACOM	CTL-4100K-S	graphic tablet	299	2	Enabled	Computer Equipments	2024-05-29 15:09:11.499048+01	1	\N	\N	\N	\N	\N
409	Equipments	2024-05-27 09:26:01.871209+01	operational	HAMA	 HDMI-1-5	cable HDMI	3	10	Enabled	Cables	2024-05-29 15:09:17.522434+01	1	\N	\N	\N	\N	\N
452	Equipments	2024-05-29 15:54:06.743751+01	damaged	APPLE	iMac5436	Mac	4500	0	Disabled	Computer Equipments	2024-06-05 16:53:30.365114+01	1	\N	\N	\N	\N	\N
410	Equipments	2024-05-27 09:27:13.389574+01	operational	HAMA	CAB-USB-5M	cable USB	8	10	Enabled	Computer Equipments	2024-05-29 15:09:24.107858+01	1	\N	\N	\N	\N	\N
502	Equipments	2024-06-05 16:56:51.430409+01	operational	VARR 	K9IOS	michrophone	49	0	Enabled	Audio Visuel	2024-06-05 16:56:51.430409+01	1	\N	\N	\N	\N	\N
503	Equipments	2024-06-05 16:59:33.763421+01	operational	JACK	CAB-JACK	audio cable	1	0	Enabled	Audio Visuel	2024-06-05 16:59:33.763421+01	1	\N	\N	\N	\N	\N
406	Equipments	2024-05-27 09:18:31.656458+01	operational	LENOVO	66F3GAC2EU	screen LENOVO	599	2	Enabled	Computer Equipments	2024-05-29 15:19:53.069241+01	1	\N	\N	\N	\N	\N
504	Equipments	2024-06-05 17:00:51.862233+01	operational	havit	H205D	HEADSET	20	0	Enabled	Audio Visuel	2024-06-05 17:00:51.862233+01	1	\N	\N	\N	\N	\N
505	Equipments	2024-06-05 17:04:41.195952+01	operational	Xiaomi	DVB4231GL	ROUTER	69	0	Enabled	Security Equipments	2024-06-05 17:04:41.195952+01	1	\N	\N	\N	\N	\N
506	Equipments	2024-06-05 17:05:40.508961+01	operational	Eaton	NETWORK-M2	NETWORK CARD	999	0	Enabled	Security Equipments	2024-06-05 17:05:40.508961+01	1	\N	\N	\N	\N	\N
507	Equipments	2024-06-05 17:07:12.217231+01	operational	SHARP	 BP-20C20T	MULTIFUNCTION PHOTOCOPIER	6299	0	Enabled	Production Equipments	2024-06-05 17:07:12.217231+01	1	\N	\N	\N	\N	\N
508	Equipments	2024-06-05 17:08:08.48092+01	operational	CANON	CS-LIDE-300	scanner	299	0	Enabled	Production Equipments	2024-06-05 17:08:08.48092+01	1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: notificationn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificationn (id, created_at, date_envoi, date_reception, heure, id_employee, message, receiver, statut_lecture, titre, type, updated_at) FROM stdin;
1	2024-05-19 19:37:31.206454+01	2024-05-19	\N	19:37:31	\N	Dear [Recipient's Name],\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:37:31.206454+01
2	2024-05-19 19:41:13.259621+01	2024-05-19	\N	19:41:13	\N	DearAsmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:41:13.259621+01
3	2024-05-19 19:49:25.409949+01	2024-05-19	\N	19:49:25	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:49:25.409949+01
4	2024-05-19 19:49:30.119619+01	2024-05-19	\N	19:49:30	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:49:30.119619+01
5	2024-05-19 19:51:16.928196+01	2024-05-19	\N	19:51:16	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:51:16.928196+01
6	2024-05-19 19:51:18.47241+01	2024-05-19	\N	19:51:18	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:51:18.47241+01
7	2024-05-19 19:59:29.527125+01	2024-05-19	\N	19:59:29	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-19 19:59:29.527125+01
10	2024-05-19 20:29:10.485068+01	2024-05-19	\N	20:29:10	\N	Dear nawres bekeya,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-19 20:29:10.485068+01
12	2024-05-19 20:35:47.60462+01	2024-05-19	\N	20:35:47	\N	Dear nawres bekeya,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-19 20:35:47.60462+01
52	2024-05-20 10:53:52.21992+01	2024-05-20	\N	10:53:52	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 10:53:52.21992+01
53	2024-05-20 10:54:57.007127+01	2024-05-20	\N	10:54:56	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 10:54:57.007127+01
54	2024-05-20 10:58:17.429646+01	2024-05-20	\N	10:58:17	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 10:58:17.429646+01
55	2024-05-20 11:08:56.976812+01	2024-05-20	\N	11:08:56	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 11:08:56.976812+01
56	2024-05-20 11:18:37.106103+01	2024-05-20	\N	11:18:37	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 11:18:37.106103+01
57	2024-05-20 11:27:30.742574+01	2024-05-20	\N	11:27:30	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 11:27:30.743578+01
58	2024-05-20 11:28:43.837132+01	2024-05-20	\N	11:28:43	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 11:28:43.837132+01
59	2024-05-20 11:32:47.027828+01	2024-05-20	\N	11:32:47	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:32:47.027828+01
60	2024-05-20 11:32:47.274697+01	2024-05-20	\N	11:32:47	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:32:47.274697+01
61	2024-05-20 11:32:49.816788+01	2024-05-20	\N	11:32:49	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:32:49.816788+01
62	2024-05-20 11:33:52.128686+01	2024-05-20	\N	11:33:52	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:33:52.128686+01
63	2024-05-20 11:33:52.226788+01	2024-05-20	\N	11:33:52	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:33:52.226788+01
64	2024-05-20 11:33:52.434421+01	2024-05-20	\N	11:33:52	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:33:52.434421+01
65	2024-05-20 11:34:56.076662+01	2024-05-20	\N	11:34:56	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:34:56.076662+01
66	2024-05-20 11:34:56.190216+01	2024-05-20	\N	11:34:56	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:34:56.190216+01
67	2024-05-20 11:34:56.19223+01	2024-05-20	\N	11:34:56	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:34:56.19223+01
68	2024-05-20 11:35:50.369955+01	2024-05-20	\N	11:35:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:35:50.369955+01
69	2024-05-20 11:35:50.44629+01	2024-05-20	\N	11:35:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:35:50.44629+01
70	2024-05-20 11:35:50.549552+01	2024-05-20	\N	11:35:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:35:50.549552+01
73	2024-05-20 11:36:53.34605+01	2024-05-20	\N	11:36:53	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:36:53.34605+01
79	2024-05-20 11:38:48.422721+01	2024-05-20	\N	11:38:48	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:38:48.422721+01
82	2024-05-20 11:39:50.789291+01	2024-05-20	\N	11:39:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:39:50.789291+01
83	2024-05-20 11:40:53.903224+01	2024-05-20	\N	11:40:53	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:40:53.903224+01
71	2024-05-20 11:36:52.84119+01	2024-05-20	\N	11:36:52	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:36:52.84119+01
76	2024-05-20 11:37:46.594973+01	2024-05-20	\N	11:37:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:37:46.594973+01
84	2024-05-20 11:40:53.903224+01	2024-05-20	\N	11:40:53	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:40:53.903224+01
88	2024-05-20 11:41:50.479824+01	2024-05-20	\N	11:41:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:41:50.479824+01
72	2024-05-20 11:36:53.221667+01	2024-05-20	\N	11:36:53	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:36:53.221667+01
74	2024-05-20 11:37:32.618252+01	2024-05-20	\N	11:37:32	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:37:32.618252+01
77	2024-05-20 11:38:34.32921+01	2024-05-20	\N	11:38:34	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:38:34.32921+01
78	2024-05-20 11:38:48.251695+01	2024-05-20	\N	11:38:48	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:38:48.251695+01
81	2024-05-20 11:39:50.789291+01	2024-05-20	\N	11:39:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:39:50.789291+01
86	2024-05-20 11:41:50.078102+01	2024-05-20	\N	11:41:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:41:50.078102+01
87	2024-05-20 11:41:50.223233+01	2024-05-20	\N	11:41:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:41:50.223233+01
75	2024-05-20 11:37:46.500863+01	2024-05-20	\N	11:37:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:37:46.500863+01
80	2024-05-20 11:39:50.530425+01	2024-05-20	\N	11:39:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:39:50.530425+01
85	2024-05-20 11:40:54.838812+01	2024-05-20	\N	11:40:54	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:40:54.838812+01
89	2024-05-20 11:49:45.841153+01	2024-05-20	\N	11:49:45	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:49:45.841153+01
90	2024-05-20 11:49:46.06529+01	2024-05-20	\N	11:49:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:49:46.06529+01
91	2024-05-20 11:49:46.151702+01	2024-05-20	\N	11:49:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:49:46.151702+01
92	2024-05-20 11:50:46.01783+01	2024-05-20	\N	11:50:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:50:46.01783+01
93	2024-05-20 11:50:46.11884+01	2024-05-20	\N	11:50:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:50:46.11884+01
94	2024-05-20 11:50:46.467598+01	2024-05-20	\N	11:50:46	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:50:46.467598+01
95	2024-05-20 11:52:21.2912+01	2024-05-20	\N	11:52:21	\N	Dear nawres bekeya,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-20 11:52:21.2912+01
96	2024-05-20 11:54:11.824107+01	2024-05-20	\N	11:54:11	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:54:11.824107+01
97	2024-05-20 11:55:12.280731+01	2024-05-20	\N	11:55:12	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 11:55:12.280731+01
98	2024-05-20 12:00:49.101108+01	2024-05-20	\N	12:00:49	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 12:00:49.101108+01
99	2024-05-20 12:01:48.749947+01	2024-05-20	\N	12:01:48	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 12:01:48.749947+01
100	2024-05-20 12:02:49.000975+01	2024-05-20	\N	12:02:48	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 12:02:49.000975+01
101	2024-05-20 12:03:50.537119+01	2024-05-20	\N	12:03:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 12:03:50.537119+01
102	2024-05-20 12:04:50.468123+01	2024-05-20	\N	12:04:50	\N	Dear nawres bekeya,\n This is a friendly reminder regarding your reservation  scheduled for [Departure Date] at [Departure Time]. \n Please ensure that you are ready for the pickup or usage of the equipment at the specified time.\n Best regards, \n Technicien	\N	\N	 Important Reminder Regarding Your Reservation !!!!!! 	Email	2024-05-20 12:04:50.468123+01
103	2024-05-20 12:19:19.210306+01	2024-05-20	\N	12:19:19	\N	Dear nawres bekeya,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-20 12:19:19.210306+01
104	2024-05-20 12:23:53.595709+01	2024-05-20	\N	12:23:53	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-20 12:23:53.595709+01
105	2024-05-20 12:34:41.457928+01	2024-05-20	\N	12:34:41	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-20 12:34:41.457928+01
106	2024-05-20 12:46:28.104424+01	2024-05-20	\N	12:46:28	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-20 12:46:28.104424+01
152	2024-05-21 15:27:28.569777+01	2024-05-21	\N	15:27:28	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-21 15:27:28.569777+01
153	2024-05-21 15:38:06.467483+01	2024-05-21	\N	15:38:06	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-21 15:38:06.467483+01
202	2024-05-23 21:17:41.637774+01	2024-05-23	\N	21:17:41	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-23 21:17:41.637774+01
252	2024-05-24 18:25:29.112523+01	2024-05-24	\N	18:25:29	\N	Dear nawres bekeya,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-24 18:25:29.112523+01
302	2024-05-24 21:27:51.754137+01	2024-05-24	\N	21:27:51	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-24 21:27:51.754137+01
303	2024-05-24 21:28:24.666059+01	2024-05-24	\N	21:28:24	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-24 21:28:24.666059+01
304	2024-05-24 23:17:25.845534+01	2024-05-24	\N	23:17:25	\N	Dear Lobna,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-24 23:17:25.846043+01
305	2024-05-24 23:18:18.201827+01	2024-05-24	\N	23:18:18	\N	Dear Lobna,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-24 23:18:18.201827+01
306	2024-05-24 23:32:48.322383+01	2024-05-24	\N	23:32:48	\N	Dear Lobna,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-24 23:32:48.322383+01
307	2024-05-24 23:33:38.399194+01	2024-05-24	\N	23:33:38	\N	Dear Lobna,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-24 23:33:38.399194+01
405	2024-05-28 10:42:57.452064+01	2024-05-28	\N	10:42:57	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 10:42:57.452064+01
406	2024-05-28 10:47:05.657952+01	2024-05-28	\N	10:47:05	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 10:47:05.657952+01
452	2024-05-28 10:51:30.160534+01	2024-05-28	\N	10:51:30	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 10:51:30.160534+01
453	2024-05-28 11:03:56.23113+01	2024-05-28	\N	11:03:56	\N	Dear nawres bekeya,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:03:56.23113+01
454	2024-05-28 11:05:45.168223+01	2024-05-28	\N	11:05:45	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:05:45.168223+01
455	2024-05-28 11:13:38.998499+01	2024-05-28	\N	11:13:38	\N	Dear Lobna,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 11:13:38.998499+01
456	2024-05-28 11:16:56.226419+01	2024-05-28	\N	11:16:56	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:16:56.226419+01
457	2024-05-28 11:18:27.406271+01	2024-05-28	\N	11:18:27	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:18:27.406271+01
458	2024-05-28 11:18:48.035142+01	2024-05-28	\N	11:18:48	\N	Dear Lobna,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 11:18:48.035142+01
459	2024-05-28 11:34:43.97594+01	2024-05-28	\N	11:34:43	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-28 11:34:43.97594+01
460	2024-05-28 11:39:21.215615+01	2024-05-28	\N	11:39:21	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:39:21.215615+01
461	2024-05-28 11:46:47.002399+01	2024-05-28	\N	11:46:46	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-28 11:46:47.002399+01
502	2024-05-29 16:54:22.855352+01	2024-05-29	\N	16:54:22	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 16:54:22.855352+01
503	2024-05-29 17:09:19.277998+01	2024-05-29	\N	17:09:19	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:09:19.277998+01
504	2024-05-29 17:14:01.618646+01	2024-05-29	\N	17:14:01	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:14:01.618646+01
505	2024-05-29 17:19:16.794159+01	2024-05-29	\N	17:19:16	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:19:16.794159+01
506	2024-05-29 17:20:24.560268+01	2024-05-29	\N	17:20:24	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:20:24.560268+01
507	2024-05-29 17:21:29.475692+01	2024-05-29	\N	17:21:29	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:21:29.475692+01
508	2024-05-29 17:30:32.89257+01	2024-05-29	\N	17:30:32	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:30:32.89257+01
509	2024-05-29 17:44:04.617686+01	2024-05-29	\N	17:44:04	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 17:44:04.617686+01
510	2024-05-29 18:04:33.545469+01	2024-05-29	\N	18:04:33	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 18:04:33.545469+01
511	2024-05-29 18:22:14.81568+01	2024-05-29	\N	18:22:14	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 18:22:14.81568+01
512	2024-05-29 22:18:40.479512+01	2024-05-29	\N	22:18:40	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-05-29 22:18:40.479512+01
517	2024-05-31 09:41:05.62248+01	2024-05-31	\N	09:41:05	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 09:41:05.62248+01
518	2024-05-31 10:24:12.529796+01	2024-05-31	\N	10:24:12	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 10:24:12.529796+01
519	2024-05-31 10:33:43.738116+01	2024-05-31	\N	10:33:43	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 10:33:43.738116+01
520	2024-05-31 11:13:02.149567+01	2024-05-31	\N	11:13:02	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 11:13:02.150073+01
521	2024-05-31 15:11:10.231853+01	2024-05-31	\N	15:11:10	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 15:11:10.231853+01
522	2024-05-31 17:03:16.916505+01	2024-05-31	\N	17:03:16	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 17:03:16.916505+01
523	2024-05-31 17:07:30.914837+01	2024-05-31	\N	17:07:30	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 17:07:30.914837+01
524	2024-05-31 20:38:21.860235+01	2024-05-31	\N	20:38:21	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 20:38:21.860235+01
525	2024-05-31 20:43:44.536931+01	2024-05-31	\N	20:43:44	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 20:43:44.536931+01
526	2024-05-31 20:45:58.373518+01	2024-05-31	\N	20:45:58	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-05-31 20:45:58.373518+01
527	2024-06-01 07:46:52.319653+01	2024-06-01	\N	07:46:52	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 07:46:52.319653+01
528	2024-06-01 08:24:19.460038+01	2024-06-01	\N	08:24:19	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 08:24:19.460038+01
529	2024-06-01 09:04:28.857146+01	2024-06-01	\N	09:04:28	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 09:04:28.857146+01
530	2024-06-01 09:14:09.469069+01	2024-06-01	\N	09:14:09	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 09:14:09.469069+01
531	2024-06-01 09:16:03.535214+01	2024-06-01	\N	09:16:03	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 09:16:03.535214+01
532	2024-06-01 09:21:42.477257+01	2024-06-01	\N	09:21:42	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 09:21:42.477257+01
533	2024-06-01 10:05:40.991287+01	2024-06-01	\N	10:05:40	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 10:05:40.991287+01
534	2024-06-01 11:05:07.628147+01	2024-06-01	\N	11:05:07	\N	Dear Asmouma,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-01 11:05:07.628147+01
552	2024-06-01 17:58:36.144731+01	2024-06-01	\N	17:58:36	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-01 17:58:36.144731+01
602	2024-06-03 09:01:05.642899+01	2024-06-03	\N	09:01:05	\N	Dear Asmouma,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-03 09:01:05.642899+01
652	2024-06-03 16:10:34.690521+01	2024-06-03	\N	16:10:34	\N	Dear Lobna,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-03 16:10:34.690521+01
653	2024-06-03 16:15:07.371046+01	2024-06-03	\N	16:15:07	\N	Dear Lobna,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-03 16:15:07.371046+01
661	2024-06-03 16:27:59.391691+01	2024-06-03	\N	16:27:59	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-03 16:27:59.391691+01
663	2024-06-03 16:32:43.979134+01	2024-06-03	\N	16:32:43	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-03 16:32:43.979134+01
664	2024-06-03 16:34:24.377099+01	2024-06-03	\N	16:34:24	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-03 16:34:24.377099+01
702	2024-06-04 16:41:50.815815+01	2024-06-04	\N	16:41:50	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-04 16:41:50.815815+01
752	2024-06-05 08:56:56.200829+01	2024-06-05	\N	08:56:56	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 08:56:56.200829+01
753	2024-06-05 09:17:26.963606+01	2024-06-05	\N	09:17:26	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 09:17:26.963606+01
754	2024-06-05 09:21:38.360907+01	2024-06-05	\N	09:21:38	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 09:21:38.360907+01
755	2024-06-05 13:48:12.288717+01	2024-06-05	\N	13:48:12	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-05 13:48:12.288717+01
756	2024-06-05 13:50:51.096661+01	2024-06-05	\N	13:50:51	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-05 13:50:51.096661+01
757	2024-06-05 13:52:58.830888+01	2024-06-05	\N	13:52:58	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-05 13:52:58.830888+01
771	2024-06-05 14:55:56.214257+01	2024-06-05	\N	14:55:56	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 14:55:56.214257+01
773	2024-06-05 15:00:10.875009+01	2024-06-05	\N	15:00:10	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 15:00:10.875009+01
775	2024-06-05 15:01:38.809922+01	2024-06-05	\N	15:01:38	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 15:01:38.809922+01
777	2024-06-05 15:03:46.639982+01	2024-06-05	\N	15:03:46	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-05 15:03:46.639982+01
779	2024-06-05 19:13:05.547822+01	2024-06-05	\N	19:13:05	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-05 19:13:05.547822+01
802	2024-06-06 10:21:43.850769+01	2024-06-06	\N	10:21:43	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-06 10:21:43.850769+01
806	2024-06-06 11:20:44.10803+01	2024-06-06	\N	11:20:44	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-06 11:20:44.10803+01
807	2024-06-06 11:22:06.774588+01	2024-06-06	\N	11:22:06	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-06 11:22:06.774588+01
852	2024-06-09 13:26:40.359666+01	2024-06-09	\N	13:26:40	\N	Dear marassem,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-09 13:26:40.359666+01
853	2024-06-09 13:29:36.312292+01	2024-06-09	\N	13:29:36	\N	Dear marassem,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-09 13:29:36.312292+01
902	2024-06-11 12:10:06.443554+01	2024-06-11	\N	12:10:06	\N	Dear Betool,\n Your reservation has been successfully made.\n However, it requires the administrator's approval.\n We will inform you as soon as the validation is complete.\nThank you for your understanding. \nBest regards,  \n Admin	\N	\N	reservation request	Email	2024-06-11 12:10:06.443554+01
903	2024-06-11 12:15:36.785677+01	2024-06-11	\N	12:15:36	\N	Dear Betool,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-11 12:15:36.785677+01
904	2024-06-11 12:16:24.85568+01	2024-06-11	\N	12:16:24	\N	Dear Betool,\n your Order Has Been Successfully Placed! \n Best regards, \n Admin	\N	\N	Reservation 	Email	2024-06-11 12:16:24.85568+01
\.


--
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_token (id, expiry_date, token, employee_id) FROM stdin;
1	2024-06-04 09:55:24.874022	b91efee8-c2b7-4c54-8f51-6e7b89463e50	1202
16	2024-06-10 13:09:49.001491	4dcd4b4e-7b6f-4b76-b62c-1ad6926568bf	1802
\.


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id, category, created_at, depart_date, depart_hour, equipments_id, name, return_hour, rooms_id, state, sub_category, updated_at, employee_id, username, equipments_status, rooms_status, benefit_status) FROM stdin;
1952	Equipments	2024-06-09 13:26:38.372239+01	10-06-2024	09:26	355	vedio project	10:26	\N	Reserved	Production Equipments	2024-06-11 12:31:46.888501+01	\N	marassem	\N	\N	returned
1853	Equipments	2024-06-05 22:24:09.898276+01	01-06-2024	14:00	505	ROUTER	15:00	0	Reserved	Security Equipments	2024-06-05 22:24:09.898276+01	\N	marassem	\N	\N	returned
1854	Equipments	2024-06-05 22:24:49.499216+01	01-05-2024	14:00	505	ROUTER	15:00	0	Reserved	Security Equipments	2024-06-05 22:24:49.499216+01	\N	marassem	\N	\N	returned
1855	Equipments	2024-06-05 22:24:59.068248+01	14-04-2024	14:00	505	ROUTER	15:00	0	Reserved	Security Equipments	2024-06-05 22:24:59.068248+01	\N	marassem	\N	\N	returned
1859	Equipments	2024-06-05 22:29:53.507639+01	15-05-2024	11:00	404	pc LENOVO	12:00	0	Cancelled	Computer Equipments	2024-06-05 22:29:53.507639+01	\N	marassem	\N	\N	returned
1861	Equipments	2024-06-05 22:31:42.421089+01	02-06-2024	08:00	357	screen HP	10:00	0	Reserved	Computer Equipments	2024-06-05 22:31:42.421089+01	\N	marassem	\N	\N	returned
1903	Equipments	2024-06-06 10:17:45.15625+01	06-07-2024	12:12	355	vedio project	13:59	\N	Reserved	Production Equipments	2024-06-06 10:17:45.15625+01	\N	marassem	\N	\N	default
2005	Equipments	2024-06-11 12:15:34.507261+01	11-06-2024	12:16	355	vedio project	13:15	\N	Reserved	Production Equipments	2024-06-11 12:43:34.339294+01	\N	Betool	\N	\N	returned
1817	Equipments	2024-06-05 17:25:59.699156+01	15-01-2024	15:24	355	vedio project	16:24	0	Reserved	Production Equipments	2024-06-05 17:25:59.699156+01	\N	Asmouma	\N	\N	returned
1818	Equipments	2024-06-05 17:27:11.329958+01	20-01-2024	15:24	355	vedio project	16:24	0	Reserved	Production Equipments	2024-06-05 17:27:11.329958+01	\N	Asmouma	\N	\N	returned
1819	Equipments	2024-06-05 17:27:25.56388+01	29-01-2024	15:24	355	vedio project	16:24	0	Reserved	Production Equipments	2024-06-05 17:27:25.56388+01	\N	Asmouma	\N	\N	returned
1822	Equipments	2024-06-05 17:32:10.554584+01	10-02-2024	10:15	302	pc dell	11:15	0	Reserved	Computer Equipments	2024-06-05 17:32:10.554584+01	\N	Fathi Mehrez	\N	\N	returned
1824	Equipments	2024-06-05 17:33:01.591465+01	24-03-2024	10:15	302	screen HP	11:15	0	Reserved	Computer Equipments	2024-06-05 17:33:01.591465+01	\N	Fathi Mehrez	\N	\N	returned
1826	Equipments	2024-06-05 17:36:38.81112+01	01-05-2024	10:15	405	Camera	11:15	0	Reserved	Production Equipments	2024-06-05 17:36:38.81112+01	\N	Houssem Wardeni	\N	\N	returned
1828	Equipments	2024-06-05 17:37:47.861654+01	22-02-2024	10:15	405	screen msi	11:15	0	Reserved	Computer Equipments	2024-06-05 17:37:47.861654+01	\N	nabil	\N	\N	returned
1830	Equipments	2024-06-05 17:39:26.532325+01	22-01-2024	10:15	405	graphic tablet	11:15	0	Reserved	Computer Equipments	2024-06-05 17:39:26.532325+01	\N	nabil	\N	\N	returned
1832	Equipments	2024-06-05 17:41:25.324442+01	02-04-2024	10:15	409	cable HDMI	11:15	0	Reserved	Cables	2024-06-05 17:41:25.324442+01	\N	nabil	\N	\N	returned
1834	Equipments	2024-06-05 17:42:37.793121+01	26-05-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 17:42:37.793121+01	\N	aziz ben amor	\N	\N	returned
1836	Equipments	2024-06-05 20:43:28.248219+01	01-06-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 20:43:28.248219+01	\N	aziz ben amor	\N	\N	returned
1837	Equipments	2024-06-05 20:43:34.780994+01	02-06-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 20:43:34.780994+01	\N	aziz ben amor	\N	\N	returned
1838	Equipments	2024-06-05 20:43:44.875947+01	03-06-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 20:43:44.875947+01	\N	aziz ben amor	\N	\N	returned
1856	Equipments	2024-06-05 22:26:28.578734+01	02-06-2024	11:00	406	screen LENOVO	12:00	0	Reserved	Computer Equipments	2024-06-05 22:26:28.578734+01	\N	marassem	\N	\N	returned
1860	Equipments	2024-06-05 22:30:49.646369+01	03-06-2024	08:00	404	pc LENOVO	12:00	0	Reserved	Computer Equipments	2024-06-05 22:30:49.646369+01	\N	marassem	\N	\N	returned
2002	Equipments	2024-06-11 12:07:19.169074+01	12-06-2024	09:06	304	pc hp	10:06	\N	Cancelled	Computer Equipments	2024-06-11 12:16:59.394569+01	\N	Betool	\N	\N	default
2006	Equipments	2024-06-11 12:16:21.942868+01	12-06-2024	12:16	355	vedio project	13:16	\N	Cancelled	Production Equipments	2024-06-11 12:17:39.979948+01	\N	Betool	\N	\N	default
1823	Equipments	2024-06-05 17:32:19.836615+01	24-02-2024	10:15	302	pc dell	11:15	0	Reserved	Computer Equipments	2024-06-05 17:32:19.836615+01	\N	Fathi Mehrez	\N	\N	returned
1825	Equipments	2024-06-05 17:33:25.66602+01	15-03-2024	10:15	302	screen HP	11:15	0	Reserved	Computer Equipments	2024-06-05 17:33:25.66602+01	\N	mazen	\N	\N	returned
1827	Equipments	2024-06-05 17:37:25.616556+01	22-02-2024	10:15	405	Camera	11:15	0	Reserved	Production Equipments	2024-06-05 17:37:25.616556+01	\N	Houssem Wardeni	\N	\N	returned
1829	Equipments	2024-06-05 17:39:15.831578+01	22-03-2024	10:15	405	graphic tablet	11:15	0	Reserved	Computer Equipments	2024-06-05 17:39:15.831578+01	\N	nabil	\N	\N	returned
1831	Equipments	2024-06-05 17:40:09.52535+01	22-04-2024	10:15	405	graphic tablet	11:15	0	Reserved	Computer Equipments	2024-06-05 17:40:09.52535+01	\N	nabil	\N	\N	returned
1833	Equipments	2024-06-05 17:42:15.561809+01	26-04-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 17:42:15.561809+01	\N	aziz ben amor	\N	\N	returned
1839	Equipments	2024-06-05 20:43:52.0501+01	04-06-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 20:43:52.0501+01	\N	aziz ben amor	\N	\N	returned
1840	Equipments	2024-06-05 20:43:57.244558+01	05-06-2024	10:15	410	cable USB	11:15	0	Reserved	Cables	2024-06-05 20:43:57.244558+01	\N	aziz ben amor	\N	\N	returned
1559	Rooms	2024-05-29 17:44:02.975959+01	01-06-2024	16:43	\N	Room A	17:43	454	Reserved	Eating Room	2024-06-01 11:31:05.492319+01	\N	Asmouma	\N	\N	free
1857	Equipments	2024-06-05 22:26:51.629009+01	02-06-2024	11:00	406	screen LENOVO	12:00	0	Cancelled	Computer Equipments	2024-06-05 22:26:51.629009+01	\N	marassem	\N	\N	returned
1905	Equipments	2024-06-06 11:20:40.670423+01	11-07-2024	11:23	355	vedio project	12:15	\N	Reserved	Production Equipments	2024-06-06 11:20:40.670423+01	\N	marassem	\N	\N	default
1703	Equipments	2024-06-03 16:15:03.276296+01	03-06-2024	16:15	357	screen HP	18:15	\N	Reserved	Computer Equipments	2024-06-03 16:22:27.474217+01	\N	Lobna	\N	\N	returned
1907	Rooms	2024-06-06 11:22:05.430614+01	06-06-2024	11:21	\N	RR.2	12:21	509	string	Reading Room	2024-06-09 13:16:19.608556+01	\N	marassem	\N	\N	free
2003	Equipments	2024-06-11 12:07:19.170092+01	12-06-2024	09:06	357	screen HP	10:06	\N	Reserved	Computer Equipments	2024-06-11 12:07:19.170092+01	\N	Betool	\N	\N	default
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, capacity, category, created_at, location, maintenance_status, name, state, type, updated_at, benefit_id, reservation_id, description, reservation_state, free, occupied) FROM stdin;
302	25	Rooms	2024-05-07 12:10:26.635437+01	technopole	under maintenance	Room A	Enabled	Meeting Room	2024-05-19 20:26:41.293159+01	2	\N	\N	\N	\N	\N
402	6	Rooms	2024-05-14 19:25:55.913785+01	first floor	under maintenance	Room E	Enabled	Reading Room	2024-05-19 20:33:59.339886+01	2	\N	\N	\N	\N	\N
453	5	Rooms	2024-05-27 09:29:42.105904+01	3rd floor	damaged	Room A	Disabled	Reading Room	2024-05-27 09:29:42.105904+01	2	\N	\N	\N	\N	\N
304	100	Rooms	2024-05-07 12:11:42.882563+01	technopole	damaged	Room B	Disabled	Conference Room	2024-05-29 16:03:27.624047+01	2	\N	\N	\N	\N	\N
502	15	Rooms	2024-06-05 17:15:54.058221+01	first floor	operational	MR.1	Enabled	Meeting Room	2024-06-05 17:15:54.058221+01	2	\N	\N	\N	\N	\N
503	100	Rooms	2024-06-05 17:16:27.063826+01	first floor	operational	CR.1	Enabled	Conference Room	2024-06-05 17:16:27.063826+01	2	\N	\N	\N	\N	\N
504	5	Rooms	2024-06-05 17:16:49.991475+01	first floor	operational	RR.1	Enabled	Reading Room	2024-06-05 17:16:49.991475+01	2	\N	\N	\N	\N	\N
505	10	Rooms	2024-06-05 17:17:09.00106+01	first floor	operational	ER.1	Enabled	Eating Room	2024-06-05 17:17:09.00106+01	2	\N	\N	\N	\N	\N
506	70	Rooms	2024-06-05 17:17:36.465153+01	technopole sousse	operational	Events 1	Enabled	Events	2024-06-05 17:17:36.465153+01	2	\N	\N	\N	\N	\N
507	20	Rooms	2024-06-05 17:17:57.17929+01	second floor	operational	MR.2	Enabled	Meeting Room	2024-06-05 17:17:57.17929+01	2	\N	\N	\N	\N	\N
508	80	Rooms	2024-06-05 17:18:16.251201+01	second floor	operational	CR.2	Enabled	Conference Room	2024-06-05 17:18:16.251201+01	2	\N	\N	\N	\N	\N
509	7	Rooms	2024-06-05 17:18:36.275091+01	second floor	operational	RR.2	Enabled	Reading Room	2024-06-05 17:18:36.275091+01	2	\N	\N	\N	\N	\N
510	15	Rooms	2024-06-05 17:18:53.12494+01	second floor	operational	ER.2	Enabled	Eating Room	2024-06-05 17:18:53.12494+01	2	\N	\N	\N	\N	\N
\.


--
-- Name: admin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_seq', 1, false);


--
-- Name: benefit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.benefit_seq', 51, true);


--
-- Name: chat_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_message_id_seq', 1, false);


--
-- Name: departemnt_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departemnt_seq', 1, true);


--
-- Name: department_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_seq', 51, true);


--
-- Name: employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_seq', 2001, true);


--
-- Name: equipments_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipments_seq', 551, true);


--
-- Name: notificationn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificationn_seq', 951, true);


--
-- Name: password_reset_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.password_reset_token_id_seq', 16, true);


--
-- Name: reservation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_seq', 2051, true);


--
-- Name: rooms_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_seq', 551, true);


--
-- Name: benefit benefit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.benefit
    ADD CONSTRAINT benefit_pkey PRIMARY KEY (id);


--
-- Name: chat_message chat_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT chat_message_pkey PRIMARY KEY (id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: equipments equipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT equipments_pkey PRIMARY KEY (id);


--
-- Name: notificationn notificationn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificationn
    ADD CONSTRAINT notificationn_pkey PRIMARY KEY (id);


--
-- Name: password_reset_token password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: password_reset_token uk_a8jiiv5mfdwn9tokd0an99kko; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT uk_a8jiiv5mfdwn9tokd0an99kko UNIQUE (employee_id);


--
-- Name: password_reset_token uk_g0guo4k8krgpwuagos61oc06j; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT uk_g0guo4k8krgpwuagos61oc06j UNIQUE (token);


--
-- Name: password_reset_token fk4phql1v77bvm6p8nxx1tva5qh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT fk4phql1v77bvm6p8nxx1tva5qh FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- Name: chat_message fk5thh9optfe70okfl1mu4uat79; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT fk5thh9optfe70okfl1mu4uat79 FOREIGN KEY (recipient_id) REFERENCES public.employee(id);


--
-- Name: rooms fk8h10rn3u8wojhciaefp3ci9u9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT fk8h10rn3u8wojhciaefp3ci9u9 FOREIGN KEY (benefit_id) REFERENCES public.benefit(id);


--
-- Name: equipments fka3tr84em6x3a9y3mtwk6deudx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT fka3tr84em6x3a9y3mtwk6deudx FOREIGN KEY (benefit_id) REFERENCES public.benefit(id);


--
-- Name: equipments fkb71fqsbtk8foccjwwmql498h4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipments
    ADD CONSTRAINT fkb71fqsbtk8foccjwwmql498h4 FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- Name: rooms fkf14ldjsv1ec8wnvtmneyg7ac3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT fkf14ldjsv1ec8wnvtmneyg7ac3 FOREIGN KEY (reservation_id) REFERENCES public.reservation(id);


--
-- Name: chat_message fktrj7rdl2pe9915jkmplqd1fvu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_message
    ADD CONSTRAINT fktrj7rdl2pe9915jkmplqd1fvu FOREIGN KEY (sender_id) REFERENCES public.employee(id);


--
-- PostgreSQL database dump complete
--

