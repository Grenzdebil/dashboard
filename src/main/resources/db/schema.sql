-- Tabelle für URL-Tags erstellen
CREATE TABLE url_tag (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(255) NOT NULL UNIQUE
);

-- Tabelle für URLs erstellen
CREATE TABLE url (
                     id SERIAL PRIMARY KEY,
                     url TEXT NOT NULL UNIQUE
);

-- Many-to-Many-Verknüpfungstabelle erstellen
CREATE TABLE url_url_tag (
                             url_id INT NOT NULL,
                             tag_id INT NOT NULL,
                             PRIMARY KEY (url_id, tag_id),
                             CONSTRAINT fk_url
                                 FOREIGN KEY(url_id)
                                     REFERENCES url(id)
                                     ON DELETE CASCADE,
                             CONSTRAINT fk_tag
                                 FOREIGN KEY(tag_id)
                                     REFERENCES url_tag(id)
                                     ON DELETE CASCADE
);
