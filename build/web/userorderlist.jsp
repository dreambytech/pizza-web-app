<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.DataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        td p {
            margin: 0;
            padding: 0;
            color: #555;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
            display: block;
            width: 100%;
            max-width: 200px;
            margin: 20px auto 0;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Order List</h1>
        <table>
            <thead>
                <tr>
                    <th>Order Email</th>
                    <th>Order List</th>
                    <th>Order Location</th>
                    <th>Total Price</th>
                    <th>Bill Paid?</th>
                    <th>Order Time</th>
                </tr>
            </thead>
            <tbody>
                <%
                    HttpSession ses = request.getSession();
                    String email = (String) ses.getAttribute("useremail");
                    DataBase ob = new DataBase();

                    try {
                        ResultSet result = ob.read("select * from pizzaorder where ordermail='"+email+"'");
                        while (result.next()) {
                %>
                <tr>
                    <td><p><%=result.getString(1)%></p></td>
                    <td><%=result.getString(2)%></td>
                    <td><%=result.getString(3)%></td>
                    <td><%=result.getString(4)%></td>
                    <td><%=result.getString(5)%></td>
                    <td><%=result.getString(6)%></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
        <form action="pizzalistpage.jsp" method="post">
            <input type="submit" value="Go Back">
        </form>
    </div>
</body>
</html>
