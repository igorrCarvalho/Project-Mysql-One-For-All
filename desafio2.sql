SELECT
COUNT(DISTINCT music) AS cancoes,
COUNT(DISTINCT artists.artist_name) AS artistas,
COUNT(DISTINCT albums.album) AS albuns
FROM SpotifyClone.musics
INNER JOIN SpotifyClone.artists
INNER JOIN SpotifyClone.albums;