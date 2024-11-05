INSERT INTO public."transaction"
( transaction_category_id, account_id, from_account_id, to_account_id, amount, transaction_date)
VALUES( 1, 4, 4, 3, 200, now()),
( 1, 5, 5, 3, 800, now()),
( 2, 6, 6, 7, 600, now()),
( 2, 5, 5, 3, 100, now()),
( 2, 7, 7, 9, 200, now()),
( 1, 9, 9, 4, 50, now()),
( 2, 6, 6, 5, 140, now()),
( 1, 8, 8, 3, 100, now()),
( 1, 7, 7, 5, 300, now()),
( 2, 4, 4, 6, 100, now()),
( 2, 5, 5, 7, 100, now()),
( 2, 6, 6, 9, 50, now());