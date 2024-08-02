-- Einfügen von URLs
INSERT INTO url (id, url) VALUES (1, 'https://example.com');
INSERT INTO url (id, url) VALUES (2, 'https://openai.com');
INSERT INTO url (id, url) VALUES (3, 'https://github.com');
INSERT INTO url (id, url) VALUES (4, 'https://stackoverflow.com');
INSERT INTO url (id, url) VALUES (5, 'https://kotlinlang.org');

-- Einfügen von Tags
INSERT INTO url_tag (id, name) VALUES (1, 'Tech');
INSERT INTO url_tag (id, name) VALUES (2, 'AI');
INSERT INTO url_tag (id, name) VALUES (3, 'Programming');
INSERT INTO url_tag (id, name) VALUES (4, 'Community');
INSERT INTO url_tag (id, name) VALUES (5, 'Kotlin');

-- Zuordnen von Tags zu URLs
-- URL: https://example.com
INSERT INTO url_url_tag (url_id, tag_id) VALUES (1, 1); -- Tech

-- URL: https://openai.com
INSERT INTO url_url_tag (url_id, tag_id) VALUES (2, 1); -- Tech
INSERT INTO url_url_tag (url_id, tag_id) VALUES (2, 2); -- AI

-- URL: https://github.com
INSERT INTO url_url_tag (url_id, tag_id) VALUES (3, 1); -- Tech
INSERT INTO url_url_tag (url_id, tag_id) VALUES (3, 3); -- Programming

-- URL: https://stackoverflow.com
INSERT INTO url_url_tag (url_id, tag_id) VALUES (4, 1); -- Tech
INSERT INTO url_url_tag (url_id, tag_id) VALUES (4, 4); -- Community

-- URL: https://kotlinlang.org
INSERT INTO url_url_tag (url_id, tag_id) VALUES (5, 1); -- Tech
INSERT INTO url_url_tag (url_id, tag_id) VALUES (5, 3); -- Programming
INSERT INTO url_url_tag (url_id, tag_id) VALUES (5, 5); -- Kotlin
