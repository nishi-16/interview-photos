--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Debian 12.5-1.pgdg100+1)
-- Dumped by pg_dump version 12.5 (Debian 12.5-1.pgdg100+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    title character varying(256) NOT NULL
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO postgres;

--
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    photographer_id integer NOT NULL,
    collection_id integer NOT NULL,
    url character varying(256) NOT NULL,
    description character varying(1024) DEFAULT NULL::character varying,
    height integer NOT NULL,
    width integer NOT NULL
);


ALTER TABLE public.photo OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO postgres;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: photographer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photographer (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    location character varying(256) DEFAULT NULL::character varying,
    bio character varying(256) DEFAULT NULL::character varying,
    profile_image_url character varying(256) DEFAULT NULL::character varying,
    twitter_username character varying(256) DEFAULT NULL::character varying,
    instagram_username character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE public.photographer OWNER TO postgres;

--
-- Name: photographer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.photographer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photographer_id_seq OWNER TO postgres;

--
-- Name: photographer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.photographer_id_seq OWNED BY public.photographer.id;


--
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: photographer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photographer ALTER COLUMN id SET DEFAULT nextval('public.photographer_id_seq'::regclass);


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collection (id, title) FROM stdin;
1	Airplanes
2	Mountains
3	Basketball
4	Forest
5	Halloween
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photo (id, photographer_id, collection_id, url, description, height, width) FROM stdin;
1	1	1	https://images.unsplash.com/photo-1572725762981-e3efdec0b14c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MXwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	7360	4912
2	2	1	https://images.unsplash.com/photo-1571043490388-1f5623451671?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MnwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	instagram - @vadimsadovski	5807	3877
3	3	1	https://images.unsplash.com/photo-1570137682801-1134ee900488?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258M3wyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Gotta catch them all	3456	5184
4	4	1	https://images.unsplash.com/photo-1562587592-889f254ff71c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NHwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	5616	3744
5	5	1	https://images.unsplash.com/photo-1562504710-2621e0fee7a0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NXwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3943	5914
6	6	1	https://images.unsplash.com/photo-1560869428-998bb65bf280?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NnwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3024	4032
7	7	1	https://images.unsplash.com/photo-1558685160-140e422ea847?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258N3wyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3275	2620
8	4	1	https://images.unsplash.com/photo-1546615181-88748331ae69?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OHwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3744	5616
9	8	1	https://images.unsplash.com/photo-1546767829-761d1548f7ad?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OXwyNzE1OTczfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	5760	3840
10	9	1	https://images.unsplash.com/photo-1542753151-ce9f8deca38d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTB8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Landing into Charleston	4896	3264
11	10	1	https://images.unsplash.com/photo-1536554400154-e8f26c7b4da4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTF8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	4635	3085
12	11	1	https://images.unsplash.com/photo-1533198875924-6dabdc05c857?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTJ8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	6000	4000
13	12	1	https://images.unsplash.com/photo-1499063078284-f78f7d89616a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTN8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Airplane on a twilight sky	5000	4000
14	13	1	https://images.unsplash.com/photo-1514843295067-dc777a28a510?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTR8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	6000	4000
15	14	1	https://images.unsplash.com/photo-1517429128955-67ff5c1e29da?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTV8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Shot somewhere near Curacao	3724	5586
16	15	1	https://images.unsplash.com/photo-1519354360246-85416aa284d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTZ8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	over the horizon	3780	3024
17	16	1	https://images.unsplash.com/photo-1519666336592-e225a99dcd2f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTd8MjcxNTk3M3x8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	East to West	6024	4024
18	17	2	https://images.unsplash.com/photo-1492479077979-24aca2184f06?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MXwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	Decided to embark on a long over due trip to Yosemite National Park. Coming into the park the weather was slightly overcast and extremely foggy. There were some breaks in the fog and the views were breath taking until we came around the corner to this photo. All I could think is how lucky we are to live on such a planet. GOD has created such master pieces everywhere and I am so thankful to be able to absorb this all in and get a chance to show you all my creations.	3399	5260
19	18	2	https://images.unsplash.com/photo-1490584154387-0658b0cbfc18?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MnwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	Cloudy mountain scenery	4016	6016
20	19	2	https://images.unsplash.com/photo-1489769459544-1b2a788df7b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258M3wzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	hillside-cabin-and-crocus	2780	4170
21	20	2	https://images.unsplash.com/photo-1482203268343-fb7381d53041?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NHwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	3456	5184
22	20	2	https://images.unsplash.com/photo-1482203584556-e4c5890e2370?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NXwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	3456	5184
23	20	2	https://images.unsplash.com/photo-1483422166412-1d8a821cd97c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NnwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	I drove 5 hours from 1am to 6am to capture this mountain range in the morning light. I was able to get there before the sunrise and the snow on the mountains lit up for me. The sacrifice is always worth it	3456	5184
24	21	2	https://images.unsplash.com/photo-1486978665430-dc8c68e2dd60?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258N3wzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	Summer is coming. Soon.	3078	5472
25	22	2	https://images.unsplash.com/photo-1486998115004-2caf80306eee?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OHwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	the ridge	3242	5145
26	23	2	https://images.unsplash.com/photo-1487157739195-f6d521435b16?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OXwzMjM5MTd8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	You can never conquer the mountain. You can only conquer yourself. - Jim Whittaker	3840	5760
27	24	2	https://images.unsplash.com/photo-1486566584569-b9319dc74315?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTB8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	This coastline is part of a small island off the coast of Antarctica, seen from above on a special commercial flight operated by Antarctica Flights and Qantas.	2000	3000
28	25	2	https://images.unsplash.com/photo-1470104240373-bc1812eddc9f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTF8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	2560	3840
29	26	2	https://images.unsplash.com/photo-1486150518240-01eeb02db4f1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTJ8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	White Rowena	6000	4000
30	27	2	https://images.unsplash.com/photo-1486284847143-bfb9308a3f17?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTN8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Snowscape	2548	4076
31	28	2	https://images.unsplash.com/photo-1486108275492-35260a5d3318?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTR8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Steam in Iceland	2523	4485
32	28	2	https://images.unsplash.com/photo-1486106983022-e69f9fc7d930?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTV8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Mountains & volcano in Iceland	2242	3992
33	29	2	https://images.unsplash.com/photo-1485903266100-192c2e0af64f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTZ8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	I shot this image on my helicopter flight in Norway this January, 2017. It was my first ever helicopter ride and it was the moment of a lifetime, coming around the corner into this long and narrow fjord at sunrise. X Christiannkoepke.com	2295	3442
34	18	2	https://images.unsplash.com/photo-1479968071622-d0a39f8551be?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTd8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3667	5890
35	30	2	https://images.unsplash.com/photo-1481125783028-3650c763e383?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTh8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Dark Sky over Golden Hills	3662	5488
36	31	2	https://images.unsplash.com/photo-1485342264836-e3abdc17d99e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTl8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Lake near the mountains in Carezza	3240	5760
37	27	2	https://images.unsplash.com/photo-1484603738253-e5b73679e8cb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjB8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Snowscape	3420	5472
38	32	2	https://images.unsplash.com/photo-1481278403982-f2d9f387cdcc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjF8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	on the way to Corwatsch on a misty morning.	2560	3840
39	21	2	https://images.unsplash.com/photo-1480951786791-54a94c22bcd5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjJ8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Photography is all about timing. Even if that means spending 25 minutes, in the early morning, waiting for the right moment. My hot cup of tea actually became ice tea after that. Yeah, that cold.	3078	5472
40	18	2	https://images.unsplash.com/photo-1481433705997-f3c061a4eac8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjN8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	I had never been to this part of Colorado before. Leadville, Co. My dad went all the time for the fishing and this time I joined him. He was a stormy day which made for some slow driving and un-fun fishing. Made some amazing photos, though. \r\n\r\nI couldn’t get my eyes off the clouds.\r\n\r\nI still can’t.	3677	5534
41	33	2	https://images.unsplash.com/photo-1462834026679-7c03bf571a67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjR8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	2861	4338
42	34	2	https://images.unsplash.com/photo-1471201187657-6406da15e43b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjV8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Stars above low mountains	1822	1822
43	35	2	https://images.unsplash.com/photo-1477573893384-10fa704dfbd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjZ8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Eroded Icelandic mountain	3648	5472
44	18	2	https://images.unsplash.com/photo-1479968129048-7372423067cf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjd8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	I loved this perspective of the mountains through the trees. With how intense the orange was on the trees I had to snap a few shots with them in focus instead of the mountains to show off how crazy that orange was - think this did the trick.	3681	5514
45	26	2	https://images.unsplash.com/photo-1480910353825-384b0e8e7074?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjh8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Athabasca Glacier	4000	5000
46	26	2	https://images.unsplash.com/photo-1480825539190-bd9f89958a83?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjl8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Sunrise at Peyto Lake, Alberta	4000	5000
47	36	2	https://images.unsplash.com/photo-1480742051049-29e2effbf967?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MzB8MzIzOTE3fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Rocky Cliffs In Fog	4276	6414
48	37	3	https://images.unsplash.com/photo-1532040683343-edbde6dd500d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MXw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	The Last Throw	3264	4928
49	38	3	https://images.unsplash.com/photo-1580149959316-75e2487cfb06?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mnw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Lakers Kobe Bryant jersey #24\n\nPhoto taken by @charlesdeluvio	3354	5084
50	38	3	https://images.unsplash.com/photo-1580149959197-e48d1f587067?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258M3w5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Lakers Kobe Bryant jersey #24\n\nPhoto taken by @charlesdeluvio	3365	4830
51	39	3	https://images.unsplash.com/flagged/photo-1556554946-c10ef755bded?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NHw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3780	3024
52	40	3	https://images.unsplash.com/photo-1531593957238-4905df925830?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NXw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Street Basket Field	6000	4000
53	41	3	https://images.unsplash.com/photo-1518095361554-68367499ecc2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Nnw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Basketball Hoop	1984	2976
54	42	3	https://images.unsplash.com/photo-1519339859931-96ff5c81fbe6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258N3w5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Waiting for the next game	3059	2807
55	43	3	https://images.unsplash.com/photo-1551873733-6a228f676488?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OHw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	7952	5304
56	44	3	https://images.unsplash.com/photo-1527515047028-10b18ca90f24?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OXw5NDU0OTExfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Its not too late…	3024	4032
57	45	3	https://images.unsplash.com/photo-1540015605283-b24e303c7f6e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTB8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	hoops	3605	5407
58	46	3	https://images.unsplash.com/photo-1521413031099-02c8d240cf6d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTF8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Hoop	3621	5431
59	47	3	https://images.unsplash.com/photo-1554865587-cc3c9088b02f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTJ8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	6000	4000
60	48	3	https://images.unsplash.com/photo-1486882430381-e76d701e0a3e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTN8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Below an outdoor bball net	3456	5184
61	49	3	https://images.unsplash.com/photo-1542652694-40abf526446e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTR8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	4000	6000
62	50	3	https://images.unsplash.com/photo-1485395037613-e83d5c1f5290?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTV8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Palming a basketball	4480	6720
63	51	3	https://images.unsplash.com/photo-1552984418-66c1da2b165c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTZ8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	7360	4912
64	52	3	https://images.unsplash.com/photo-1576438162986-c685b1cfed7a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTd8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Frozen among the clouds	5183	3352
65	51	3	https://images.unsplash.com/photo-1552984418-e47d59632489?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTh8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	4912	5263
66	51	3	https://images.unsplash.com/photo-1552984418-b55abf780dd4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTl8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	4912	7360
67	53	3	https://images.unsplash.com/photo-1511903894668-b924c5275076?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjB8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	I challenged myself the other day to go out and shoot something with the first lens I ever bought: a plastic 50mm lens that cost me like $100. So I snapped it on my camera and headed up to the park down the street. The basketball court was empty and I loved the way the light was hitting the hoops, so I decided to shoot it. I’d say it was a successful challenge.	5115	3410
68	54	3	https://images.unsplash.com/photo-1575527733107-fab02cbf4365?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjF8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	3880	2884
69	42	3	https://images.unsplash.com/photo-1518479044931-404a93dcaf0d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjJ8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Rebound	2427	3236
70	55	3	https://images.unsplash.com/photo-1520116575045-14cd65689b7c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjN8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	5606	3737
71	56	3	https://images.unsplash.com/photo-1519163929887-93a63ded90ec?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjR8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	A well used basketball hoop.	3776	3021
72	46	3	https://images.unsplash.com/photo-1521412644187-c49fa049e84d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjV8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Basketball court	4695	3130
73	57	3	https://images.unsplash.com/photo-1503525523076-ca4aa2e47535?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjZ8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	4768	3456
74	58	3	https://images.unsplash.com/photo-1502736393269-6ca11b688701?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjd8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Basketball Heaven	3376	6000
75	59	3	https://images.unsplash.com/photo-1570512079787-24a9799b3500?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjh8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	6000	4000
76	60	3	https://images.unsplash.com/photo-1577416412292-747c6607f055?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjl8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	\N	2028	3042
77	61	3	https://images.unsplash.com/photo-1503474192634-c8391f8b9836?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MzB8OTQ1NDkxMXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Deserted Basketball Court	3264	4896
78	62	4	https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MXw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Instagram : @clvmentm\r\nFacebook Page : www.facebook.com/CMReflections/\r\n\r\nIf you wish to buy it in full quality, email me on clementmreflections@gmail.com.\r\n\r\nCopyright © 2018 by Clément M.\r\nAll rights reserved.	4608	3072
79	63	4	https://images.unsplash.com/photo-1490100667990-4fced8021649?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mnw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	After we got up and out of our van that morning we took a little hike uphill and were presented with this foggy view.	2000	3008
80	64	4	https://images.unsplash.com/photo-1503435980610-a51f3ddfee50?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258M3w5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Fade ↟	5760	3840
81	65	4	https://images.unsplash.com/photo-1564934947193-597fbd2b2f45?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NHw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Algonquin Provincial Park	4928	3264
82	66	4	https://images.unsplash.com/photo-1566097926635-c8551bdb25ca?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NXw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Bench in the Algonquin forest	6048	4024
83	67	4	https://images.unsplash.com/photo-1503049555010-f8616ee8f0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Nnw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Lake Braies	3391	6000
84	68	4	https://images.unsplash.com/photo-1513640172515-7f84431bb983?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258N3w5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3840	5760
85	69	4	https://images.unsplash.com/photo-1483354483454-4cd359948304?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OHw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	It was a gruelling climb up Y Garn (947m), North Wales in the dark this particular morning, with the objective of capturing the sunrise from the top. It was well worth the total exhaustion! As the sun rose higher we then headed over towards Glyder Fawr (1001m) to get better views across the Snowdonia mountain range. As we came over the ridge this was the view that confronted us. A stunning spectacle of light and shadows created my mist/haze over the mountain tops and valleys. Swapping the wide angle lens for a zoom lens enabled capturing of the full impact of the layered light.	2002	3000
86	70	4	https://images.unsplash.com/photo-1585790339217-ef3600f47e0b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OXw5ODI4MTUxfHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Please follow me on instagram! @chrishenry	5760	3840
87	70	4	https://images.unsplash.com/photo-1585790339287-bb03cb79b112?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTB8OTgyODE1MXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Please follow me on instagram! @chrishenry	4762	3810
88	71	4	https://images.unsplash.com/photo-1585928837575-64c2c505f5fb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTF8OTgyODE1MXx8fHx8Mnw&ixlib=rb-1.2.1&q=80&w=1080	Foggy forest scene	7903	5927
89	72	5	https://images.unsplash.com/photo-1519110437047-c6488cf2051d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MXwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	It was about 3 am, actually, I supposed to shoot a building CMACGM, but that flashes in the sea were much more interesting…	3456	4608
90	73	5	https://images.unsplash.com/photo-1509557965875-b88c97052f0e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MnwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	3264	4896
91	73	5	https://images.unsplash.com/photo-1509558273944-9ea880029528?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258M3wzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	3264	4896
92	73	5	https://images.unsplash.com/photo-1509558567730-6c838437b06b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NHwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	3264	4896
93	73	5	https://images.unsplash.com/photo-1509558741973-0cd2f6a12a4f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NXwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	\N	2445	4548
94	74	5	https://images.unsplash.com/photo-1539096567589-dbfe6d0beee2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258NnwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	Couldn’t resist #autumn	3854	2580
95	74	5	https://images.unsplash.com/photo-1539180074496-615a8ca8e34a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258N3wzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	October is here	1602	3790
96	74	5	https://images.unsplash.com/photo-1539180200417-097f7e1691bd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OHwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	Draculas Dentures & Asda Cupcakes	2564	3830
97	74	5	https://images.unsplash.com/photo-1539180349055-53475d495a03?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258OXwzOTU4ODh8fHx8fDJ8&ixlib=rb-1.2.1&q=80&w=1080	lives the dark, dark cakes.	3872	2592
98	74	5	https://images.unsplash.com/photo-1541017978248-d477a794977d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTB8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Hello(ween)	3909	2932
99	75	5	https://images.unsplash.com/photo-1541550612167-0c62a4410bb8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTF8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Green Smoked eyes and a halloween spirit!	2581	3872
100	75	5	https://images.unsplash.com/photo-1541550353839-95e417a9f95b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTJ8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Spooktober Shoot!	2581	3872
101	76	5	https://images.unsplash.com/photo-1540844251825-f369876ae9a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTN8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3712	2970
102	76	5	https://images.unsplash.com/photo-1540787213254-d478ebb91a0f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTR8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	4000	6000
103	77	5	https://images.unsplash.com/photo-1540593267750-76cd145d8724?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTV8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Little Witch	4016	6016
104	78	5	https://images.unsplash.com/photo-1540655035751-276003630321?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTZ8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	2782	3980
105	68	5	https://images.unsplash.com/photo-1540700736486-1f2ce7746098?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTd8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Halloween in LA	6720	4480
106	79	5	https://images.unsplash.com/photo-1540721113886-cefdcee899b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTh8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3840	5760
107	76	5	https://images.unsplash.com/photo-1540427969750-1424f2fa0af8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MTl8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	3750	3000
108	80	5	https://images.unsplash.com/photo-1540489216994-697e334d2d67?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjB8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Jack O’ Lantern	3796	3041
109	81	5	https://images.unsplash.com/photo-1540148468466-826bbea957b9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjF8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Hello Halloween!	3295	2471
110	82	5	https://images.unsplash.com/photo-1540048798093-9113aa07f7b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjJ8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Wait	3136	4735
111	83	5	https://images.unsplash.com/photo-1539887945737-159876ec8506?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjN8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	4928	3264
112	82	5	https://images.unsplash.com/photo-1540017840834-8571615789f2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjR8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Haunted forest	4928	3264
113	84	5	https://images.unsplash.com/photo-1539812278296-26c236ed98f4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjV8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	I was feeling some Halloween spirit in studio today after I found some of my old wax transfers of medical drawings! The diagrams are from the Grey’s Anatomy medical book. Happy Halloween!	6144	8192
114	85	5	https://images.unsplash.com/photo-1539798259720-60425272c02e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MjZ8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	4000	6000
115	84	5	https://images.unsplash.com/photo-1539814858141-928517f6afd3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjd8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	I was feeling some Halloween spirit in studio today after I found some of my old wax transfers of medical drawings! The diagrams are from the Grey’s Anatomy medical book. Happy Halloween!	6144	8192
116	86	5	https://images.unsplash.com/photo-1539635148172-3188f6fa2365?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjh8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	6240	4160
117	87	5	https://images.unsplash.com/photo-1539656339901-4fb2fe26688e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258Mjl8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	Pumpkin Huntin’	4000	6000
118	86	5	https://images.unsplash.com/photo-1539635239382-e10b1b230143?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk5MjZ8MHwxfGNvbGxlY3Rpb258MzB8Mzk1ODg4fHx8fHwyfA&ixlib=rb-1.2.1&q=80&w=1080	\N	4160	6240
\.


--
-- Data for Name: photographer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.photographer (id, name, location, bio, profile_image_url, twitter_username, instagram_username) FROM stdin;
1	Rayyu Maldives photographer	rayyu maldives photograper	Hi, my name is Ibrahim Rayyan (Rayyu) A freelance photographer based in the beatiful Maldives. I create Photos for the Hospitality, Travel Industry & Editorial.	\N	Rayyumaldives 	rayyumaldives 
2	Vadim Sadovski	Belarus	Vadimsadovski@gmail.com\r\n	\N	\N	vadimsadovski
3	Miltiadis Fragkidis	London, U.K	Music Producer and I take pictures sometimes\r\nInstagram: @_miltiadis_	\N	MiltosInvests	_miltiadis_
4	Charles Postiaux	France	📍Reims, France | 📷 Canon 5D MarkII⠀⠀⠀⠀⠀⠀⠀⠀⠀\r\nFollow me at taplink.cc/charlespostiaux	\N	charlpost	charlespostiaux
5	Michael Baccin	Venice (Italy)	I'm a Creative based in Venice Italy. Working on Websites during the week, Photography and Videomaker on the weekends.	\N	\N	michaelbaccin
6	Jan Antonin Kolar	Munich	\N	\N	jankolario	jankolario
7	Benjamin Suter	Chicago, IL	Benjamin is an urban, lifestyle photographer living in Chicago who loves to incorporate storytelling into his photos. His willingness to always learn and adapt within the creative industry comes out in his ability to capture the story in the moment.	\N	benjaminsuter	benjaminjsuter
8	Bertrand Bouchez	Andernos Les Bains, France	We make films and this is our portfolio : \r\nhttps://vimeo.com/studiodolly\r\n	\N	\N	https://www.instagram.com/dollyfilms/?hl=fr
9	Yohei Shimomae	Vancouver, BC	UX Designer at Adobe. Most photos taken with Fujifilm x100s and X-T2. Instagram @yoheishimomae	\N	yoheis	yoheishimomae
10	Al Soot	Japan	Photosensitive images.	\N	\N	\N
11	Adrien Olichon	France	French, 22. Web Student. Passionate about Design. \r\npaypal.me/aolichon	\N	adrien_lch	adrien.lch
12	Leio McLaren (leiomclaren.com)	Australia	👋👋\r\nwebsite: leiomclaren.com, instagram: @leiomclaren 	\N	leiomclaren	leiomclaren
13	Dan Gold	New York City	Brooklyn.	\N	danielcgold	danielcgold
14	Emiel Molenaar	\N	\N	\N	\N	\N
15	Leonardo Yip	Hong Kong	Available for work and any projects: leonardoyip.business@gmail.com	\N	\N	yipleonardo
16	Simon Maage	Germany	photographer // student of theology\r\n📍Gießen, Germany  - - - shooting analog and digital - - -   Instagram: @simon.maage	\N	maagic8	simon.maage
17	David  Joyce	Oregon/kauai	What's up everyone,\r\n Always grateful for the love and usage of my images. My goal is to give back and inspire!  Please reach out to me if you ever use my images, id like to connect with you!  check out my instagram @davidallanjoyce	\N	808djoyce	davidallanjoyce
18	Nathan Anderson	Knoxville, TN	\N	\N	kunack.us	kunack.us
19	Dawid Zawiła	Poland	\N	\N	\N	dawidzawilafotografia
20	Jeremy Bishop	California	I love supporting and inspiring creatives around the world.\r\nMy passion is the ocean and water photography, and I am striving to make an impact to save our Oceans and our Reefs!   https://www.paypal.com/paypalme/JeremyBishopPhoto 	\N	\N	bluumind
21	Paul Gilmore	Innsbruck, Austria	Visual Designer by day and content creator (photography, film and music) by night. Born and bred Greek, living in Austria. If you'd consider supporting my creativity, click the link above.	\N	paulgilmore1981	paul_gilmore
22	Philipp Schlabs	\N	\N	\N	\N	phil_bill
23	Christopher Burns	\N	London // Sydney \r\n	\N	\N	christopher__burns
24	Matt Palmer	Victoria, Australia	Photographer, Traveler, Presenter   /   Email: hello@mattpalmer.co   /   http://mattpalmer.co	\N	\N	mattpalmerphoto
25	Samuel Ferrara	Lugano, Switzerland	No matter where beauty exists – that’s where I want to go. I use still images and timelapses to tell stories. I’ve spent time in New Zealand, the United States, and now permanently settled in Ticino, Switzerland with my wife and daughter.	\N	samferrarach	samuelferrara
26	adrian	USA and Spain	Shooting B&W with a medium format film camera, and color with a digital camera.	\N	aows	aows
27	Michael Hacker	Austria	\N	\N	\N	\N
28	Atle Mo	Norway	Designer at @vivaldibrowser - Founder of subtlepatterns.com (2011 - 2016)  – Father and husband – @hyperoslo alumni.	\N	atlemo	atlemo
29	Christiann Koepke	portland OR	LET'S CONNECT!  @christiannkoepke / Christiannk.com / TheNORRAgency.com || Portland Oregon based Creative Director, Photographer, Recipe Curator || Partnerships with new or legacy brands in the social, print, and event space is my specialty.	\N	ChristiannKoepk	christiannkoepke
30	Stephen Pedersen	\N	\N	\N	\N	stephencpedersen
31	Cem Sagisman	\N	\N	\N	\N	cems77
32	mike  dennler	Japan 	Early on, I was fascinated in travel and photography. On my backpacking trips all around the world I became even more passionate about taking pictures of the natural beauty that surrounded me.	\N	redjunction	howlingred
33	Zach Taiji	Seattle, WA	Publicist, Graphic Designer and Photographer with love for the Pacific Northwest.	\N	azntaiji	azntaiji
34	averie woodard	Denton, Texas	\N	\N	\N	averieclaire
35	Jon Flobrant	Kalmar 	35 y/o, Stockholm, Sweden. \r\nCamera happy content creator \r\nInstagram: @jon.fl  \r\nOpen for business.	\N	Jonflobrant	jon.fl
36	Anubhav Saxena	\N	\N	\N	\N	\N
37	Ramiro Pianarosa	Argentina	Buenos Aires based photographer	\N	\N	rpianarosa
38	Olivier Collet	Montreal, Canada	Sometimes I take pictures.\r\nI make apps at Unsplash.	\N	ocollet	ocollet
39	Andrei Shiptenko	\N	\N	\N	\N	bro_andy
40	Fulvio Ambrosanio	Italy, Naples	\N	\N	\N	fiercelupus
41	Steve Johnson	Valparaiso Indiana USA	Subscribe to my Patreon for exclusive high resolution images.\r\nInstagram: https://www.instagram.com/artbystevej/\r\n\r\n	\N	artbystevej1	artbystevej
42	Joshua Hoehne	Cache Valley Utah	I like to create and help others create.  I'd love to hear what you are creating.  If you'd like to support me, you can also consider a donation: paypal.me/mrtheTrain | www.instagram.com/mr_theTrain	\N	mrtheTrain	mr_theTrain
43	Nelson Ndongala	Munich	https://whodunelson.de/	\N	whodunelson	whodunelson
44	Guilherme Alvares	\N	\N	\N	\N	\N
45	Vince Fleming	Socal	I just want You, nothing else will do.	\N	\N	vince.fleming
46	tommy boudreau	Boston, MA	I'm a professional fashion and footwear photographer. I also like landscapes and flying drones 🗻	\N	\N	lenswithbenefits
47	Arm Bunlue	\N	\N	\N	\N	\N
48	MontyLov	\N	Stay humble and innovate.	\N	MontyLov	montylov
49	Abhishek Chandra	\N	\N	\N	\N	iam_nobody_00
50	chelsea ferenando	tampa florida	\N	\N	\N	chelseafotos1
51	Taylor Smith	Santa Monica, Ca	Photographer + Director \r\n	\N	taylorsmithwho	whoistaylorsmith
52	Danny Lines	\N	22 year old amateur photographer from the UK.\r\nSeeing where a camera, some free time & broken laptop can take me. If you want to help support me, prints are available for some images just get in touch. 	\N	Danny_F_Lines	ReflectedLines
53	Andy Abelein	Riverside, CA	hope-filled idealist maker.	\N	aabelein	andyabelein
54	Howie Mapson	San Francisco	Urban wanderer and wannabe world traveler. 	\N	\N	howiehowei
55	Tyler Nix	Los Angeles, CA	Wedding, lifestyle and branding photographer. Based in Los Angeles, California.	\N	\N	jtylernix
56	Mitch Geiser	\N	\N	\N	\N	\N
57	Ryan Graybill	\N	\N	\N	Graybill___	Graybill_
58	JC Dela Cuesta	Los Angeles, CA	Designer + Photographer	\N	jdelacuesta	\N
59	Eddy Lee	\N	\N	\N	\N	\N
60	LOGAN WEAVER	denver, co	without art, war \r\n📲 Instagram @Lgnwvr 📬INQUIRIES - LOGAN@LGNWVR.COM    	\N	Lgnwvr	Lgnwvr
61	Timo Wagner	Munich	Creative Director.	\N	timovaknar	timovaknar
62	Clément M.	Lyon, France	I’m a french photographer and a visual creator based on France.\r\n	\N	clvment	clvmentm
63	Tobias Tullius	Leipzig, Germany	Founder of hammock company we-hang.com and an avid explorer of all things outdoor. 	\N	jomatotu	tobiastu
64	Filip Zrnzević	Belgrade, Serbia	UX / Product Designer. Travel & Landscape Photographer from Belgrade. 🌲❄️☀️\r\nHelping community, up and coming artists, and start-ups get good photos. Available for Freelance.	\N	filipz	filipz__
65	Ariana Kaminski	\N	\N	\N	\N	thegreatwildernessphotography
66	Brian Marco	Toronto	\N	\N	\N	\N
67	Ales Krivec	Slovenia	Donations: http://paypal.me/dreamypixel\r\n Any amount much appreciated. :) Thank you.	\N	Dreamy_Pixel	dreamypixels
68	Nathan Dumlao	Los Angeles	Brand Consultant and Content Creator living in Los Angeles. Working with brands and companies looking to tell engaging stories with beautiful images and video.	\N	Nate_Dumlao	nate_dumlao
69	Paul Earle	England	Capturing those special moments around us that can so often go unseen or unnoticed.	\N	\N	paulearlephotography
70	Chris Henry	\N	All I ask is that you follow me on Instagram! @chrishenry	\N	\N	chrishenry
71	Annie Spratt	New Forest National Park, UK	Hobbyist photographer from England, sharing my digital and film photos along with vintage slide scans.  \r\nClick the 'Collections' tab below to view my images in handy folders 💛 https://www.paypal.me/anniesprattphotos	\N	anniespratt	anniespratt
72	Artur Aldyrkhanov	Marseille, France	[ Stop managing your time. Start managing your focus. ]	\N	ArturCold	\N
73	NeONBRAND	317 S 6th St, Las Vegas, NV 89101	The finest digital marketing company in Viva Las Vegas.	\N	NeONBRAND	neonbrand
74	Hello I'm Nik 🎞	Somerset, UK	Unsplash Submissions Team / Freelance Designer at helloimnik.co.uk. If you like my work and you'd like to support me, you can also consider a donation > http://www.paypal.me/helloimnik. Thank you 😌	\N	HelloNikDesign	\N
75	Colton Sturgeon	Kansas City	Photographer & Filmmaker Colton Sturgeon.\r\nYou can check me out on instagram @coltophoto or @ColtonSturgeon	\N	colt sturgeon	coltophoto
76	Daniel Lincoln	Detroit, MI	Coffee and Create.\r\nFollow my IG for more content. @danny.lincoln	\N	Lincoln_Danny	danny.lincoln
77	Paige Cody	\N	If you like my work, feel free to follow me on Instagram <3	\N	\N	Paige.marie.cody
78	Jon Tyson	New York City	My cup overflows. \r\nwww.fathers.co \r\nwww.church.nyc	\N	jontyson	jontyson
79	Makarios Tang	Singapore	Bringing the unseen to light	\N	makarios_tang	makarios.tang
80	Mark Rall	Melbourne, Australia	Melbourne-based digital product manager with a creative streak and passion for evolving the craft, product design and photography.	\N	productbymark	productbymark
81	Meriç Dağlı	Bangalore, India	Designer at LinkedIn. Previously at Carnegie Mellon University, Carbon Health, and ODTÜ/METU.	\N	mericda	mericda
82	Lucas Ludwig	wisconsin	Crazy world, lots of smells	\N	\N	Lucas_Lud14
83	Libby Penner	Brugge, Belgium	Taker of photos, drinker of coffee\r\n📍Brugge, Belgium\r\n📸 IG: @libby_penner	\N	\N	libby_penner
84	Joyce McCown	STL, MO	"Which of my photographs is my favorite? The one I'm going to take tomorrow."\r\n- Imogen Cunningham	\N	\N	moonshadowpress
85	Donna G	Toronto, ON	Not all who wander are lost.	\N	\N	littlebearhugs
86	Daniel Tomlinson	\N	\N	\N	\N	thedanieltomlinson
87	Blake Wendt	\N	\N	\N	\N	\N
\.


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_id_seq', 5, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photo_id_seq', 118, true);


--
-- Name: photographer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.photographer_id_seq', 87, true);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photographer photographer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photographer
    ADD CONSTRAINT photographer_pkey PRIMARY KEY (id);


--
-- Name: photo photo_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collection(id);


--
-- Name: photo photo_photographer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_photographer_id_fkey FOREIGN KEY (photographer_id) REFERENCES public.photographer(id);


--
-- PostgreSQL database dump complete
--

