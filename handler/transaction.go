package handler

import (
	"net/http"
	"task-golang-db/model"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type TransactionInterface interface {
	Create(*gin.Context)
	List(*gin.Context)
}

type TransactionImplement struct {
	db *gorm.DB
}

func NewTransaction(db *gorm.DB) TransactionInterface {
	return &TransactionImplement{
		db: db,
	}
}

func (a *TransactionImplement) Create(c *gin.Context) {
	payload := model.Transaction{}

	// bind JSON Request to payload
	err := c.BindJSON(&payload)
	if err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{
			"error": err,
		})
		return
	}

	// Create data
	result := a.db.Create(&payload)
	if result.Error != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{
			"error": result.Error.Error(),
		})
		return
	}

	// Success response
	c.JSON(http.StatusOK, gin.H{
		"message": "Create success",
		"data":    payload,
	})
}

func (a *TransactionImplement) List(c *gin.Context) {
	// Prepare empty result
	var transactions []model.Transaction

	// Find and get all transactions data and put to &transactions
	if err := a.db.Find(&transactions).Error; err != nil {
		c.AbortWithStatusJSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	// Success response
	c.JSON(http.StatusOK, gin.H{
		"data": transactions,
	})
}
