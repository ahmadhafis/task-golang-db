CREATE TABLE accounts (
    account_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR NOT NULL,
    balance BIGINT NOT NULL,
    referral_account_id BIGINT NULL,
    FOREIGN KEY (referral_account_id) REFERENCES accounts(account_id)
);

CREATE TABLE auths (
    auth_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    account_id BIGINT UNIQUE NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE transaction_categories (
    transaction_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR NOT NULL
);

CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    transaction_category_id BIGINT NULL,
    account_id BIGINT NOT NULL,
    from_account_id BIGINT NULL,
    to_account_id BIGINT NULL,
    amount BIGINT NOT NULL,
    transaction_date TIMESTAMP,
    FOREIGN KEY (transaction_category_id) REFERENCES transaction_categories(transaction_category_id)
);