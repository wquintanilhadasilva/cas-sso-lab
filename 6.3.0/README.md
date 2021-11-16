# POC CAS SURROGATE

POC para permitir a autenticação de um usuário em nome de outro, usando o CAS.

## Referências:

[Documentação oficial](https://apereo.github.io/cas/6.3.x/installation/Surrogate-Authentication.html)

[Artigo básico complementar](https://medium.com/swlh/install-cas-server-with-db-authentication-8ff52234f52)

[Liberação de contas surrogate para um usuário específico](https://apereo.github.io/cas/6.3.x/configuration/Configuration-Properties.html#static-surrogate-accounts)

[Liberação de contas surrogates via banco de dados](https://apereo.github.io/cas/6.3.x/configuration/Configuration-Properties.html#jdbc-surrogate-accounts)

[Configuração base para indicar a autenticação Surrogate](https://apereo.github.io/cas/6.3.x/configuration/Configuration-Properties.html#surrogate-authentication)


## Configuração do ambiente:

Importar o certificado na jvm:

````
keytool -importkeystore -srckeystore thekeystore -destkeystore $JAVA_HOME/lib/security/cacerts
````
Senha padrão do repositório: `changeit`


Compilar o módulo `cas-overlay-template`: Acesse o diretório base da aplicação e execute o comando abaixo

````
sudo ./gradlew clean copyCasConfiguration build run
````

Compilar o módulo `cas-management-overlay`: Acesse o diretório base da aplicação e execute o comando abaixo

````
sudo ./gradlew clean copyCasConfiguration build run
````

### Acesse a url da aplicação:

Após subir os serviços na seção anterior, acesse no navegador:

* Autenticação básica: [http://localhost/cas/login](http://localhost/cas/login)

* Deslogar: [http://localhost/cas/logout](http://localhost/cas/logout)

* Módulo de gerenciamento: [http://localhost:8444/cas-management](http://localhost:8444/cas-management)



## Erros x suporte:

[Erro de SSL](https://apereo.github.io/cas/5.3.x/installation/Troubleshooting-Guide.html#pkix-path-building-failed)


# TODO - A experimentar

* [Rest-Authentication](https://apereo.github.io/cas/6.1.x/installation/Rest-Authentication.html)
* [REST-Protocol](https://apereo.github.io/cas/6.1.x/protocol/REST-Protocol.html)
* [Multiple-credentials](https://apereo.github.io/cas/6.1.x/protocol/REST-Protocol.html#multiple-credentials)
* [Surrogate-authentication](https://apereo.github.io/cas/development/authentication/Surrogate-Authentication.html#surrogate-authentication)
* [Surrogate-Authentication-Storage-JDBC](https://apereo.github.io/cas/development/authentication/Surrogate-Authentication-Storage-JDBC.html)
* [Installation Surrogate-Authentication](https://apereo.github.io/cas/5.2.x/installation/Surrogate-Authentication.html)
* [Installation Surrogate-Authentication Preseleted](https://apereo.github.io/cas/5.2.x/installation/Surrogate-Authentication.html#preselected)
* [GoogleAuthenticator](https://apereo.github.io/cas/5.0.x/installation/GoogleAuthenticator-Authentication.html)
* [Configuration-Properties google-authenticator](https://apereo.github.io/cas/6.3.x/configuration/Configuration-Properties.html#google-authenticator)
* [database-settings](https://apereo.github.io/cas/6.3.x/configuration/Configuration-Properties-Common.html#database-settings)
* [GoogleAuthenticator-Authentication-Registration-JPA](https://apereo.github.io/cas/development/mfa/GoogleAuthenticator-Authentication-Registration-JPA.html)
* [cas-mfa-google-authenticator](https://apereo.github.io/2018/06/10/cas-mfa-google-authenticator/)
* [cas-mfa-google-authenticator step by step](https://fawnoos.com/2018/06/10/cas-mfa-google-authenticator/)


# Outros

```
dn: uid=chico.gomes,dc=eb,dc=mil,dc=br
cn: Chico Gomes
departmentnumber: 025262
displayname: GOMES
givenname: 75894682312
initials: 157321001
mail: chico.gomes@eb.mil.br
objectclass: inetOrgPerson
objectclass: top
sn: Chico Gomes
title: 1º Ten
uid: chico.gomes
userpassword: {MD5}F5GWLq3q3NkAHOiIFWmDcA==
```

Comandos LDAP
```
ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W admin

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W admin "objectclass=account" cn uid homeDirectory
ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W admin "objectclass=account"

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,uid=joe,dc=eb,dc=mil,dc=br" -W admin "objectclass=posixAccount"

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(objectClass=inetOrgPerson)"
ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(objectClass=posixAccount)"
ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(objectClass=posixAccount)" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(&(objectClass=posixAccount)(uid=joe))" cn uid homeDirectory
ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(uid=joe)" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "uid=adriana.diniz@eb.mil.br,dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(|(uid=adriana.diniz@eb.mil.br)(mail=adriana.diniz@eb.mil.br))" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "uid=adriana.diniz,dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(|(uid=adriana.diniz@eb.mil.br)(mail=adriana.diniz@eb.mil.br))" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(|(uid=adriana.diniz)(mail=adriana.diniz))" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "uid=adriana.diniz,dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(|(uid=adriana.diniz)(mail=adriana.diniz))"

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(uid=adriana.diniz)" cn uid homeDirectory

ldapsearch -x -H ldap://localhost:8389 -b "dc=eb,dc=mil,dc=br" -D "cn=admin,dc=eb,dc=mil,dc=br" -W "(uid=00396926983)" cn uid homeDirectory
```

```
ldapadd -c -x -H ldap://localhost:8389 -D "cn=admin,dc=eb,dc=mil,dc=br" -W -f ./adriana.diniz2.ldif 
```

# SGBD

```


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


-- pwd: testpass 

INSERT INTO users(
 id, disabled, email, first_name, last_name, expired, password)
 VALUES (1, false, 'user1@test.com', 'test', 'user1', false, '$2y$12$7XQUDwK3QE7oBB0wmVpht.aT7gESI205SgWarj15Wz2Jt6OfglbQ.');

INSERT INTO users(
 id, disabled, email, first_name, last_name, expired, password)
 VALUES (2, false, 'abc@test.com', 'abc', 'abc', false, '$2y$12$7XQUDwK3QE7oBB0wmVpht.aT7gESI205SgWarj15Wz2Jt6OfglbQ.');

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

ALTER TABLE public.users ADD memberof varchar(20) NULL;


INSERT INTO surrogate(surrogate_user, username) VALUES ('user1@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('abc@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('vitor@test.com', 'casuser');
INSERT INTO surrogate(surrogate_user, username) VALUES ('enus@test.com', 'casuser');

INSERT INTO surrogate(surrogate_user, username) VALUES ('abc@test.com', 'user1');
INSERT INTO surrogate(surrogate_user, username) VALUES ('vitor@test.com', 'user1');
INSERT INTO surrogate(surrogate_user, username) VALUES ('enus@test.com', 'user1');
 

select * from users

select * from surrogate s 




SELECT * from Google_Authenticator_Registration_Record

select * from Google_Authenticator_Token

select * from scratch_codes



create table Google_Authenticator_Registration_Record (
   id bigint generated by default as identity (start with 1),
    name varchar(255) not null,
    registration_Date timestamp,
    secret_Key varchar(2048) not null,
    username varchar(255) not null,
    validation_Code integer not null,
    primary key (id)
)
    
    
create table Google_Authenticator_Token (
   id bigint generated by default as identity (start with 1),
    issued_Date_Time timestamp not null,
    token integer not null,
    user_Id varchar(255) not null,
    primary key (id)
)

create table scratch_codes (
   id bigint not null,
   scratch_Codes integer not null
)

alter table Google_Authenticator_Registration_Record 
   add constraint UKbfdvvfhi8n022v1yket0jajih unique (username, name)
   

   
alter table scratch_codes 
   add constraint FKmneuc3ux4ho26jqepo36wfoj9 
   foreign key (id) 
   references Google_Authenticator_Registration_Record

   
   
   select * from google_authenticator_registration_record garr 


```