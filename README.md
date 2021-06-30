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

