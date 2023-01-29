SELECT 
	`user` AS usuario,
    COUNT(h.music_played) AS qt_de_musicas_ouvidas,
    SUM(ROUND((m.seconds_duration / 60), 2)) AS total_minutos
FROM SpotifyClone.users AS u
	INNER JOIN SpotifyClone.historic AS h ON u.user_id = h.user_id
	INNER JOIN SpotifyClone.musics AS m ON m.music_id = h.music_played
GROUP BY u.user_id
ORDER BY u.user;