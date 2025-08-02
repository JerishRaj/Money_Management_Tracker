package com.money.management.tracker.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull
    @Size(min = 3, max = 50)
    private String username;

    @NotNull
    @Email
    private String email;

    @NotNull
    @Size(min = 6)
    private String password;

    @Min(0)
    private double monthlyIncome;

    @NotNull
    private String userType;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public double getMonthlyIncome() { return monthlyIncome; }
    public void setMonthlyIncome(double monthlyIncome) { this.monthlyIncome = monthlyIncome; }

    public String getUserType() { return userType; }
    public void setUserType(String userType) { this.userType = userType; }
}