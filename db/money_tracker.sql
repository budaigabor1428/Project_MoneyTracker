DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE SET NULL,
  tag_id INT8 REFERENCES tags(id) ON DELETE SET NULL
);
