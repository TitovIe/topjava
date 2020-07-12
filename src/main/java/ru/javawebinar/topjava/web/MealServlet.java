package ru.javawebinar.topjava.web;

import org.slf4j.Logger;
import ru.javawebinar.topjava.model.MealConstants;
import ru.javawebinar.topjava.model.MealTo;
import ru.javawebinar.topjava.util.MealsUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;
import java.util.List;

import static org.slf4j.LoggerFactory.getLogger;

public class MealServlet extends HttpServlet {
    private static final Logger log = getLogger(UserServlet.class);

    private LocalTime startTime = LocalTime.of(0, 0);
    private LocalTime endTime = LocalTime.of(23, 59);
    private List<MealTo> mealToList = MealsUtil.getFiltered(MealConstants.meals, startTime, endTime, MealConstants.DEFAULT_CALORIES_PER_DAY);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("forward to meals");

        request.setAttribute("List of meals", mealToList);
        request.getRequestDispatcher("/meals.jsp").forward(request, response);
    }
}

