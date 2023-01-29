SELECT
artist_name AS artista,
al.album AS album
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albums AS al ON a.artist_id = al.artist_id
GROUP BY artist_name, album
HAVING artist_name = 'Elis Regina'
ORDER BY album;