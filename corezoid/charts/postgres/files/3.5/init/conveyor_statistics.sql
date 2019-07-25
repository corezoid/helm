-- Table: public.conveyor_copy_rpc_logic_statistics

-- DROP TABLE public.conveyor_copy_rpc_logic_statistics;

CREATE TABLE public.conveyor_copy_rpc_logic_statistics
(
    from_conveyor_id integer NOT NULL,
    to_conveyor_id integer NOT NULL,
    from_node_id character(24) COLLATE pg_catalog."default" NOT NULL,
    ts integer NOT NULL,
    period integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT conveyor_copy_rpc_logic_statistics_pkey PRIMARY KEY (from_conveyor_id, to_conveyor_id, ts, from_node_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

-- DROP TABLE public.conveyor_copy_rpc_logic_validation_statistics;

CREATE TABLE public.conveyor_copy_rpc_logic_validation_statistics
(
    from_conveyor_id integer NOT NULL,
    to_conveyor_id integer NOT NULL,
    from_node_id character(24) COLLATE pg_catalog."default" NOT NULL,
    ts integer NOT NULL,
    period integer NOT NULL,
    count integer NOT NULL,
    CONSTRAINT conveyor_copy_rpc_logic_validation_statistics_pkey PRIMARY KEY (from_conveyor_id, to_conveyor_id, ts, from_node_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

-- Table: public.conveyor_logic_statistics

-- DROP TABLE public.conveyor_logic_statistics;

CREATE TABLE public.conveyor_logic_statistics
(
    conveyor_id integer NOT NULL,
    node_id character(24) COLLATE pg_catalog."default" NOT NULL,
    ts integer NOT NULL,
    period integer NOT NULL,

    cce_ok integer NOT NULL,
    cce_err integer NOT NULL,
    cce_timeout integer NOT NULL,

    copy_create_ok integer NOT NULL,
    copy_create_err integer NOT NULL,

    copy_modify_ok integer NOT NULL,
    copy_modify_err integer NOT NULL,

    get_task_ok integer NOT NULL,
    get_task_err integer NOT NULL,

    http_ok integer NOT NULL,
    http_err integer NOT NULL,

    modify_task_ok integer NOT NULL,
    modify_task_err integer NOT NULL,

    rpc_ok integer NOT NULL,
    rpc_err integer NOT NULL,

    timer_called integer NOT NULL,

    CONSTRAINT conveyor_logic_statistics_pkey PRIMARY KEY (conveyor_id, node_id, ts)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
