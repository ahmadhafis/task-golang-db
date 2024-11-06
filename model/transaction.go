package model

import "time"

type Transaction struct {
	TransactionId         int64 `gorm:"primaryKey;autoIncrement;<-:false"`
	TransactionCategoryId int64
	AccountId             int64
	FromAccountId         int64
	ToAccountId           int64
	Amount                int64
	TransactionDate       time.Time
}