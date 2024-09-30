<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskPage.aspx.cs" Inherits="LoginForm_in_ASP_DOT_NET.TaskPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Submission</title>
  <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 1.5rem;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            display: flex;
            justify-content: center;
            align-items: flex-start; 
            height: 100vh;
            margin: 0;
        }

        form {
            width: 50%;
            max-width: 600px; 
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin-top: 80px; 
            text-align: left;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 40px; 
            font-weight: bold; 
            font-size: 2rem; 
        }

        div {
            margin-bottom: 20px;
        }

        label {
            font-size: 1.1rem;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .calendar-icon {
            cursor: pointer;
            width: 25px; 
            height: 25px; 
            margin-left: 10px;
        }

        .calendar-hidden {
            display: none;
        }

        .date-container {
            display: flex;
            align-items: center;
        }

        .gridView {
           width: 100%;
           border-collapse: collapse;
           margin-top: 20px;
           font-size: 1rem;
           border: 1px solid #ccc;
        }
        .gridView th, .gridView td {
              padding: 10px;
              text-align: left;
              border: 1px solid #ddd;
          }
        .gridView th {
              background-color: #009688;
              color: white;
              text-align: center;
        }

        .gridView tr:nth-child(even) {
              background-color: #f2f2f2;
        }

        .gridView tr:hover {
              background-color: #ddd;
        }

        .calander{
             background-color: white; 
             border: 1px solid #ccc; 
             border-radius: 5px;
             box-shadow: 0 2px 10px rgba(0,0,0,0.1); 
             padding: 10px; 
             position: absolute; 
             z-index: 1000; 
        }

        .custom-calendar {
              border: 1px solid #ccc;
              background-color: #fff;
              font-family: Arial, sans-serif;
        }
        .calendar-icon {
              cursor: pointer;
              margin-left : 5px;
        }

        .calendar td {
               padding: 5px; 
               text-align: center; 
               cursor: pointer;
}

       .calendar td:hover {
               background-color: #f0f0f0; 
       }

       .calendar .selected {
              background-color: #007bff; 
              color: white;
       }


        .date-container{
            display:flex;
            align-items:center;
            margin-bottom:10px;
        }

        .calendar-hidden{
            display : none;
        }


        input[type="submit"] {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            background-color: #009688;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00796b;
        }

         @media (max-width: 608px) {
            form {
            width: 90%;
          }

           .gridView {
            font-size: 0.9rem;
        }
           .date-container{
               flex-direction:column;
               align-items:flex-start;
           }

           .calander{
               width : 100px;
           }
    }
    </style>

    <script type="text/javascript">
        function toggleCalendar(calendarId) {
            var calendarDiv = document.getElementById(calendarId);
            calendarDiv.style.display = (calendarDiv.style.display === 'none' || calendarDiv.style.display === '') ? 'block' : 'none';
        }
     </script>

</head>
<body>
    <form id="form1" runat="server">
        <h2>Task Submission</h2>

       
        <div>
            <label>Resource Name:</label>
            <asp:DropDownList ID="ddlResourceName" runat="server"></asp:DropDownList>
        </div>

      
        <div>
            <label>Task:</label>
            <asp:DropDownList ID="ddlTask" runat="server">
            <asp:ListItem Text="Select Task" Value="" Selected="True" Enabled="False"></asp:ListItem>
            </asp:DropDownList>
        </div>

       
        <div>
            <label>Start Date:</label>
            <div class="date-container">
                <asp:TextBox ID="txtStartDate" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                <img src="image/calendar-icon.png" class="calendar-icon" onclick="toggleCalendar('calStartDates')" />
                <div id="calStartDates" class="calendar" style="display:none;">
                   <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                </div>
            </div>
            <asp:Calendar ID="calStartDate" runat="server" CssClass="calendar-hidden" BackColor="White" 
              BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
              ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" 
              ShowTodayButton="True" ShowWeekHeaders="True">
              <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
              <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
              <OtherMonthDayStyle ForeColor="#999999" />
              <SelectedDayStyle BackColor="#333399" ForeColor="White" />
              <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
              <TodayDayStyle BackColor="#CCCCCC" />
              </asp:Calendar>
        </div>
      
        <div>
            <label>End Date:</label>
            <div class="date-container">
                <asp:TextBox ID="txtEndDate" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                <img src="image/calendar-icon.png" class="calendar-icon" onclick="toggleCalendar('calEndDates')" />
                <div id="calEndDates" style="display:none;">
                    <asp:Calendar ID="Calendar2" runat="server" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                </div>
            </div>
           <asp:Calendar ID="calEndDate" runat="server" CssClass="calendar-hidden" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
              <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
              <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
              <OtherMonthDayStyle ForeColor="#999999" />
              <SelectedDayStyle BackColor="#333399" ForeColor="White" />
              <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
              <TodayDayStyle BackColor="#CCCCCC" />
           </asp:Calendar>
        </div>

       
        <div>
            <label>Planned Effort (hours):</label>
            <asp:TextBox ID="txtPlannedEffort" runat="server"></asp:TextBox>
        </div>

        <div>
            <label>Actual Effort (hours):</label>
            <asp:TextBox ID="txtActualEffort" runat="server"></asp:TextBox>
        </div>

       
        <div>
            <label>Remarks:</label>
            <asp:TextBox ID="txtRemarks" runat="server"></asp:TextBox>
        </div>

     
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        </div>

       
       <asp:GridView ID="gvTaskData" runat="server" CssClass="gridView" Visible="False">
        </asp:GridView>

    </form>
</body>
</html>
