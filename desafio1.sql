CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_type VARCHAR(20) NOT NULL,
  plan_value DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.plans(plan_type, plan_value)
VALUES ('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

CREATE TABLE SpotifyClone.artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.artists(artist_name)
VALUES ('Queen'),
('Beyoncé'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');

CREATE TABLE SpotifyClone.albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  release_year INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.albums(album, artist_id, release_year)
VALUES ('Renaissance', 2, 2022),
('Jazz', 1, 1978),
('Hot Space', 1, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);

CREATE TABLE SpotifyClone.users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  `user` VARCHAR(100) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  member_since DATE NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.users(`user`, age, plan_id, member_since)
VALUES ('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 2, '2017-12-30'),
('Martin Fowler', 46, 2, '2017-01-17'),
('Sandi Metz', 58, 2, '2018-04-29'),
('Paulo Freire', 19, 3, '2018-02-14'),
('Bell Hooks', 26, 3, '2018-01-05'),
('Christopher Alexander', 85, 4, '2019-06-05'),
('Judith Butler', 45, 4, '2020-05-13'),
('Jorge Amado', 58, 4, '2017-02-17');

CREATE TABLE SpotifyClone.following(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.following(user_id, artist_id)
VALUES (1, 2),
(1, 1),
(1, 3),
(2, 2),
(2, 3),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(7, 6),
(9, 3),
(6, 6),
(6, 2),
(10, 1);

CREATE TABLE SpotifyClone.musics(
  music_id INT PRIMARY KEY AUTO_INCREMENT,
  music VARCHAR(200) NOT NULL,
  seconds_duration INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.musics(music, seconds_duration, album_id)
VALUES ('Don’t Stop Me Now', 203, 2),
('Under Pressure', 152, 3),
('Como Nossos Pais', 105, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 5),
('Samba em Paris', 267, 6),
('The Bard’s Song', 244, 7),
('Feeling Good', 100, 8),
('BREAK MY SOUL', 279, 1),
('VIRGO’S GROOVE', 369, 1),
('ALIEN SUPERSTAR', 116, 1);

CREATE TABLE SpotifyClone.historic(
  user_id INT NOT NULL,
  music_played INT NOT NULL,
  `date` DATE NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, music_played),
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
  FOREIGN KEY (music_played) REFERENCES SpotifyClone.musics(music_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.historic(user_id, music_played, `date`)
VALUES (1, 5, '2022-02-28 10:45:55'),
(1, 9, '2020-05-02 05:30:35'),
(1, 7, '2020-03-06 11:22:33'),
(2, 7, '2022-08-05 08:05:17'),
(2, 4, '2020-01-02 07:40:33'),
(3, 7, '2020-11-13 16:55:13'),
(3, 9, '2020-12-05 18:38:30'),
(4, 5, '2021-08-15 17:10:10'),
(5, 5, '2022-01-09 01:44:33'),
(5, 2, '2020-08-06 15:23:43'),
(6, 4, '2017-01-24 00:31:17'),
(6, 8, '2017-10-12 12:35:20'),
(7, 1, '2011-12-15 22:30:49'),
(8, 1, '2012-03-17 14:56:41'),
(9, 6, '2022-02-24 21:14:22'),
(10, 10, '2015-12-13 08:30:22');