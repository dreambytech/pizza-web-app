<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        table th {
            background-color: #56ab2f;
            color: #fff;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        table tr:hover {
            background-color: #e0e0e0;
        }
        form {
            margin-top: 20px;
        }
        textarea {
            width: calc(100% - 20px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        .submit-button {
            background-color: #56ab2f;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .submit-button:hover {
            background-color: #4a9a2e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Selected Items</h1>
        <table>
            <thead>
                <tr>
                    <th>Pizza Name</th>
                    <th>Quantity</th>
                    <th>Cheese</th>
                    <th>Price</th>
                    <th>Discount</th>
                </tr>
            </thead>
            <tbody>
                <%
                    HttpSession ses = request.getSession();
                    int ind = (int) ses.getAttribute("ind");
                    double price = 0, discount = 0;
                    double totaldiscount = 0;
                    double totalprice = 0;
                    String orderlist = "";
                    String pizzaname = "";
                    String pizzacode = "";
                    String pizzaquantity = "";
                    String cheese = "";
                    String pizzaprice = "";
                    String pizzadiscount = "";
                    String extraString = ", ";

                    for (int i = 1; i < ind; i++) {
                        pizzaquantity = request.getParameter("quantity" + String.valueOf(i));
                        if (pizzaquantity.equals("0")) {
                            continue;
                        }
                        cheese = request.getParameter("extraCheese" + String.valueOf(i)) == null ? "off" : "on";
                        pizzaname = (String) ses.getAttribute("pizzanameof" + String.valueOf(i));
                        pizzacode = (String) ses.getAttribute("pizzacodeof" + String.valueOf(i));
                        pizzaprice = (String) ses.getAttribute("pizzapriceof" + String.valueOf(i));
                        pizzadiscount = (String) ses.getAttribute("pizzadiscountof" + String.valueOf(i));

                        price = (Integer.parseInt(pizzaprice) * Integer.parseInt(pizzaquantity));
                        discount = (price * ((double) Integer.parseInt(pizzadiscount) / 100));
                        if (cheese.equals("on")) {
                            price += 20; // Change the Value if you want
                        }
                        totalprice += (price - discount);

                        orderlist += "Code: " + pizzacode + "- Quantity: " + pizzaquantity + "- Cheese: " + cheese + "- Price: " + String.valueOf(price - discount) + extraString;

                %>
                <tr>
                    <td><%=pizzaname%></td>
                    <td><%=pizzaquantity%></td>
                    <td><%=cheese%></td>
                    <td><%=pizzaprice%></td>
                    <td><%=pizzadiscount%></td>
                </tr>
                <%            }

                    ses.setAttribute("orderlist", orderlist);
                    ses.setAttribute("totalprice", totalprice);
                %>
            </tbody>
        </table>
        <h2>Total Price: Rs. <%=totalprice%></h2>
        <form action="OrderIn">
            <label for="orderlocation">Order Location:</label><br>
            <textarea name="orderlocation" id="orderlocation" cols="30" rows="5" style="resize: none;"></textarea><br><br>
            <p>Payment: UPI 8910391722</p><br>
            <input type="submit" value="Confirm Order" class="submit-button">
        </form>
    </div>
</body>
</html>
