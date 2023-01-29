SELECT 
	`user` AS usuario,
    IF (year(MAX(h.`date`)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.historic AS h ON u.user_id = h.user_id
GROUP BY u.`user`
ORDER BY u.`user`;