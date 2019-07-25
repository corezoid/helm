CREATE DATABASE health_check;

CREATE TABLE services
(
  id serial,
  title text NOT NULL,
  short_name character varying(40) NOT NULL,
  description text,
  status integer DEFAULT 1,
  user_id integer NOT NULL,
  CONSTRAINT services_pkey PRIMARY KEY (id),
  CONSTRAINT services_unique_shortname UNIQUE (short_name)
);

CREATE TABLE service_problem_history
(
    id serial,
    service_id integer,
    description text,
    status smallint DEFAULT 1,
    ts integer,
    user_id integer NOT NULL,
    resolved boolean DEFAULT false,
    CONSTRAINT service_problem_history_pkey PRIMARY KEY (id)
);

CREATE TABLE events
(
    id serial,
    title text NOT NULL,
    description text,
    status smallint DEFAULT 1,
    user_id integer NOT NULL,
    ts integer NOT NULL,
    CONSTRAINT events_pkey PRIMARY KEY (id)
);

CREATE TABLE events_history
(
    id serial,
    event_id integer,
    status smallint DEFAULT 1,
    ts integer,
    user_id integer NOT NULL,
    CONSTRAINT events_history_pkey PRIMARY KEY (id)
);

INSERT INTO services VALUES (115, 'DEEPMEMO', 'DEEPMEMO', 'DEEPMEMO', 1, 1);
INSERT INTO services VALUES (112, 'DATABASE', 'DATABASE', 'DATABASE', 1, 1);
INSERT INTO services VALUES (113, 'REDIS', 'REDIS', 'REDIS', 1, 1);
INSERT INTO services VALUES (111, 'HTTP_WORKER', 'HTTP_WORKER', 'HTTP_WORKER', 1, 1);
INSERT INTO services VALUES (114, 'RABBIT', 'RABBIT', 'RABBIT', 1, 1);
INSERT INTO services VALUES (109, 'WORKER', 'WORKER', 'WORKER', 1, 1);
INSERT INTO services VALUES (108, 'API', 'API', 'API', 1, 1);
INSERT INTO services VALUES (110, 'MULTIPART', 'MULTIPART', 'MULTIPART', 1, 1);
INSERT INTO services VALUES (119, 'USERCODE', 'USERCODE', 'USERCODE', 1, 1);
