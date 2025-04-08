WITH sub_tree AS (
    -- ��������� ������������� ���������� "��������� 1"
    SELECT 
        s.id,
        s.name,
        s.parent_id,
        1 AS sub_level
    FROM subdivisions s
    JOIN collaborators c ON c.subdivision_id = s.id
    WHERE c.id = 710253

    UNION ALL

    -- ���������� ���� ����������� �������������, �������� ������
    SELECT 
        s.id,
        s.name,
        s.parent_id,
        st.sub_level + 1
    FROM subdivisions s
    JOIN sub_tree st ON s.parent_id = st.id
    WHERE s.id NOT IN (100055, 100059)
)

-- �������� ������
SELECT 
    c.id,
    c.name,
    s.name AS sub_name,
    s.id AS sub_id,
    st.sub_level,
    (
        SELECT COUNT(*) 
        FROM collaborators c2 
        WHERE c2.subdivision_id = s.id
    ) AS colls_count
FROM collaborators c
JOIN sub_tree st ON c.subdivision_id = st.id
JOIN subdivisions s ON c.subdivision_id = s.id
WHERE c.age < 40
ORDER BY st.sub_level ASC;
