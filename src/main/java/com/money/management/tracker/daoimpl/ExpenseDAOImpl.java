package com.money.management.tracker.daoimpl;

import com.money.management.tracker.dao.ExpenseDAO;
import com.money.management.tracker.model.Expense;
import com.money.management.tracker.model.User;
import com.money.management.tracker.util.HibernateUtil;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ExpenseDAOImpl implements ExpenseDAO {

    @Override
    public void addExpense(Expense expense) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(expense);
            tx.commit();
        } catch (Exception e) {
            if (tx != null && tx.getStatus().canRollback()) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

    @Override
    public List<Expense> getExpensesByUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Expense> expenses = null;

        try {
            expenses = session.createQuery(
                "FROM Expense WHERE user.id = :userId ORDER BY expenseDate DESC", Expense.class)
                .setParameter("userId", user.getId())
                .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return expenses;
    }

    @Override
    public List<Expense> getExpensesByUserAndMonth(User user, int year, int month) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Expense> expenses = null;
        try {
            expenses = session.createQuery(
                "FROM Expense WHERE user.id = :userId AND YEAR(expenseDate) = :year AND MONTH(expenseDate) = :month ORDER BY expenseDate DESC",
                Expense.class)
                .setParameter("userId", user.getId())
                .setParameter("year", year)
                .setParameter("month", month)
                .getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return expenses;
    }
}