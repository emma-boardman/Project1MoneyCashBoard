DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE tags(
id SERIAL4 PRIMARY KEY,
tag VARCHAR(255)
);

CREATE TABLE transactions(
id SERIAL4 PRIMARY KEY,
amount INT4,
merchant_id INT4 references merchants(id),
tag_id INT4 references tags(id)
);


