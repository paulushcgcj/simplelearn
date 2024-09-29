CREATE TABLE IF NOT EXISTS public.fruits (
	id  SERIAL PRIMARY KEY,
	name varchar(40) NULL,
	description varchar(120) NULL,
	CONSTRAINT fruits_name_key UNIQUE (name)
);

INSERT INTO fruits(name, description) VALUES ('Cherry', 'Pink as one can be')
ON CONFLICT (name) DO UPDATE SET description = EXCLUDED.description;
INSERT INTO fruits(name, description) VALUES ('Apple', 'Red for sure')
ON CONFLICT (name) DO UPDATE SET description = EXCLUDED.description;
INSERT INTO fruits(name, description) VALUES ('Banana', 'King of fruits')
ON CONFLICT (name) DO UPDATE SET description = EXCLUDED.description;