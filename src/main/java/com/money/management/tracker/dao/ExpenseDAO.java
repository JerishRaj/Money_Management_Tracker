package com.money.management.tracker.dao;

import java.util.List;
import com.money.management.tracker.model.Expense;
import com.money.management.tracker.model.User;

public interface ExpenseDAO {
    void addExpense(Expense expense);
    List<Expense> getExpensesByUser(User user);
    List<Expense> getExpensesByUserAndMonth(User user, int year, int month);
}