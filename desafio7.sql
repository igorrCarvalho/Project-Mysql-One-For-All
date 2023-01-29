SELECT
  artist_name AS artista,
  al.album AS album,
  COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al ON a.artist_id = al.artist_id
INNER JOIN SpotifyClone.following AS f ON a.artist_id = f.artist_id
GROUP BY artist_name, album
ORDER BY seguidores DESC, artist_name, album;