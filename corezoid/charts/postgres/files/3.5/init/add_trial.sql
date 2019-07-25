INSERT INTO payment_plans VALUES (1, 'trial', '1', 0, 15, 1000000, 'usd', 'interval');

ALTER TABLE "user_groups" ADD COLUMN "owner_user_id" integer DEFAULT NULL;

WITH group_owners AS (
    SELECT
        ug.id,
        utug.user_id AS owner_user_id
    FROM user_groups AS ug
             LEFT JOIN group_to_group AS gtg ON gtg.group_id = ug.id
             INNER JOIN user_to_user_groups AS utug ON utug.user_group_id = gtg.parent_group_id
    WHERE ug.status <> 3 AND utug.user_id IS NOT NULL
    UNION
    SELECT
        ug.id,
        utug.user_id AS owner_user_id
    FROM user_groups AS ug
             INNER JOIN user_to_user_groups AS utug ON utug.user_group_id = ug.id AND ug.type IN (1,12)
    WHERE ug.status <> 3 AND utug.user_id IS NOT NULL
)
UPDATE user_groups AS ug
SET owner_user_id = go.owner_user_id
FROM group_owners AS go
WHERE ug.id = go.id;
