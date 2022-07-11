CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  password    TEXT NOT NULL,
  username    TEXT NOT NULL UNIQUE,
  email       TEXT NOT NULL UNIQUE CHECK (POSITION('@' IN email) > 1),
  is_admin    BOOLEAN NOT NULL DEFAULT FALSE,
  created_at  TIMESTAMP NOT NULL DEFAULT NOW(),
  name        TEXT NOT NULL UNIQUE
);

CREATE TABLE products(
  id              SERIAL PRIMARY KEY,
  name            TEXT NOT NULL UNIQUE,
  category        TEXT NOT NULL ,
  image           TEXT NOT NULL ,
  description     TEXT NOT NULL ,
  price           BIGINT NOT NULL
);

CREATE TABLE orders(
 id          SERIAL PRIMARY KEY,
 customer_id INTEGER NOT NULL REFERENCES users(id),
 created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders_details(
order_id  INTEGER NOT NULL REFERENCES orders(id),
product_id   INTEGER NOT NULL REFERENCES products(id),
quanity      INTEGER NOT NULL DEFAULT 1,
discount     INTEGER NULL,
PRIMARY KEY (order_id, product_id)
);