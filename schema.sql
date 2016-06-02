DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id serial primary key,
	username text not null,
	email text not null,
	email_verified boolean not null,
	password_hash text not null
);

CREATE UNIQUE INDEX user_username_unique
on users (username);

DROP TABLE IF EXISTS lists;
CREATE TABLE lists (
	id serial primary key,
	user_id integer not null,
	listname text not null,
	language_1_tag text not null,
	language_2_tag text not null,
	shared integer not null,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE UNIQUE INDEX list_name_unique_for_user
on lists (user_id, listname);

DROP TABLE IF EXISTS translations;
CREATE TABLE translations (
	id serial primary key,
	list_id integer not null,
	language_1_text text not null,
	language_2_text text not null,
    FOREIGN KEY(list_id) REFERENCES lists(id) ON DELETE CASCADE
);

-- TODO: make user_1_id and user_2_id a unique combo
DROP TABLE IF EXISTS friendships;
CREATE TABLE friendships (
	user_1_id integer not null,
	user_2_id integer not null,
	FOREIGN KEY(user_1_id) REFERENCES users(id) ON DELETE CASCADE,
	FOREIGN KEY(user_2_id) REFERENCES users(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS auth_tokens;
CREATE TABLE auth_tokens (
    id serial primary key,
    selector text not null,
    token text not null,
    expires text not null
);
