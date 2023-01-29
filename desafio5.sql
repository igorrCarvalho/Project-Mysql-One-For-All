SELECT
  m.music AS cancao,
  COUNT(*) AS reproducoes
FROM SpotifyClone.historic AS h
INNER JOIN SpotifyClone.musics AS m ON h.music_played = m.music_id
GROUP BY m.music
ORDER BY reproducoes DESC, m.music
LIMIT 2;