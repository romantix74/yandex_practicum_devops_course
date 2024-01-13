INSERT INTO product (id, name, picture_url, price) VALUES (1, 'Сливочная', 'https://storage.yandexcloud.net/bucket-std-022-024/6.jpg', 320.00);
INSERT INTO product (id, name, picture_url, price) VALUES (2, 'Особая', 'https://storage.yandexcloud.net/bucket-std-022-024/5.jpg', 179.00);
INSERT INTO product (id, name, picture_url, price) VALUES (3, 'Молочная', 'https://storage.yandexcloud.net/bucket-std-022-024/4.jpg', 225.00);
INSERT INTO product (id, name, picture_url, price) VALUES (4, 'Нюренбергская', 'https://storage.yandexcloud.net/bucket-std-022-024/3.jpg', 315.00);
INSERT INTO product (id, name, picture_url, price) VALUES (5, 'Мюнхенская', 'https://storage.yandexcloud.net/bucket-std-022-024/2.jpg', 330.00);
INSERT INTO product (id, name, picture_url, price) VALUES (6, 'Русская', 'https://storage.yandexcloud.net/bucket-std-022-024/1.jpg', 189.00);

INSERT INTO orders (id, status, date_created) SELECT i, (array['pending', 'shipped', 'cancelled'])[floor(random() * 3 + 1)], DATE(NOW() - (random() * (NOW()+'90 days' - NOW()))) FROM generate_series(1, 10000000) s(i);
INSERT INTO order_product (quantity, order_id, product_id) SELECT floor(1+random()*50)::int, i, 1 + floor(random()*6)::int % 6 FROM generate_series(1, 10000000) s(i);
