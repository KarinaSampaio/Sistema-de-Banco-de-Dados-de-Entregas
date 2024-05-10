INSERT INTO status_entrega (status_type, descricao) VALUES
('Pendente', 'Entrega não iniciada'),
('Em trânsito', 'Entrega saiu para o destino'),
('Entregue', 'Entrega concluída com sucesso'),
('Cancelada', 'Entrega foi cancelada');


INSERT INTO entregas (id_usuario, id_local, id_veiculo, data_entrega, status) VALUES
(1, 1, 1, '2024-04-05 09:00:00', 'Pendente'),
(2, 2, 2, '2024-04-06 14:00:00', 'Em trânsito'),
(3, 3, 3, '2024-04-07 16:30:00', 'Entregue'),
(4, 4, 4, '2024-04-08 17:00:00', 'Entregue'),
(5, 5, 5, '2024-04-09 15:25:00', 'Em trânsito');

INSERT INTO entregas (id_usuario, id_local, id_veiculo, data_entrega, status)
SELECT 
    id_usuario,
    id_local,
    id_veiculo,
    TIMESTAMPADD(HOUR, FLOOR(RAND() * 24), '2024-01-06 14:00:00' ) AS data_entrega,
    CASE ROUND(RAND() * 3)
        WHEN 0 THEN 'Pendente'
        WHEN 1 THEN 'Em trânsito'
        WHEN 2 THEN 'Entregue'
        ELSE 'Cancelado'
    END AS status
FROM (
    SELECT
        2 AS id_usuario,
        2 AS id_local,
        2 AS id_veiculo
    FROM
        DUAL
    UNION ALL
    SELECT
        FLOOR(RAND() * 50) + 1 AS id_usuario,
        FLOOR(RAND() * 50) + 1 AS id_local,
        FLOOR(RAND() * 5) + 1 AS id_veiculo
    FROM
        information_schema.tables AS t1,
        information_schema.tables AS t2
    LIMIT 49
) AS subquery;