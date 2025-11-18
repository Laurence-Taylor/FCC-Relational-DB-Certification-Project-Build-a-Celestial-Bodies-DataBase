--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    description text,
    type_of_galaxy_id integer NOT NULL,
    dist_from_earth_in_million_light_year numeric(10,2),
    is_sphericals boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    discovered_year integer,
    composition character varying(50)
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text,
    composition character varying(50),
    discovered_year integer,
    has_life boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    color character varying(50),
    age_in_million_of_year numeric(10,2)
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
-- Name: type_of_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_galaxy (
    type_of_galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.type_of_galaxy OWNER TO freecodecamp;

--
-- Name: type_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_galaxy_type_of_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_galaxy_type_of_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_galaxy_type_of_galaxy_id_seq OWNED BY public.type_of_galaxy.type_of_galaxy_id;


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
-- Name: type_of_galaxy type_of_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy ALTER COLUMN type_of_galaxy_id SET DEFAULT nextval('public.type_of_galaxy_type_of_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Giant sistem composed by millions of stars', 3, 0.00, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda I', 'it is a dwarf spheroidal galaxy', 4, 2.54, false);
INSERT INTO public.galaxy VALUES (3, 'Andromeda II', 'it is a dwarf spheroidal galaxy', 4, 2.22, false);
INSERT INTO public.galaxy VALUES (4, 'Hercules A', 'supergiant elliptical galaxy that is also an active radio galaxy', 1, 2000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Centauri A', 'also known as NGC 5128 or Caldwell 77', 1, 14.05, false);
INSERT INTO public.galaxy VALUES (6, 'GR8', 'a small, low-mass galaxy without a distinct shape', 5, 7.90, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth moon', 3, 'Earth moon', NULL, 'Solid');
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 'Almost an asteroid', 1877, 'Solid');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Almost an asteroid', 1877, 'Solid');
INSERT INTO public.moon VALUES (4, 'Europa', 5, 'Discovered by Galileo', 1610, 'Solid');
INSERT INTO public.moon VALUES (5, 'Io', 5, 'Discovered by Galileo', 1610, 'Solid');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 'Discovered by Galileo', 1610, 'Solid');
INSERT INTO public.moon VALUES (7, 'Amaltea', 5, 'Discovered by Galileo', 1610, 'Solid');
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, 'Discovered by Galileo', 1610, 'Solid');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 'Has water under the surface', 1655, 'Water and Ice');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Discovered by William Herschel', 1789, 'Solid');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Discovered by Giovanni Cassini', 1684, 'Solid');
INSERT INTO public.moon VALUES (12, 'Japeto', 6, 'Discovered by Giovanni Cassini', 1671, 'Solid');
INSERT INTO public.moon VALUES (13, 'Tetis', 6, 'Discovered by Giovanni Cassini', 1684, 'Solid');
INSERT INTO public.moon VALUES (14, 'Febe', 6, 'Discovered by Whilliam Henry', 1898, 'Solid');
INSERT INTO public.moon VALUES (15, 'Rea', 6, 'Discovered by Giovanni Cassini', 1672, 'Solid');
INSERT INTO public.moon VALUES (16, 'Triton', 8, 'Discovered by William Lassell', 1846, 'Solid');
INSERT INTO public.moon VALUES (17, 'Talasa', 8, 'Discovered by Richard Terrile', 1989, 'Solid');
INSERT INTO public.moon VALUES (18, 'Galatea', 8, 'Discovered by Stephen Synnott', 1989, 'Solid');
INSERT INTO public.moon VALUES (19, 'Despina', 8, 'Discovered by Stephen Synnott', 1989, 'Solid');
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 'Discovered by William Lassell', 1851, 'Solid');
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 'Discovered by William Lassell', 1851, 'Solid');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet and closest to the Sun', 'Rock', 1880, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Known for its very hot, rocky surface', 'Rock', 1600, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet, a terrestrial planet with abundant liquid water. ', 'Water and Rock', NULL, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Often called the "Red Planet" due to its iron-rich surface', 'Rock', -2000, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet, a gas giant with a powerful storm known as the Great Red Spot. ', 'Gas', 1610, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Famous for its prominent and extensive ring system', 'Gas', 1610, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'An ice giant that rotates on its side', 'Ice', 1781, false);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 'The farthest official planet from the Sun, an ice giant known for strong winds', 'Gas', 1846, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 1, 'This exoplanet has a mass comparable to Earth is and orbits Proxima Centauri within the habitable zone', 'Rock', 2016, false);
INSERT INTO public.planet VALUES (10, 'Proxima d', 1, 'This is the third planet in the system, a sub-Earth that orbits Proxima Centauri even closer than Proxima b', 'Rock', 2016, false);
INSERT INTO public.planet VALUES (11, 'Arkas', 1, 'Arkas is the official name for the exoplanet 41 Lyncis b (also known as HD 81688 b). A gas Giant.', 'Gas', 2008, false);
INSERT INTO public.planet VALUES (12, 'Amateru', 1, 'Amateru (Epsilon Tauri b): Named after the Japanese sun goddess Amaterasu', 'Gas', 2007, false);
INSERT INTO public.planet VALUES (13, 'Janssen', 1, 'A "super-Earth" that is hot enough to have a molten lava surface. It orbits its star so closely that it completes a full orbit in less than 18 hours.', 'Lava', 2020, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'masive sphereof hot plasma', 'white', 4603.55);
INSERT INTO public.star VALUES (2, 'Vega', 1, 'Is a very shiny star, is member of the summer triangle.', 'white-blue', 450.65);
INSERT INTO public.star VALUES (3, '55 Cabri B', 1, 'Is a distant red dwarf. Belong to 55 Cancri; a binary star system 41 light-years away in the constellation Cancer. His companion is a Sun-like K-type star (55 Cancri A).', 'red', 8100.00);
INSERT INTO public.star VALUES (4, '41 Lyncis', 1, '41 Lyncis, also known as Intercrus, is a K-type orange giant star located in the constellation Ursa Major', 'orange', 4070.00);
INSERT INTO public.star VALUES (5, 'Epsilon Tauri', 1, ' A (K-type) giant star named Epsilon Tauri. It has exhausted the hydrogen supply in its core and is currently fusing helium. ', 'orange', 625.00);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 'Proxima Centauri is overall activity level is considered low compared to other red dwarfs', 'red', 4853.00);


--
-- Data for Name: type_of_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_galaxy VALUES (1, 'Eliptical', 'are smooth, round or oval-shaped');
INSERT INTO public.type_of_galaxy VALUES (2, 'Spiral', 'characterized by a central bulge and flat, rotating disk with spiral arms');
INSERT INTO public.type_of_galaxy VALUES (3, 'Barred Spiral', 'a subtype of spiral with a bar-shaped structure across the central bulge');
INSERT INTO public.type_of_galaxy VALUES (4, 'Lenticular', 'an intermediate form between elliptical and spiral galaxies, possessing a central bulge and disk but no prominent spiral arms');
INSERT INTO public.type_of_galaxy VALUES (5, 'Irregular', 'lack any defined shape or structure');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: type_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_galaxy_type_of_galaxy_id_seq', 5, true);


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
-- Name: type_of_galaxy type_of_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT type_of_galaxy_name_key UNIQUE (name);


--
-- Name: type_of_galaxy type_of_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT type_of_galaxy_pkey PRIMARY KEY (type_of_galaxy_id);


--
-- Name: galaxy galaxy_type_of_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_of_galaxy_id_fkey FOREIGN KEY (type_of_galaxy_id) REFERENCES public.type_of_galaxy(type_of_galaxy_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

