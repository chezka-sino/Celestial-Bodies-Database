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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric NOT NULL,
    constellation character varying(30),
    diameter numeric
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
-- Name: missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.missions (
    missions_id integer NOT NULL,
    name character varying(30) NOT NULL,
    budget numeric,
    purpose character varying(30),
    is_launched boolean NOT NULL
);


ALTER TABLE public.missions OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.missions_mission_id_seq OWNED BY public.missions.missions_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    diameter numeric NOT NULL
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
    name character varying(30) NOT NULL,
    num_moons integer,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean,
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer,
    classification character varying(30) NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: missions missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions ALTER COLUMN missions_id SET DEFAULT nextval('public.missions_mission_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 'Sagittarius', 100000);
INSERT INTO public.galaxy VALUES (2, 'LMC', 158000, 'Dorado/Mensa', 14000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2500000, 'Andromeda', 220000);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 11500000, 'Ursa Major', 37000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 20870000, 'Ursa Major', 170000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 29350000, 'Virgo', 50000);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 30000000, 'Canes Venatici', 60000);
INSERT INTO public.galaxy VALUES (8, 'NGC 1300', 61000000, 'Eridanus', 110000);
INSERT INTO public.galaxy VALUES (9, 'Tadpole Galaxy', 420000000, 'Draco', 280000);
INSERT INTO public.galaxy VALUES (10, 'Hoags Object', 600000000, 'Serpens Caput', 100000);


--
-- Data for Name: missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.missions VALUES (1, 'Galileo 1', 5000000, 'ISS travel', false);
INSERT INTO public.missions VALUES (2, 'Apollo 69', 1000000000, 'Testing new rocket', true);
INSERT INTO public.missions VALUES (3, 'Syrinx 1', 420000000, 'Mars colonization', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 3, 3474.8);
INSERT INTO public.moon VALUES (2, 'Titan', true, 6, 5151.46);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4, 2.5);
INSERT INTO public.moon VALUES (4, 'Phobos', false, 4, 18);
INSERT INTO public.moon VALUES (5, 'Io', true, 5, 3643.2);
INSERT INTO public.moon VALUES (6, 'Europa', true, 5, 3121.6);
INSERT INTO public.moon VALUES (7, 'Ganymede', true, 5, 5268.2);
INSERT INTO public.moon VALUES (8, 'Callisto', true, 5, 4820.6);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 6, 504.2);
INSERT INTO public.moon VALUES (10, 'Atlas', false, 6, 30.2);
INSERT INTO public.moon VALUES (11, 'Epimetheus', false, 6, 116);
INSERT INTO public.moon VALUES (12, 'Helene', false, 6, 35.2);
INSERT INTO public.moon VALUES (13, 'Hyperion', false, 6, 270);
INSERT INTO public.moon VALUES (14, 'Janus', false, 6, 179);
INSERT INTO public.moon VALUES (15, 'Prometheus', false, 6, 86.2);
INSERT INTO public.moon VALUES (16, 'Ariel', true, 7, 1157.8);
INSERT INTO public.moon VALUES (17, 'Titania', true, 7, 1576.8);
INSERT INTO public.moon VALUES (18, 'Galatea', false, 8, 174.8);
INSERT INTO public.moon VALUES (19, 'Larissa', false, 8, 194);
INSERT INTO public.moon VALUES (20, 'Triton', false, 8, 2706.8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'Closest planet to sun', false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'Rocky', false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Third planet from Sun', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Terrestrial planet', false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 8, 'Largest planet in the Solar System', false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 'Gas giant', false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'Lacks a well-defined solid surface', false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'Densest giant planet', false, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 'Minor planet', false, true, 1);
INSERT INTO public.planet VALUES (10, 'Proxima d', 0, 'Part of Alpha Centauri triple star system', false, false, 4);
INSERT INTO public.planet VALUES (11, 'Proxima b', 0, 'Part of Alpha Centauri triple star system', false, false, 4);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 0, 'Close to a Venus-like worlds', false, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Antares', 15, 1, 'Red supergiant');
INSERT INTO public.star VALUES (2, 'Mira', 6000, 1, 'Red giant');
INSERT INTO public.star VALUES (3, 'WOH G64', 5, 2, 'Red supergiant');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4850, 1, 'Red dwarf');
INSERT INTO public.star VALUES (5, 'Tau Ceti', 5800, 1, 'Main sequence');
INSERT INTO public.star VALUES (6, 'Altair', 100, 1, 'Main sequence');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.missions_mission_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: missions missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT missions_pkey PRIMARY KEY (missions_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: missions unique_missions; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.missions
    ADD CONSTRAINT unique_missions UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

