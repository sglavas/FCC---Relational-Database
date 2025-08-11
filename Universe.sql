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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_date date
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth_ly integer
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
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_mkm numeric(7,3),
    discovery_date date,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moons_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    planet_types character varying(30),
    max_distance_from_earth_au numeric(5,3),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_ly numeric(11,7),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moons_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', '1801-01-01');
INSERT INTO public.asteroid VALUES (2, '4 Vesta', '1807-03-29');
INSERT INTO public.asteroid VALUES (3, '2 Pallas', '1802-03-28');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System.', 13600, 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Nearest spiral galaxy to the Milky Way.', 10000, 'Spiral', 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy in the Local Group.', 12000, 'Spiral', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular galaxy with a bright nucleus and large central bulge.', 13000, 'Lenticular', 29000000);
INSERT INTO public.galaxy VALUES (5, 'Whirrlpool Galaxy', 'A grand-design spiral galaxy with well-defined arms in the constellation Canes Venatici.', 400, 'Spiral', 23000000);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanica Cloud', 'A satellite galaxy of the Milky Way, visible from the Southern Hemisphere.', 11000, 'Irregular', 163000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s only natural satellite.', false, true, 4527, 0.384, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 'One of Jupiter''s moons, suspected to have subsurface ocean.', false, true, 4500, 628.000, '1610-01-08', 3);
INSERT INTO public.moon VALUES (3, 'Triton', 'Triton is the largest natural satellite of the planet Neptune.', false, true, 100, 4400.000, '1846-10-10', 4);
INSERT INTO public.moon VALUES (4, 'Phobos', 'One of Mars'' small moons.', false, true, 4500, 225.000, '1877-08-17', 2);
INSERT INTO public.moon VALUES (5, 'Titan', 'Largest moon of Saturn, has a thick atmosphere rich in nitrogen.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'Icy moon with geysers ejecting water vapor; possible subsurface ocean.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (7, 'Mimas', 'Small moon with a large crater called Herschel.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'Iapetus', 'Moon with striking two-tone coloration.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second-largest moon of Saturn, composed mainly of ice.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Icy moon with a massive canyon called Ithaca Chasma.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Dione', 'Icy moon with bright ice cliffs.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Hyperion', 'Irregularly shaped moon with a sponge-like appearance.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Phoebe', 'Retrograde moon, likely a captured object from the Kuiper Belt.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Pan', 'Tiny moon located within Saturn’s A ring.', NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'Largest moon of Uranus, composed of ice and rock..', NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Second-largest moon of Uranus, heavily cratered surface.', NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark, heavily cratered moon with mysterious bright ring.', NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Bright moon with fault canyons and valleys.', NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Small moon with extreme surface variation and cliffs.', NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Puck', 'Small, irregularly shaped moon of Uranus.', NULL, NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the Sun, home to humans.', true, true, 4540, 'Terrestrial', NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Fourth planet from the Sun, known as the Red Planet.', false, true, 4540, 'Terrestrial', 2.671, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the Solar System.', false, true, 4540, 'Gas Giant', 6.454, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 'Eighth planet from the Sun, ice giant.', false, true, 4540, 'Ice Giant', 31.317, 1);
INSERT INTO public.planet VALUES (5, 'Mercury', ' Smallest planet, closest to the Sun.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (6, 'Venus', ' Second planet from the Sun, hottest in the Solar System.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 'Sixth planet, famous for its ring system.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Seventh planet, tilted sideways, ice giant.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper Belt.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'Massive dwarf planet beyond Pluto.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (11, 'Ceres', 'Largest object in the asteroid belt.', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Elongated dwarf planet with fast rotation.', NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System.', true, 4600, 0.0000158, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', ' Closest known star to the Sun.', true, 4500, 4.2400000, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in the Orion constellation.', true, 8000, 642.5000000, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'Brightest star in the night sky, in the Canis Major constellation.', true, 242, 8.6000000, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Rigel A blue supergiant star in the constellation Orion.', true, 8, 863.0000000, 1);
INSERT INTO public.star VALUES (6, 'Mu Cephei', 'A red supergiant in Cepheus, known as the Garnet Star due to its deep red color', true, 20, 6000.0000000, 1);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moons_moon_id_seq', 20, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 14, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 6, true);


--
-- Name: asteroid asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


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
-- Name: moon moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_name_key UNIQUE (name);


--
-- Name: moon moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_name_key UNIQUE (name);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: moon moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

