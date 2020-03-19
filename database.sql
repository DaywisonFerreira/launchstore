DROP SCHEMA public CASCADE;
CREATE SCHEMA public
DROP DATABASE IF EXISTS launchstoredb;
CREATE DATABASE launchstoredb;

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
    "category_id" int NOT NULL,
    "user_id" int,
    "name" text not null,
    "description" text not null,
    "old_price" int,
    "price" int not null,
    "quantity" int DEFAULT 0,	
    "status" int DEFAULT 1,
    "created_at" timestamp DEFAULT (now()),
    "updated_at" timestamp DEFAULT (NOW())
);

CREATE TABLE "categories" (
    "id" serial PRIMARY KEY,
    "name" text not null
);

INSERT INTO categories (name) values ('comida');
INSERT INTO categories (name) values ('eletrônicos');
INSERT INTO categories (name) values ('automóveis');

CREATE TABLE "files" (
    "id" serial PRIMARY key,
    "name" text,
    "path" text not null,
    "product_id" int
);

alter table "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

alter table "files" ADD FOREIGN KEY ("product_id")  REFERENCES "products" ("id");

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" text not null,
    "email" text UNIQUE not null,
    "password" text not null,
    "cpf_cnpj" text UNIQUE not null,
    "cep" text,
    "address" text,
    "created_at" timestamp DEFAULT (now()),
    "updated_at" timestamp DEFAULT (NOW())
);

-- foreign key
ALTER TABLE "products" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

-- create procedure
CREATE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- auto updated_at products
CREATE TRIGGER trigger_set_timestamp
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

-- auto updated_at users
CREATE TRIGGER trigger_set_timestamp
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

-- connect pg simple table
CREATE TABLE "session" (
  "sid" varchar NOT NULL COLLATE "default",
	"sess" json NOT NULL,
	"expire" timestamp(6) NOT NULL
)
WITH (OIDS=FALSE);

ALTER TABLE "session" ADD CONSTRAINT "session_pkey" PRIMARY KEY ("sid") NOT DEFERRABLE INITIALLY IMMEDIATE;

CREATE INDEX "IDX_session_expire" ON "session" ("expire");

alter table users add column reset_token text;
alter table users add column reset_token_expires text;


-- cascade effect when delete user and products

alter table products
drop constraint products_user_id_fkey,
add constraint products_user_id_fkey
foreign key (user_id)
references users(id)
on delete cascade;

alter table files
drop constraint files_product_id_fkey,
add constraint files_product_id_fkey
foreign key (product_id)
references products(id)
on delete cascade;

DELETE FROM products;
DELETE FROM users;
DELETE FROM files;


ALTER SEQUENCE products_id_seq RESTART WITH 1;
ALTER SEQUENCE users_id_seq RESTART WITH 1;
ALTER SEQUENCE files_id_seq RESTART WITH 1;


-- create orders (pedido)
CREATE TABLE "orders" (
	"id" SERIAL PRIMARY KEY,
  "seller_id" INT NOT NULL,
  "buyer_id" INT NOT NULL,
  "product_id" INT NOT NULL,
  "price" INT NOT NULL,
  "quantity" INT DEFAULT 0,
  "total" INT NOT NULL,
  "status" TEXT NOT NULL,
  "created_at" timestamp DEFAULT (NOW()),
  "updated_at" timestamp DEFAULT (NOW())
  
);

ALTER TABLE "orders" ADD FOREIGN KEY ("seller_id") REFERENCES "users" ("id");
ALTER TABLE "orders" ADD FOREIGN KEY ("buyer_id") REFERENCES "users" ("id");
ALTER TABLE "orders" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");


CREATE TRIGGER set_timestamp
BEFORE UPDATE ON orders
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();