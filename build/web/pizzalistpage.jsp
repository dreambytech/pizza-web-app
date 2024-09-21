<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.DataBase"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                min-height: 100vh;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            .pizza-item {
                background-color: #fff;
                padding: 20px;
                margin: 10px 0;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 80%;
                max-width: 500px;
            }
            .pizza-item label {
                font-weight: bold;
                color: #555;
            }
            .pizza-item div {
                margin-top: 10px;
            }
            .form-group {
                margin-top: 20px;
                text-align: center;
            }
            input[type="number"],
            input[type="submit"] {
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: calc(100% - 18px);
            }
            input[type="submit"] {
                background-color: #28a745;
                color: #fff;
                border: none;
                cursor: pointer;
                font-size: 16px;
                width: auto;
                padding: 10px 20px;
            }
            input[type="submit"]:hover {
                background-color: #218838;
            }
            .header, .footer {
                width: 100%;
                text-align: center;
                background-color: #333;
                color: #fff;
                padding: 10px 0;
            }
        </style>
        <title>Order Pizza</title>
        <script>
            function updateCheckbox(ind) {
                var quantityInput = document.getElementsByName('quantity' + ind)[0];
                var extraCheeseCheckbox = document.getElementsByName('extraCheese' + ind)[0];
                if (parseInt(quantityInput.value) > 0) {
                    extraCheeseCheckbox.disabled = false;
                } else {
                    extraCheeseCheckbox.disabled = true;
                    extraCheeseCheckbox.checked = false;
                }
            }
        </script>
    </head>
    <body>

        <form action="orderpage.jsp" method="post">

            <%
                DataBase ob = new DataBase();
                ResultSet pizzalist = ob.read("select * from pizzalist");
                int ind = 1;
                HttpSession ses = request.getSession();
            %>
            <h1>Welcome <%=(String) ses.getAttribute("username")%></h1>
            <h1>Order Your Pizzas</h1>
            <%
                try {
                    while (pizzalist.next()) {
            %>
            <div class="pizza-item">
                <label for="pizza<%=ind%>"><%=pizzalist.getString(2)%></label>
                <div>
                    <label for="quantity<%=ind%>">Number of Pizzas:</label>
                    <input type="number" name="quantity<%=ind%>" min="0" value="0" onchange="updateCheckbox(<%=ind%>)"><br><br>
                    Add Extra Cheese:
                    <input type="checkbox" name="extraCheese<%=ind%>" disabled><br><br>
                    Price: Rs. <%=pizzalist.getString(3)%><br>
                    Discount: Rs.<%=pizzalist.getString(4)%>
                </div>
            </div>

            <%

                        ses.setAttribute(("pizzacodeof" + String.valueOf(ind)), pizzalist.getString(1));
                        ses.setAttribute(("pizzanameof" + String.valueOf(ind)), pizzalist.getString(2));
                        ses.setAttribute(("pizzapriceof" + String.valueOf(ind)), pizzalist.getString(3));
                        ses.setAttribute(("pizzadiscountof" + String.valueOf(ind)), pizzalist.getString(4));
                        ind++;
                    }
                } catch (Exception e) {
                }

                ses.setAttribute("ind", ind);
            %>
            <div class="form-group">
                <input type="submit" value="Order">
            </div>
        </form>
        <form action="userorderlist.jsp" method="post">
            <input type="submit" value="View Order List">
        </form>
    </body>
</html>
