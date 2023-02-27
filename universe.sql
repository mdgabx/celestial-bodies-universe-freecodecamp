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
    name character varying(60) NOT NULL,
    apparent_magnitude numeric(10,2) NOT NULL,
    distance_in_kpc integer,
    constellation character varying(60),
    notes text
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
    name character varying(60) NOT NULL,
    planet_id integer,
    diameter_in_km integer,
    orbital_radius_km integer,
    sidereal_period numeric(12,6),
    discovery_year integer,
    discovered_by character varying(30)
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
    name character varying(60) NOT NULL,
    star_id integer,
    mass numeric(12,6),
    radius numeric(12,6),
    semi_major_axis numeric(12,6),
    eccentricity numeric(12,6),
    discovery_year integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    has_ring boolean,
    is_dwarf boolean
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_info_id_seq OWNED BY public.planet_info.planet_info_id;


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
    name character varying(60) NOT NULL,
    galaxy_id integer,
    distance_in_light_year numeric(10,2),
    apparent_magnitude_v numeric(12,6),
    mass numeric(12,6)
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Large magellanuc cloud', 0.90, 49, 'Dorado/Mensa', 'brightest patch of nebulosity');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.50, 0, 'Sagittarius', 'Sun is located');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic cloud', 2.70, 61, 'Tucana', 'visible only on southern hemisphere');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 3.40, 770, 'Andromeda', 'Once called the great andromeda nebula');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5.70, 890, 'Triangulum', 'diffuse object');
INSERT INTO public.galaxy VALUES (6, 'Centaurus', 6.84, 4200, 'Centaurus', 'spotted by stephen james omeara');
INSERT INTO public.galaxy VALUES (7, 'Bode', 6.94, 37000, 'Ursa Major', 'Messier 81');
INSERT INTO public.galaxy VALUES (8, 'Sculptor', 7.20, 37000, 'Sculptor', 'NGC 253');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (8, 'Moon', 3, 1738, 384399, 27.321582, 0, '');
INSERT INTO public.moon VALUES (9, 'Phobos', 4, 11, 9380, 0.319000, 1877, 'Hall');
INSERT INTO public.moon VALUES (10, 'Deimos', 4, 6, 23460, 1.262000, 1877, 'Hall');
INSERT INTO public.moon VALUES (11, 'Io', 5, 1822, 421800, 1.769000, 1610, 'Galileo');
INSERT INTO public.moon VALUES (12, 'Amalthea', 5, 84, 181400, 0.498000, 1892, 'Barnard');
INSERT INTO public.moon VALUES (13, 'Himalia', 5, 70, 11461000, 250.560000, 1904, 'Perrine');
INSERT INTO public.moon VALUES (14, 'Elara', 5, 43, 11741000, 259.640000, 1905, 'Perrine');
INSERT INTO public.moon VALUES (15, 'Pasiphae', 5, 30, 23624000, 743.630000, 1908, 'Melotte');
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 198, 185540, 0.942000, 1789, 'Herschel');
INSERT INTO public.moon VALUES (17, 'Enceladus', 6, 252, 238040, 1.370000, 1789, 'Herschel');
INSERT INTO public.moon VALUES (18, 'Tethys', 6, 533, 294670, 1.888000, 1684, 'Cassini');
INSERT INTO public.moon VALUES (19, 'Rhea', 6, 764, 527070, 4.518000, 1672, 'Cassini');
INSERT INTO public.moon VALUES (20, 'Pandora', 6, 41, 141720, 0.629000, 1980, 'Collins');
INSERT INTO public.moon VALUES (21, 'Ariel', 7, 579, 190900, 2.520000, 1851, 'Lassell');
INSERT INTO public.moon VALUES (22, 'Umbriel', 7, 585, 266000, 4.144000, 1851, 'Lassell');
INSERT INTO public.moon VALUES (23, 'Titania', 7, 789, 436300, 8.706000, 1787, 'Herschel');
INSERT INTO public.moon VALUES (24, 'Oberon', 7, 761, 583500, 13.460000, 1787, 'Herschel');
INSERT INTO public.moon VALUES (25, 'Miranda', 7, 236, 129900, 1.413000, 1948, 'Kuiper');
INSERT INTO public.moon VALUES (26, 'Triton', 8, 1353, 354800, 5.877000, 1846, 'Lassell');
INSERT INTO public.moon VALUES (27, 'Nereid', 8, 170, 5513820, 360.140000, 1949, 'Kuiper');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'd', 1, 0.260000, 0.810000, 0.028550, 0.040000, 2022);
INSERT INTO public.planet VALUES (10, 'b', 1, 1.200000, NULL, 0.048600, 0.109000, 2016);
INSERT INTO public.planet VALUES (11, 'b', 14, 2.700000, NULL, 0.078900, 0.109000, 2019);
INSERT INTO public.planet VALUES (12, 'c', 14, 24.700000, NULL, 3.100000, 0.140000, 2021);
INSERT INTO public.planet VALUES (1, 'Mercury', 7, 3.285000, 2439.700000, 0.387000, 0.205600, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 7, 4.867000, 6051.800000, 0.738000, 0.006800, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 7, 5.987000, 6371.000000, 1.000000, 0.016700, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 7, 6.390000, 3389.500000, 1.524000, 0.093400, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 7, 1.898000, 69911.000000, 5.204000, 0.048900, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 7, 5.683000, 58232.000000, 9.583000, 0.056500, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 8.681000, 25362.000000, 19.180000, 0.045700, 1781);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, 1.024000, 24622.000000, 30.070000, 0.011300, 1846);


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, 1, 'Mercury', false, false);
INSERT INTO public.planet_info VALUES (2, 2, 'Venus', false, false);
INSERT INTO public.planet_info VALUES (3, 3, 'Earth', false, false);
INSERT INTO public.planet_info VALUES (4, 4, 'Mars', false, false);
INSERT INTO public.planet_info VALUES (5, 5, 'Jupiter', true, false);
INSERT INTO public.planet_info VALUES (6, 6, 'Saturn', true, false);
INSERT INTO public.planet_info VALUES (8, 8, 'Neptune', true, false);
INSERT INTO public.planet_info VALUES (7, 7, 'Uranus', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (14, 'Lalande 22185', 1, 8.30, 7.520000, 0.460000);
INSERT INTO public.star VALUES (15, 'Epsilon Eridani', 1, 10.49, 3.730000, 0.781000);
INSERT INTO public.star VALUES (16, 'Lacaille 9352', 1, 10.72, 7.340000, 0.489000);
INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 4.24, 11.130000, 0.123000);
INSERT INTO public.star VALUES (7, 'Sun', 1, 0.00, -26.700000, 1.000000);
INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 1, 4.36, 0.010000, 2.000000);
INSERT INTO public.star VALUES (3, 'Toliman', 1, 4.36, 1.330000, 0.900000);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 97.00, 2.060000, 2.300000);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 199.00, -1.760000, 2.490000);
INSERT INTO public.star VALUES (6, 'Almach', 2, 355.00, 2.270000, 23.700000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_info_id_seq', 8, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_constraint UNIQUE (name);


--
-- Name: planet_info planet_info_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_info_id_key UNIQUE (planet_info_id);


--
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


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
-- Name: moon unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

