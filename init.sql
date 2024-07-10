-- public.credentials definition

-- Drop table

-- DROP TABLE credentials;

CREATE TABLE credentials (
	id serial4 NOT NULL,
	email varchar(255) NOT NULL,
	pwd varchar(255) NOT NULL,
	CONSTRAINT credentials_email_key UNIQUE (email),
	CONSTRAINT credentials_pkey PRIMARY KEY (id)
);


-- public.notification definition

-- Drop table

-- DROP TABLE notification;

CREATE TABLE notification (
	id serial4 NOT NULL,
	"type" varchar(255) NOT NULL,
	message text NOT NULL,
	is_read bool DEFAULT false NOT NULL,
	recipient_id int8 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	recipient_type varchar(255) NULL,
	CONSTRAINT notification_pkey PRIMARY KEY (id)
);


-- public.roles definition

-- Drop table

-- DROP TABLE roles;

CREATE TABLE roles (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT roles_pkey PRIMARY KEY (id),
	CONSTRAINT unique_role_name UNIQUE (name)
);


-- public.companies definition

-- Drop table

-- DROP TABLE companies;

CREATE TABLE companies (
	id serial4 NOT NULL,
	"name" varchar(255) NULL,
	phone varchar(255) NULL,
	address varchar(255) NULL,
	website varchar(255) NULL,
	description varchar(255) NULL,
	createddate date NULL,
	company_role varchar NULL,
	credentials_id int4 NULL,
	CONSTRAINT companies_credentials_id_key UNIQUE (credentials_id),
	CONSTRAINT companies_pkey PRIMARY KEY (id),
	CONSTRAINT fk_credentials_id_companies FOREIGN KEY (credentials_id) REFERENCES credentials(id) ON DELETE CASCADE,
	CONSTRAINT fk_role FOREIGN KEY (company_role) REFERENCES roles("name")
);


-- public.job_offers definition

-- Drop table

-- DROP TABLE job_offers;

CREATE TABLE job_offers (
	id serial4 NOT NULL,
	title varchar(255) NULL,
	description varchar(255) NULL,
	"location" varchar(255) NULL,
	posteddate timestamp NULL,
	expirydate timestamp NULL,
	company_id int8 NULL,
	CONSTRAINT job_offers_pkey PRIMARY KEY (id),
	CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES companies(id) ON DELETE CASCADE
);


-- public.users definition

-- Drop table

-- DROP TABLE users;

CREATE TABLE users (
	id serial4 NOT NULL,
	first_name varchar(255) NULL,
	last_name varchar(255) NULL,
	phone varchar(255) NULL,
	address varchar(255) NULL,
	date_of_birth date NULL,
	created_date date NULL,
	role_user varchar NULL,
	credentials_id int4 NULL,
	cv text NULL,
	CONSTRAINT users_credentials_id_key UNIQUE (credentials_id),
	CONSTRAINT users_pkey PRIMARY KEY (id),
	CONSTRAINT fk_credentials_id_users FOREIGN KEY (credentials_id) REFERENCES credentials(id) ON DELETE CASCADE,
	CONSTRAINT fk_role FOREIGN KEY (role_user) REFERENCES roles("name")
);


-- public.applications definition

-- Drop table

-- DROP TABLE applications;

CREATE TABLE applications (
	id serial4 NOT NULL,
	user_id int8 NULL,
	application_date timestamp NULL,
	status varchar(255) NULL,
	job_offer_id int8 NULL,
	CONSTRAINT applications_pkey PRIMARY KEY (id),
	CONSTRAINT applications_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
	CONSTRAINT fk_job_offer FOREIGN KEY (job_offer_id) REFERENCES job_offers(id) ON DELETE CASCADE
);

-- Inserimento dei ruoli
INSERT INTO roles ("name") VALUES ('CANDIDATE'), ('COMPANY');


