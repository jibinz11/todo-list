using System;
using System.Collections.Generic;
using System.Text;

namespace Todo.Shared.Extensions
{
    public static class DateTimeExtension
    {
        public static string ToRelative(this DateTime dateTime)
        {
            var date = dateTime.Date;
            var today = DateTime.Now.Date;

            if (date == today)
                return "Today";
            if (date == today.AddDays(1))
                return "Tomorrow";
            if (date == today.AddDays(-1))
                return "Yesterday";
            if (date < today.AddDays(-1))
                return "Past";
            if (date.IsInSameWeek(today))
                return "This week";
            if (date.IsInSameMonth(today))
                return "This month";
            return "Upcoming";
        }
        private static bool IsInSameWeek(this DateTime date1, DateTime date2)
        {
            var cal = System.Globalization.DateTimeFormatInfo.CurrentInfo.Calendar;
            var d1 = date1.Date.AddDays(-1 * (int)cal.GetDayOfWeek(date1));
            var d2 = date2.Date.AddDays(-1 * (int)cal.GetDayOfWeek(date2));
            return d1 == d2;
        }
        private static bool IsInSameMonth(this DateTime date1, DateTime date2)
        {
            return date1.Date.Month == date2.Date.Month;
        }
    }

}
