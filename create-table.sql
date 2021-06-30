
CREATE TABLE users
(
    id bigint NOT NULL,
    disabled boolean,
    email character varying(40) COLLATE pg_catalog."default",
    first_name character varying(40) COLLATE pg_catalog."default",
    last_name character varying(40) COLLATE pg_catalog."default",
    expired boolean,
    password character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email)
)
WITH (
    OIDS = FALSE
);

/* Senha: testpass */

INSERT INTO users(
 id, disabled, email, first_name, last_name, expired, password)
 VALUES (1, false, 'user1@test.com', 'test', 'user1', false, '$2y$12$7XQUDwK3QE7oBB0wmVpht.aT7gESI205SgWarj15Wz2Jt6OfglbQ.');

/* Senha: testpass */
INSERT INTO users(
 id, disabled, email, first_name, last_name, expired, password)
 VALUES (2, false, 'abc@test.com', 'abc', 'abc', false, '$2y$12$7XQUDwK3QE7oBB0wmVpht.aT7gESI205SgWarj15Wz2Jt6OfglbQ.');

/* Senha: testpass */
INSERT INTO users(
 id, disabled, email, first_name, last_name, expired, password)
 VALUES (3, false, 'casuser', 'casuser', 'casuser', false, '$2y$12$7XQUDwK3QE7oBB0wmVpht.aT7gESI205SgWarj15Wz2Jt6OfglbQ.');


CREATE TABLE surrogate
(
    surrogate_user character varying(40) COLLATE pg_catalog."default",
    username character varying(40) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
);

INSERT INTO surrogate(surrogate_user, username) VALUES ('user1@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('abc@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('vitor@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('enus@test.com', 'casuser');