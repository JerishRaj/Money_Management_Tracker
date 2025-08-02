package com.money.management.tracker.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.util.Date;

@Entity
@Table(name = "expense")
public class Expense {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull
    @Size(min = 3, max = 50)
    private String category;

    @Min(0)
    private double amount;

    @NotNull
    @Size(min = 5, max = 255)
    private String description;

    @Temporal(TemporalType.DATE)
    private Date expenseDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    // New: Number of people to split
    @Min(1)
    private int splitPersons = 1;

    public Expense() {}

    // ...other getters/setters...

    public int getSplitPersons() { return splitPersons; }
    public void setSplitPersons(int splitPersons) { this.splitPersons = splitPersons; }

    // Existing getters/setters...
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Date getExpenseDate() { return expenseDate; }
    public void setExpenseDate(Date expenseDate) { this.expenseDate = expenseDate; }
    public User getUser() { return user; }
    public void setUser(User user) { this.user = user; }
}