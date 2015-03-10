using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// Summary description for FormatUtil
/// </summary>
public class ServerValidate
{
    public ServerValidate(){}

    public enum Type : int
    {
        Call_No,
        Copyright_Year,
        Title,
        Isbn,
        Author_No_Id,
        Publisher_Id
    }

    public static class FormatUtil
    {
        private static Dictionary<Type, string> _formats =
            new Dictionary<Type, string>()
            {
                { Type.Call_No, @"^[1-9]\d\d([-]\d{3}){2}$" }, //FROM 100-000-000 to 999-999-999
                { Type.Copyright_Year, @"^[1-9]\d{3}$" },//FROM 1000 - 9999
                { Type.Title, @"^(.|[Ññ]){1,50}$" },//All letters inncluding spaces and Special characters 
                { Type.Isbn, @"^[1-9]\d\d([-]\d{3}){2}$" },//FROM 100-000-000 to 999-999-999
                { Type.Author_No_Id, @"^[A-Z]{3}$" },//Allowable Values EX. PHP, PHL (A-Z - 3 Letters)
                { Type.Publisher_Id, @"^([1-9])|(\d\d)$"}//

                //{ FormatType.Call_No, @".+$" }, //FROM 100-000-000 to 999-999-999
                //{ FormatType.Copyright_Year, @"^.+$" },//FROM 1000 - 9999
                //{ FormatType.Title, @"^.+$" },//All letters inncluding spaces and Special characters 
                //{ FormatType.Isbn, @"^.+$" },//FROM 100-000-000 to 999-999-999
                //{ FormatType.Author_No_Id, @"^.+$" },//Allowable Values EX PHP, PHL (A-Z - 3 Letters)
                //{ FormatType.Publisher_Id, @"^.+"}//FROM 1 to 99
            };

        public static string GetFormat(Type type)
        {
            return _formats[type];
        }

        public static bool Try<T>(T value, bool isRequired, Type type)
        {
            bool isValid = true;

            if (value is string)
            {
                string str = value as string;

                if (isRequired)
                {
                    if (string.IsNullOrEmpty(str))
                    {
                        isValid = false;
                        throw new ArgumentNullException();
                    }

                    if (!Regex.IsMatch(str, _formats[type], RegexOptions.Singleline))
                    {
                        isValid = false;
                        throw new FormatException();
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(str) && !Regex.IsMatch(str, _formats[type], RegexOptions.Singleline))
                    {
                        isValid = false;
                        throw new FormatException();
                    }
                }
            }

            return isValid;
        }
    }
}