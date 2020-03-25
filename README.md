<!-- ABOUT THE PROJECT -->
## Sobre o projeto

![](image.png)

Este software visa tornar o intermediário entre as partes interessadas de um negócio. Os usuários poderão registrar vários produtos em sua conta e aguardar a notificação de interesse de outra pessoa. Após o alerta, como a troca automática de contatos, eles podem finalizar o negócio.


### Construído com:
As estruturas que o projeto contempla são:
* [Node.JS](https://nodejs.org/en/)
* [Nodemon](https://nodemon.io/)
* [Express](http://expressjs.com/)
* [Nunjucks](https://mozilla.github.io/nunjucks/)
* [PostgreSQL](https://www.postgresql.org/)
* [Lottie](https://lottiefiles.com/)
* [Mailtrap](https://mailtrap.io/)

Outras bibliotecas foram usadas durante o desenvolvimento:

  > bcryptjs, faker, nodemailer, browser-sync 


<!-- GETTING STARTED -->
## Começando

Para obter uma cópia local em execução, siga estas etapas simples de exemplo.

### Pré-requisitos

Este é um exemplo de como listar as coisas necessárias para usar o software e como instalá-las.
* npm 
```sh
npm install npm@latest -g
```

### Instalação

1. Clone o repositório
```sh
git clone https://github.com/DaywisonFerreira/launchstore.git
```
3. Instale as dependências
```sh
npm install
```
4. Config PostgreSQL `src/config/db.js`
```JS
  user: "USER_NAME",
  password: "",
  host:"localhost",
  port: 5432,
  database: "DATABASE_NAME"

```
5. Copie schema SQL e cole no PostgreSQL
```JS
database.sql;
```
6. Criar seeds `seed.js`, para testar o software (opcional)
```sh
node seed.js
```


<!-- ROADMAP -->
## Roadmap
O software é um produto mínimo viável (MVP), portanto será necessário aprimorar os recursos antes de sua implementação.

<!-- CONTACT -->
## Contato

Daywison Leal - [LinkedIn](https://www.linkedin.com/in/daywison-ferreira-leal-ba6878127/) - daywison.leal@gmail.com

Link do Projeto: [https://github.com/DaywisonFerreira/launchstore](https://github.com/DaywisonFerreira/launchstore)

