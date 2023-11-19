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
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    street text NOT NULL,
    zip text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE addresses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.addresses IS 'Addresses for manufacturers';


--
-- Name: COLUMN addresses.street; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.addresses.street IS 'Street part of the address';


--
-- Name: COLUMN addresses.zip; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.addresses.zip IS 'Postal or zip code of this address';


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: manufacturers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.manufacturers (
    id bigint NOT NULL,
    name text NOT NULL,
    address_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE manufacturers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.manufacturers IS 'Makers of the widgets we sell';


--
-- Name: COLUMN manufacturers.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.manufacturers.name IS 'Name of this manufacturer';


--
-- Name: COLUMN manufacturers.address_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.manufacturers.address_id IS 'The address of this manufacturer';


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.manufacturers_id_seq OWNED BY public.manufacturers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: widget_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.widget_statuses (
    id bigint NOT NULL,
    name text NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


--
-- Name: TABLE widget_statuses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.widget_statuses IS 'List of definitive widget statuses';


--
-- Name: COLUMN widget_statuses.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.widget_statuses.name IS 'The name of the status';


--
-- Name: widget_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.widget_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: widget_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.widget_statuses_id_seq OWNED BY public.widget_statuses.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.widgets (
    id bigint NOT NULL,
    name text NOT NULL,
    price_cents integer NOT NULL,
    widget_status_id bigint NOT NULL,
    manufacturer_id bigint NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL,
    CONSTRAINT price_must_be_positive CHECK ((price_cents > 0))
);


--
-- Name: TABLE widgets; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.widgets IS 'The stuff we sell';


--
-- Name: COLUMN widgets.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.widgets.name IS 'Name of this widget';


--
-- Name: COLUMN widgets.price_cents; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.widgets.price_cents IS 'Price of this widget in cents';


--
-- Name: COLUMN widgets.widget_status_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.widgets.widget_status_id IS 'The current status of this widget';


--
-- Name: COLUMN widgets.manufacturer_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.widgets.manufacturer_id IS 'The maker of this widget';


--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.widgets_id_seq OWNED BY public.widgets.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers ALTER COLUMN id SET DEFAULT nextval('public.manufacturers_id_seq'::regclass);


--
-- Name: widget_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widget_statuses ALTER COLUMN id SET DEFAULT nextval('public.widget_statuses_id_seq'::regclass);


--
-- Name: widgets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widgets ALTER COLUMN id SET DEFAULT nextval('public.widgets_id_seq'::regclass);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: widget_statuses widget_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widget_statuses
    ADD CONSTRAINT widget_statuses_pkey PRIMARY KEY (id);


--
-- Name: widgets widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: index_manufacturers_on_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_manufacturers_on_address_id ON public.manufacturers USING btree (address_id);


--
-- Name: index_manufacturers_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_manufacturers_on_name ON public.manufacturers USING btree (name);


--
-- Name: index_widget_statuses_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_widget_statuses_on_name ON public.widget_statuses USING btree (name);


--
-- Name: INDEX index_widget_statuses_on_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_widget_statuses_on_name IS 'No two widget statuses should have the same name';


--
-- Name: index_widgets_on_manufacturer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_widgets_on_manufacturer_id ON public.widgets USING btree (manufacturer_id);


--
-- Name: index_widgets_on_name_and_manufacturer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_widgets_on_name_and_manufacturer_id ON public.widgets USING btree (name, manufacturer_id);


--
-- Name: INDEX index_widgets_on_name_and_manufacturer_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON INDEX public.index_widgets_on_name_and_manufacturer_id IS 'No manufacturer can have two widgets with the same name';


--
-- Name: index_widgets_on_widget_status_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_widgets_on_widget_status_id ON public.widgets USING btree (widget_status_id);


--
-- Name: manufacturers fk_rails_413f677ef3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.manufacturers
    ADD CONSTRAINT fk_rails_413f677ef3 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: widgets fk_rails_c844384a2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT fk_rails_c844384a2b FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturers(id);


--
-- Name: widgets fk_rails_eb3d987080; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.widgets
    ADD CONSTRAINT fk_rails_eb3d987080 FOREIGN KEY (widget_status_id) REFERENCES public.widget_statuses(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20231119135140');

