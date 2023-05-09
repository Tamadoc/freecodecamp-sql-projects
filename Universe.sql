--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    zodiac_sign boolean NOT NULL,
    hemisphere text,
    main_stars integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    constellation_id integer,
    distance_mly numeric,
    galaxy_type text,
    designation text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    date_discovered integer,
    discovered_by text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type text NOT NULL,
    habitable_zone boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    class character(1) NOT NULL,
    distance_ly double precision,
    constellation_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', false, 'northern', 16);
INSERT INTO public.constellation VALUES (2, 'Aries', true, 'northern', 4);
INSERT INTO public.constellation VALUES (3, 'Canes Venatici', false, 'northern', 2);
INSERT INTO public.constellation VALUES (4, 'Canis Minor', false, 'northern', 2);
INSERT INTO public.constellation VALUES (5, 'Centaurus', false, 'southern', 11);
INSERT INTO public.constellation VALUES (6, 'Gemini', true, 'northern', 8);
INSERT INTO public.constellation VALUES (7, 'Lyra', false, 'equatorial', 5);
INSERT INTO public.constellation VALUES (8, 'Orion', false, 'equatorial', 7);
INSERT INTO public.constellation VALUES (9, 'Saggitarius', true, 'equatorial', 12);
INSERT INTO public.constellation VALUES (10, 'Sculptor', false, 'southern', 4);
INSERT INTO public.constellation VALUES (11, 'Ursa Major', false, 'northern', 7);
INSERT INTO public.constellation VALUES (12, 'Virgo', true, 'equatorial', 9);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (10, 'Milky Way', 9, NULL, 'spiral', '');
INSERT INTO public.galaxy VALUES (11, 'Andromeda', 1, 2.5, 'spiral', 'NGC 224');
INSERT INTO public.galaxy VALUES (12, 'Eye of Sauron', 3, 52, 'spiral', 'NGC 4151');
INSERT INTO public.galaxy VALUES (13, 'Sombrero', 12, 31, 'undetermined', 'NGC 4594');
INSERT INTO public.galaxy VALUES (14, 'Cartwheet', 10, 500, 'lenticular ring', 'ESO 350-40');
INSERT INTO public.galaxy VALUES (15, 'Cigar', 11, 12, 'irregular', 'NGC 3034');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', NULL, NULL);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 1877, 'Hall');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1877, 'Hall');
INSERT INTO public.moon VALUES (4, 5, 'Io', 1610, 'Gallileo');
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1610, 'Gallileo');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 1610, 'Gallileo');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 1610, 'Gallileo');
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 1789, 'Hershel');
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 1789, 'Hershel');
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 1684, 'Cassini');
INSERT INTO public.moon VALUES (11, 6, 'Dione', 1684, 'Cassini');
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 1672, 'Cassini');
INSERT INTO public.moon VALUES (13, 6, 'Titan', 1655, 'Huygens');
INSERT INTO public.moon VALUES (14, 4, 'Iapetus', 1671, 'Cassini');
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 1851, 'Lassell');
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 1851, 'Lassell');
INSERT INTO public.moon VALUES (17, 7, 'Titania', 1787, 'Hershel');
INSERT INTO public.moon VALUES (18, 7, 'Oberon', 1787, 'Hershel');
INSERT INTO public.moon VALUES (19, 7, 'Miranda', 1949, 'Kuiper');
INSERT INTO public.moon VALUES (20, 8, 'Triton', 1846, 'Lassell');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', false, 17);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', false, 17);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', true, 17);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', false, 17);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas-giant', false, 17);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas-giant', false, 17);
INSERT INTO public.planet VALUES (7, 'Uranus', 'gas-giant', false, 17);
INSERT INTO public.planet VALUES (8, 'Neptune', 'gas-giant', false, 17);
INSERT INTO public.planet VALUES (9, 'Luyten b', 'super-earth', true, 18);
INSERT INTO public.planet VALUES (10, 'Luyten c', 'terrestrial', false, 18);
INSERT INTO public.planet VALUES (11, 'Teegarden''s star b', 'terrestrial', true, 19);
INSERT INTO public.planet VALUES (12, 'Teegarden''s star c', 'terrestrial', true, 19);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 'terrestrial', true, 20);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri c', 'gas-dwarf', false, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (11, 10, 'Alnitak Aa', 'O', 745, 8);
INSERT INTO public.star VALUES (12, 10, 'Rigel', 'B', 860, 8);
INSERT INTO public.star VALUES (13, 10, 'Vega', 'A', 25, 7);
INSERT INTO public.star VALUES (14, 10, 'Procyon', 'F', 11.5, 4);
INSERT INTO public.star VALUES (15, 10, 'Pollux', 'K', 35, 6);
INSERT INTO public.star VALUES (16, 10, 'Betelgeuse', 'M', 550, 8);
INSERT INTO public.star VALUES (17, 10, 'Sol', 'G', 0, NULL);
INSERT INTO public.star VALUES (18, 10, 'Luyten', 'M', 12.3, 4);
INSERT INTO public.star VALUES (19, 10, 'Teegarden''s star', 'M', 12.5, 2);
INSERT INTO public.star VALUES (20, 10, 'Proxima Centauri', 'M', 4.24, 5);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 12, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 15, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
